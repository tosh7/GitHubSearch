//
//  GitHubAPI.swift
//  GitHubSearch
//
//  Created by Satoshi Komatsu on 2019/06/09.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import APIKit

final class GitHubAPI {
    private init() {}
    
    struct SearchRepository: GitHubRequest {
        
        typealias Response = SearchRepositoryResponse
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return GitHub.repositoryPath.rawValue
        }
        
        var parameters: Any? {
            return [
                "q": "Guruppu"
            ]
        }
    }
}
