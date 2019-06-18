//
//  GitHubRequest.swift
//  GitHubSearch
//
//  Created by Satoshi Komatsu on 2019/06/08.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import APIKit

protocol GitHubRequest: Request { }

extension GitHubRequest {
//    var baseURL: URL {
//        return URL(string: GitHub.baseUrl.rawValue)!
//    }
    
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
}

extension GitHubRequest where Response: Codable {
    var dataParser: DataParser {
        return DecodeDataParser()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        
        guard let data = object as? Data else {
            return ResponseError.unexpectedObject(object) as! Self.Response
        }
        
        let jsonDecorder = JSONDecoder()
        jsonDecorder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try jsonDecorder.decode(Response.self, from: data)
    }
}
