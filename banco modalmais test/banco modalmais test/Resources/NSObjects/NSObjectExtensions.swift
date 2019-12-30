//
//  NSObjectExtensions.swift
//  banco modalmais test
//
//  Created by ioasys on 24/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

extension NSObject {

    ///This function return a string containing the name o the class
    public static var className: String {
        return NSStringFromClass(self)
            .components(separatedBy: ".")
            .last ?? NSStringFromClass(self)
    }

}
