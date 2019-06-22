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
    
    //classの中にstructを置くことによっていろんな種類のAPIを叩けるようになる
    struct SearchRepository: GitHubRequest {
        
        let query: String
//        let page: Int = 1   //一旦一ページにしてるけど、ロードできたらなお良い
        
        typealias Response = SearchRepositoryResponse
        
        //Getterにしておかないと通信を行う際にお隊を入れる必要が出てくる
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return GitHub.repositoryPath.rawValue
        }
        
        var parameters: Any? {
            return [
                "q": query,
                "page": 1
            ]
        }
    }
}
