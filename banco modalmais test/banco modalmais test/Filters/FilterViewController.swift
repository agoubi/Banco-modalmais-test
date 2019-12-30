//
//  FilterViewController.swift
//  banco modalmais test
//
//  Created by zied on 26/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import UIKit
import RxSwift

class FilterViewController: UIViewController {
    
    //MARK: - Proprties
    var viewModel: FilterViewModel
    private let disposeBag = DisposeBag()
    var filterListArray = [FilterModel]()
    var orderFiltersList = [FilterModel]()
    
    //MARK: - Delegates
    weak var delegate: FilterViewDelegate?
    
    //MARK: - Outlets
    @IBOutlet var navigationHeader: HeaderView! {
        didSet{
            navigationHeader.leftButton.setImage(.icExit, for: .normal)
            navigationHeader.titleNavBarLabel.text = "Filtrar"
            navigationHeader.saerchButton.isHidden = true
            navigationHeader.imageNotification.isHidden = true
            navigationHeader.labelNotification.isHidden = true
            navigationHeader.filterButton.isHidden = true
            navigationHeader.leftButton.addTarget(self, action: #selector(closeFilterScreen(_:)), for: .touchUpInside)
            navigationHeader.clearButton.addTarget(self, action: #selector(clearAllFilters(_:)), for: .touchUpInside)
        }
    }
    
    @IBOutlet var filterLabel: UILabel!
    @IBOutlet var firstView: UIView!
    @IBOutlet var secondView: UIView!
    
    @IBOutlet var orderButtons: [UIButton]!{
        didSet{
            for item in orderButtons {
                item.layer.borderWidth = 1
                item.layer.borderColor = UIColor.darkGray.cgColor
                item.layer.cornerRadius = 4
            }
        }
    }
    
    public lazy var listFiltersView: SearchFilterTabBar = {
        let listFiltersView = SearchFilterTabBar(isAddingFilters: true)
        listFiltersView.translatesAutoresizingMaskIntoConstraints = false
        listFiltersView.backgroundColor = .clear
        listFiltersView.delegate = self
        return listFiltersView
    }()
    
    //MARK: - Initializers
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, viewModel: FilterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        bindObservables()
        viewModel.viewDidLoad()
        constraintUI()
    }
    
    //MARK: - Bind Observables
    private func bindObservables() {
        viewModel.reloadDataObservable
            .subscribe(onNext: { [unowned self] in self.handleReloadDataTableView() })
            .disposed(by: disposeBag)
    }

    //MARK: - HANDLERS
    private func handleReloadDataTableView() {
        DispatchQueue.main.async {
            self.listFiltersView.filterArray = self.viewModel.listFiltersView
            self.listFiltersView.filterCollectionView.reloadData()
        }
    }
    
    //MARK: - ConstraintUI
    func constraintUI(){
        
        firstView.addSubview(listFiltersView)
        
        NSLayoutConstraint.activate([
            listFiltersView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor),
            listFiltersView.topAnchor.constraint(equalTo: filterLabel.bottomAnchor, constant: 30),
            listFiltersView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -16),
            listFiltersView.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    //MARK: - Functions
    
    @IBAction func applyFilter(_ sender: UIButton) {
        if filterListArray.count == 0 {
            self.showAlert(alertText: "Error", alertMessage: "you have to choose an item to be sorted")
        } else {
            
            if filterListArray.contains(where: { filtermodel -> Bool in
                filtermodel.title == "ESTRELAS"
            }) && filterListArray.contains(where: { filtermodel -> Bool in
                filtermodel.title == "SEGUIDORE"
            }) {
                self.showAlert(alertText: "Error", alertMessage: "this filter can't be applied on the list")
            } else {
                if orderFiltersList.count == 0 {
                    self.showAlert(alertText: "Error", alertMessage: "you have to choose the sort type")
                } else {
                    delegate?.applyFilter(self, filters: filterListArray, orderListFilter: orderFiltersList)
                }
            }
        }
        
    }
    
    @IBAction func chooseOrderType(_ sender: UIButton) {
        
        let tag = sender.tag
            
            for button in orderButtons {
                if button.tag == tag {
                    button.setImage(.icCheckboxWhite, for: .selected)
                    button.isSelected = !button.isSelected
                    
                    if button.isSelected {
                        viewModel.stateButtonWhenSelected(button: button)
                        orderFiltersList.removeAll()
                        orderFiltersList.append(FilterModel(title: button.titleLabel?.text ?? "", isSelected: true))
                        viewModel.disableOrderTypeButton(button: button, orderButtons: orderButtons)
                    } else {
                        viewModel.statusButtonWhenDeselected(button: button)
                        for (index,item) in orderFiltersList.enumerated() {
                            if item.title == button.titleLabel?.text! {
                                orderFiltersList.remove(at: index)
                            }
                        }
                    }
            }
        }
    }
    
    @objc func closeFilterScreen(_ sender: UIButton){
        delegate?.closeFilter(self)
    }
    
    @objc func clearAllFilters(_ sender: UIButton){
        viewModel.clearAllTheFilter(orderButtons: orderButtons)
        listFiltersView.deleteAllFilters()
        orderFiltersList.removeAll()
        filterListArray.removeAll()
        listFiltersView.arrayChosenFilters.removeAll()
    }
}

extension FilterViewController: SearchFilterTabBarDelegate {
    func ChosenFilters(_ searchFilterTabBar: SearchFilterTabBar, selectedFilters: [FilterModel]) {
        filterListArray.removeAll()
        filterListArray = selectedFilters
    }
    
    func updateWhenFilterDeleted(_ searchFilterTabBar: SearchFilterTabBar, filterArray: [FilterModel]) {}
}
