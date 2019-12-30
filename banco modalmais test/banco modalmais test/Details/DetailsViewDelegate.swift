//
//  DetailsViewDelegate.swift
//  banco modalmais test
//
//  Created by zied on 26/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

protocol DetailsViewDelegate {
    func goBackToHome(_ detailsViewController: DetailsViewController)
    func viewRepoOnWeb(_ detailsViewController: DetailsViewController, urlRepo:String)
}
