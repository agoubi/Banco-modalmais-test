//
//  DetailsViewController.swift
//  banco modalmais test
//
//  Created by zied on 26/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK: - Properties
    var viewModel: DetailsViewModel
    var repositoryModel: RepositoryModel?
    
    //MARK: - Delegates
    
    var delegate: DetailsViewDelegate?
    
    //MARK: - Outlets
    @IBOutlet var imageViewRepo: UIImageView!
    @IBOutlet var nameRepository: UILabel!
    @IBOutlet var totalStars: UILabel!
    @IBOutlet var nbrCommits: UILabel!
    @IBOutlet var nbrReleases: UILabel!
    @IBOutlet var nbrBranches: UILabel!
    @IBOutlet var nbvrColaborators: UILabel!
    @IBOutlet var navigationHeader: HeaderView!{
        didSet{
            navigationHeader.leftButton.setImage(.icBack, for: .normal)
            navigationHeader.titleNavBarLabel.text = "Detalhe"
            navigationHeader.clearButton.isHidden = true
            navigationHeader.saerchButton.isHidden = true
            navigationHeader.imageNotification.isHidden = true
            navigationHeader.labelNotification.isHidden = true
            navigationHeader.filterButton.isHidden = true
            navigationHeader.leftButton.addTarget(self, action: #selector(clickButtonBack(_:)), for: .touchUpInside)
        }
    }
    
    ///Views
    @IBOutlet var globalView: UIView! {
        didSet{
            globalView.layer.cornerRadius = 16
        }
    }
    @IBOutlet var repositoryView: UIView!{
        didSet{
            repositoryView.layer.cornerRadius = 16
        }
    }
    
    //MARK: - Initializers
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, viewModel: DetailsViewModel) {
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
        guard let repository = repositoryModel else {return}
        DispatchQueue.main.async {
            let url = URL(string: repository.owner?.avatar_url ?? "")
            self.imageViewRepo?.load(url: url!)
        }
        
        self.nameRepository.text = repository.name ?? ""
        totalStars.text = "\(repository.stargazers_count ?? 0)"
        nbrCommits.text = "\(repository.open_issues ?? 0)"
        nbrReleases.text = "\(repository.forks_count ?? 0)"
        nbrBranches.text = "\(repository.forks ?? 0)"
        nbvrColaborators.text = "\(repository.watchers_count ?? 0)"
    }
    
    //MARK: - Function
    @objc func clickButtonBack(_ sender: UIButton) {
        delegate?.goBackToHome(self)
    }
    
    @IBAction func shareAction(_ sender: UIButton) {
        delegate?.goBackToHome(self)
    }
    
    @IBAction func openWebView(_ sender: UIButton) {
        guard let urlrepo = repositoryModel?.html_url else { return }
        delegate?.viewRepoOnWeb(self, urlRepo: urlrepo)
    }
    
}
