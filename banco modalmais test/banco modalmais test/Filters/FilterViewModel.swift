//
//  FilterViewModel.swift
//  banco modalmais test
//
//  Created by zied on 26/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class FilterViewModel {
    
    let reloadDataObservable = PublishSubject<Void>()
    var listFiltersView = [FilterModel]()
    
    init() {
        
    }
    
    func viewDidLoad() {
        fillFilterArray()
    }
    
    func fillFilterArray() {
        listFiltersView = [FilterModel(title: "ESTRELAS", isSelected: false),
                           FilterModel(title: "SEGUIDORE", isSelected: false),
                           FilterModel(title: "DATA", isSelected: false)]
        reloadDataObservable.onNext(())
    }
    
    //MARK: - Functions
    
    func stateButtonWhenSelected(button: UIButton) {
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.setImage(.icCheckboxWhite, for: .selected)
        button.titleLabel?.tintColor = .white
        button.tintColor = .black
    }
    
    func statusButtonWhenDeselected(button: UIButton) {
        button.tintColor = .clear
        button.backgroundColor = .clear
        button.setTitleColor(.darkGray, for: .normal)
        button.setImage(nil, for: .normal)
    }
    
    func clearAllTheFilter(orderButtons: [UIButton]) {
        for item in orderButtons {
            item.isSelected = false
            statusButtonWhenDeselected(button: item)
        }
    }
    
    func disableOrderTypeButton(button: UIButton ,orderButtons: [UIButton]) {
        for item in orderButtons {
            if item.tag != button.tag {
                item.isSelected = false
                statusButtonWhenDeselected(button: item)
            }
        }
    }
    
}
