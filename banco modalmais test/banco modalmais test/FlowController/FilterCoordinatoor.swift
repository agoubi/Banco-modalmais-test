//
//  FilterCoordinatoor.swift
//  banco modalmais test
//
//  Created by zied on 28/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class FilterCoordinatoor: Coordinator {
    
    private let presenter: UINavigationController
    private var filterViewController: FilterViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let filterViewController = FilterViewController(nibName: nil, bundle: nil, viewModel: FilterViewModel())
        filterViewController.delegate = self
        presenter.pushViewController(filterViewController, animated: true)
        self.filterViewController = filterViewController
    }
}
 
extension FilterCoordinatoor: FilterViewDelegate {
    func closeFilter(_ filterViewController: FilterViewController) {
        presenter.popToRootViewController(animated: true)
    }
    
    func applyFilter(_ filterViewController: FilterViewController, filters: [FilterModel], orderListFilter: [FilterModel]) {
        let count = presenter.viewControllers.count
        if count > 1 {
            if let homeVC =  presenter.viewControllers[count - 2] as? HomeViewController {
                FilterTabBarCell.isAddingFilters = false
                homeVC.filters.removeAll()
                homeVC.orderListFilter.removeAll()
                homeVC.filterTabBarView.filterArray.removeAll()
                homeVC.filters = filters
                homeVC.orderListFilter = orderListFilter
                homeVC.heightFilterView.constant = 56
                homeVC.countNotification = filters.count + orderListFilter.count
                presenter.popToRootViewController(animated:true)
            }
        }
       
    }
    
}
