//
//  DecodeDataparser.swift
//  GitHubSearch
//
//  Created by Satoshi Komatsu on 2019/06/08.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation

struct JSONParser {
    
    static func parse(data: Data) -> Any {
        
        var repositories: Repositories!
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            repositories = try jsonDecoder.decode(Repositories.self, from: data)
        } catch {
            print(error.localizedDescription)
        }
        
        return repositories!
    }
}
