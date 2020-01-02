//
//  FilterViewDelegate.swift
//  banco modalmais test
//
//  Created by zied on 29/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

protocol FilterViewDelegate: AnyObject {
    ///this function is used to get the filters that needs to be applied on the list
    func closeFilter(_ filterViewController: FilterViewController)
    ///this function is used to handle the action when the user delete one of the filters 
    func applyFilter(_ filterViewController: FilterViewController, filters: [FilterModel], orderListFilter: [FilterModel])
}
