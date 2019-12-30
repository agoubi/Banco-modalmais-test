//
//  RepositoriesModel.swift
//  banco modalmais test
//
//  Created by zied on 27/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

public struct RepositoriesModel: Codable {
    
    public var total_count:Int?
    public var incomplete_results: Bool?
    public var items: [RepositoryModel]?
    
    enum CodingKeys: String, CodingKey {
        case total_count = "total_count"
        case incomplete_results = "incomplete_results"
        case items = "items"
    }

}
