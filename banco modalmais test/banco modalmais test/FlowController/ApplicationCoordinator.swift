//
//  ApplicationCoordinator.swift
//  banco modalmais test
//
//  Created by zied on 26/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    let homeCoordinator: HomeCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
    
        homeCoordinator = HomeCoordinator(presenter: rootViewController)
    }
  
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        homeCoordinator.start()
    }
}
