//
//  DecodeDataParser.swift
//  GitHubSearch
//
//  Created by Satoshi Komatsu on 2019/06/08.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import APIKit

struct DecodeDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }
    
    func parse(data: Data) throws -> Any {
        return data
    }
}
