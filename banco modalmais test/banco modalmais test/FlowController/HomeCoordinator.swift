//
//  HomeCoordinator.swift
//  banco modalmais test
//
//  Created by zied on 27/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var homeViewController: HomeViewController?
    private var detailsCoordinator: DetailsCoordinator?
    private var filterCoordinatoor: FilterCoordinatoor?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let homeViewController = HomeViewController(nibName: nil, bundle: nil, viewModel: HomeViewModel())
        homeViewController.delegate = self
        presenter.pushViewController(homeViewController, animated: true)
        self.homeViewController = homeViewController
    }
}

extension HomeCoordinator: HomeViewDelegate {
    func goToDetailsRepository(_ homeViewController: HomeViewController, repositoryModel: RepositoryModel) {
        let detailsCoordinator = DetailsCoordinator(presenter: presenter, repositoryModel: repositoryModel)
        detailsCoordinator.start()
        self.detailsCoordinator = detailsCoordinator
    }
    
    
    func goToFilterRepositories(_ homeViewController: HomeViewController) {
        let filterCoordinatoor = FilterCoordinatoor(presenter: presenter)
        filterCoordinatoor.start()
        self.filterCoordinatoor = filterCoordinatoor
    }
}

