//
//  License.swift
//  banco modalmais test
//
//  Created by zied on 27/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

public struct License: Codable {
    
    var key: String?
    var name: String?
    var spdx_id: String?
    var url: String?
    var node_id: String?
    
    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case spdx_id = "spdx_id"
        case url = "url"
        case node_id = "node_id"
    }

}
