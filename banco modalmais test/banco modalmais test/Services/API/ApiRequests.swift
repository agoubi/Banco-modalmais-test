//
//  ApiRequests.swift
//  banco modalmais test
//
//  Created by zied on 27/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

class ApiRequests {
    
    static let instance = ApiRequests()
    
    func getAllRepositories(page:Int,completion: @escaping CompletionHandler) {
        if let url = URL(string: "\(BASE_URL)&page=\(page)") {
           URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    completion(true,data)
                }
           }.resume()
        } else {
            completion(false, nil)
        }
    }
    
}
