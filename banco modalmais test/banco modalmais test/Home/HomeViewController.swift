//
//  HomeViewController.swift
//  banco modalmais test
//
//  Created by zied on 24/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class HomeViewController: UIViewController {

    //MARK: - Constants
    struct Metrics{
        static var heightCell: CGFloat = 171
    }
    
    //MARK: - Private proprties
    private var viewModel: HomeViewModel
    private let disposeBag = DisposeBag()
    
    ///the list that contains the items use to sort the the list of repositories
    var filters = [FilterModel]()
    ///the list  that contains the way that the list of the repositories is going to be sorted
    var orderListFilter = [FilterModel]()
    ///this list contains the repositories searched on the search bar
    var searchListRepositories = [RepositoryModel]()
    ///Pull refresh control
    private let refreshControl = UIRefreshControl()
    
    ///update the number of filters added
    var countNotification = 0 {
        didSet{
            headerView.labelNotification.text = "\(countNotification)"
            if countNotification == 0 {
                self.heightFilterView.constant = 0
            } else {
                searchListRepositories.removeAll()
                viewModel.orderListRepositories(orderListFilter: orderListFilter, filters: filters)
                searchListRepositories = viewModel.repositories
                gitRepoTableView.reloadData()
            }
        }
    }
    
    //MARK: - Delegates
    weak var delegate: HomeViewDelegate?
    
    //MARK: - Outlets
        
    @IBOutlet var headerView: HeaderView!{
        didSet{
            headerView.leftButton.isHidden = true
            headerView.clearButton.isHidden = true
            headerView.configure(title: "Github")
            headerView.labelNotification.text = "\(countNotification)"
            headerView.filterButton.addTarget(self, action: #selector(goToFilterController(_:)), for: .touchUpInside)
        }
    }
    @IBOutlet var gitRepoTableView: UITableView!{
        didSet {
            gitRepoTableView.delegate = self
            gitRepoTableView.dataSource = self
        }
    }
    @IBOutlet var searchView: SearchView! {
        didSet {
            searchView.configure(title: "FILTRAR POR NOME ?")
            searchView.searchBar.delegate = self
        }
    }
    
    @IBOutlet var filterView: UIView!
    @IBOutlet var heightFilterView: NSLayoutConstraint!
    
    public lazy var filterTabBarView: SearchFilterTabBar = {
        let filterTabBarView = SearchFilterTabBar(isAddingFilters: false)
        filterTabBarView.translatesAutoresizingMaskIntoConstraints = false
        filterTabBarView.backgroundColor = .clear
        filterTabBarView.delegate = self
        return filterTabBarView
    }()
    
    
    
    //MARK: - Initializers
    
    init(nibName nibNameOrNil: String?,
         bundle nibBundleOrNil: Bundle?, viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .lightGray
        bindObservables()
        viewModel.viewDidLoad()
        constraintUI()
        gitRepoTableView.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellReuseIdentifier: "HomeViewCell")
        refreshControl.tintColor = .red
        if #available(iOS 10.0, *) {
            gitRepoTableView.refreshControl = refreshControl
        } else {
            gitRepoTableView.addSubview(refreshControl)
        }
        
        refreshControl.addTarget(self, action: #selector(self.reloadReposirories), for: .valueChanged)
    }
    
    //MARK: - Bind Observables
    private func bindObservables() {
        viewModel.reloadDataObservable
            .subscribe(onNext: { [unowned self] in self.handleReloadDataTableView() })
            .disposed(by: disposeBag)
        
        viewModel.loadingObservable
        .subscribe(onNext: { [weak self] in self?.handleLoading($0) })
        .disposed(by: disposeBag)
    }

    //MARK: - HANDLERS
    private func handleReloadDataTableView() {
        DispatchQueue.main.async {
            self.searchListRepositories.removeAll()
            self.searchListRepositories = self.viewModel.repositories
            self.gitRepoTableView.reloadData()
            if self.filterTabBarView.filterArray.isEmpty {
                UIView.animate(withDuration: 3) {
                    self.heightFilterView.constant = 0
                }
            }
        }
    }
    
    private func handleLoading(_ loading: Bool) {
        DispatchQueue.main.async {
            if loading {
                self.showSpinner(onView: self.view)
            } else {
                self.removeSpinner()
            }
        }
    }
    
    //MARK: - constraint layout
    func constraintUI(){
        
        filterView.addSubview(filterTabBarView)
        
        NSLayoutConstraint.activate([
            filterTabBarView.leadingAnchor.constraint(equalTo: filterView.leadingAnchor),
            filterTabBarView.trailingAnchor.constraint(equalTo: filterView.trailingAnchor),
            filterTabBarView.topAnchor.constraint(equalTo: filterView.topAnchor),
            filterTabBarView.bottomAnchor.constraint(equalTo: filterView.bottomAnchor),
        ])
    }
    
    //MARK: - Functions
    @IBAction func clearAllFilter(_ sender: UIButton) {
        filters.removeAll()
        orderListFilter.removeAll()
        countNotification = 0
        viewModel.viewDidLoad(start: 1)
    }
    
    @objc func goToFilterController(_ sender: UIButton){
        delegate?.goToFilterRepositories(self)
    }
    
    @objc func reloadReposirories()
    {
        viewModel.viewDidLoad(start: 1)
        self.refreshControl.endRefreshing()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchListRepositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell", for: indexPath) as? HomeViewCell else {
            return UITableViewCell()
        }
        let repo = searchListRepositories[indexPath.row]
        cell.configure(repository: repo)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        ///check if the user is scrolling and check the business logic of the infinate pagination
        if (indexPath.row == searchListRepositories.count - 1) && (viewModel.isloading == false) && (viewModel.haveMore == true) {
            viewModel.start = viewModel.start + 1
            viewModel.isloading = true
            viewModel.viewDidLoad(start: viewModel.start)
            if filters.count != 0 {
                countNotification = orderListFilter.count + filters.count
                gitRepoTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Metrics.heightCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.goToDetailsRepository(self, repositoryModel: searchListRepositories[indexPath.row])
    }
}

extension HomeViewController: SearchFilterTabBarDelegate {

    func updateWhenFilterDeleted(_ searchFilterTabBar: SearchFilterTabBar, filterArray: [FilterModel], deletedFilter: String, selectedIndex: Int){
        
        if filterArray.isEmpty || filters.isEmpty {
            UIView.animate(withDuration: 3) {
                self.filters.removeAll()
                self.orderListFilter.removeAll()
                self.countNotification = 0
                self.viewModel.viewDidLoad(start: 1)
            }
        } else {
            
            if filterArray[selectedIndex].title == "CRESCENTE" || filterArray[selectedIndex].title == "DECRESCENTE" {
                self.showAlert(alertText: "erro", alertMessage: "o sinal de pedido é necessário para classificar a lista")
            } else {
                if filters.count == 1 {
                    self.showAlert(alertText: "erro", alertMessage: "esse filtro pode ser aplicado para classificar a lista")
                } else {
                    for (index,item) in filters.enumerated() {
                        if item.title == deletedFilter {
                            filters.remove(at: index)
                        }
                    }
                    searchFilterTabBar.deleteFilter(index: selectedIndex)
                    searchFilterTabBar.filterCollectionView.reloadData()
                    countNotification = filters.count+orderListFilter.count
                    gitRepoTableView.reloadData()
                }
            }
        }
    }
    
    func ChosenFilters(_ searchFilterTabBar: SearchFilterTabBar, selectedFilters: [FilterModel]) {
        
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            searchListRepositories.removeAll()
            viewModel.start = 1
            viewModel.isloading = false
            viewModel.haveMore = true
            viewModel.viewDidLoad(start: viewModel.start)
            return
        }

        viewModel.isloading = true
        viewModel.haveMore = false
        searchListRepositories = viewModel.repositories.filter({ (repo) -> Bool in
            let name = repo.name ?? ""
            return name.lowercased().hasPrefix(searchText.lowercased())
        })
        gitRepoTableView.reloadData()
        
    }
}
