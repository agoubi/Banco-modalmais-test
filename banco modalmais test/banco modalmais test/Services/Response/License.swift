//
//  License.swift
//  banco modalmais test
//
//  Created by zied on 27/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

public struct License: Codable {
    
    public var key: String?
    public var name: String?
    public var spdx_id: String?
    public var url: String?
    public var node_id: String?
    
    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case spdx_id = "spdx_id"
        case url = "url"
        case node_id = "node_id"
    }

}
