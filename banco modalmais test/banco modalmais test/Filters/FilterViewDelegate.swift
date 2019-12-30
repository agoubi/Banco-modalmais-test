//
//  FilterViewDelegate.swift
//  banco modalmais test
//
//  Created by zied on 29/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

protocol FilterViewDelegate: AnyObject {
    func closeFilter(_ filterViewController: FilterViewController)
    func applyFilter(_ filterViewController: FilterViewController, filters: [FilterModel], orderListFilter: [FilterModel])
}
