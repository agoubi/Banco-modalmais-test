//
//  Constants.swift
//  banco modalmais test
//
//  Created by zied on 27/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool, _ data:Data?) -> ()

//Header
let HEADER = [
    "Content-Type" : "application/json; charset=utf-8"
]

let BASE_URL = "https://api.github.com/search/repositories?q=language:swift&sort=stars"

