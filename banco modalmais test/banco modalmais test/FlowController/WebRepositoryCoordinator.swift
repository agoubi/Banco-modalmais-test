//
//  WebRepositoryCoordinator.swift
//  banco modalmais test
//
//  Created by zied on 29/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation
import UIKit

class WebRepositoryCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var webRepositoryViewController: WebRepositoryViewController?
    var urlRepo = ""

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let webRepositoryViewController = WebRepositoryViewController(nibName: nil, bundle: nil)
        webRepositoryViewController.urlReopo = urlRepo
        presenter.present(webRepositoryViewController, animated: true, completion: nil)
        self.webRepositoryViewController = webRepositoryViewController
    }
}
