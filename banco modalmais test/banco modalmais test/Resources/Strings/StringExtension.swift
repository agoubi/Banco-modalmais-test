//
//  StringExtension.swift
//  banco modalmais test
//
//  Created by zied on 27/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

extension String {
    
    func toDate(_ value: String) -> String? {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
           guard let date = dateFormatter.date(from: value) else {return nil}
           dateFormatter.dateFormat = "dd-MM-yyyy"
           dateFormatter.string(from: date)
           return dateFormatter.string(from: date)
    }
    
}
