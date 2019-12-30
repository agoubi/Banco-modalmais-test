//
//  SearchFilterTabBarDelegate.swift
//  banco modalmais test
//
//  Created by zied on 25/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

public protocol SearchFilterTabBarDelegate: AnyObject {
    func ChosenFilters(_ searchFilterTabBar: SearchFilterTabBar, selectedFilters: [FilterModel])
    func updateWhenFilterDeleted(_ searchFilterTabBar: SearchFilterTabBar, filterArray :[FilterModel])
}
