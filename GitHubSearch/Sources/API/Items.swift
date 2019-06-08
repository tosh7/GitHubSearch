//
//  Repository.swift
//  GitHubSearch
//
//  Created by Satoshi Komatsu on 2019/05/08.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation

struct Repositories: Codable {
    
    var totalCount: Int
    var incompletResults: Bool
    var items: [Items]
    
}

struct Items: Codable {
    
    var name: String
    var description: String
    var url: String
    var owner: owner
    
}

struct owner: Codable {
    
    var login: String
    
}
