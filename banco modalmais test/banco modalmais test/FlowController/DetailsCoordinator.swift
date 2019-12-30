//
//  DetailsCoordinator.swift
//  banco modalmais test
//
//  Created by zied on 27/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import UIKit

class DetailsCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var detailsViewController: DetailsViewController?
    private let repositoryModel: RepositoryModel
    private var webRepositoryCoordinator: WebRepositoryCoordinator?

    init(presenter: UINavigationController, repositoryModel: RepositoryModel) {
        self.presenter = presenter
        self.repositoryModel = repositoryModel
    }

    func start() {
        let detailsViewController = DetailsViewController(nibName: nil, bundle: nil, viewModel: DetailsViewModel())
        detailsViewController.repositoryModel = repositoryModel
        detailsViewController.delegate = self
        presenter.pushViewController(detailsViewController, animated: true)
        self.detailsViewController = detailsViewController
    }
}

extension DetailsCoordinator: DetailsViewDelegate {
    func viewRepoOnWeb(_ detailsViewController: DetailsViewController, urlRepo: String) {
        let webRepositoryCoordinator = WebRepositoryCoordinator(presenter: presenter)
        webRepositoryCoordinator.urlRepo = urlRepo
        webRepositoryCoordinator.start()
        self.webRepositoryCoordinator = webRepositoryCoordinator
    }
    
    func goBackToHome(_ detailsViewController: DetailsViewController) {
        presenter.popToRootViewController(animated: true)
    }
}
