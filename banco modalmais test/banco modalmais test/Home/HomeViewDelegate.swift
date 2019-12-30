//
//  HomeViewDelegate.swift
//  banco modalmais test
//
//  Created by zied on 24/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

protocol HomeViewDelegate: AnyObject {
    func goToDetailsRepository(_ homeViewController: HomeViewController, repositoryModel: RepositoryModel)
    func goToFilterRepositories(_ homeViewController: HomeViewController)
}
