//
//  Utilities.swift
//  GitHubSearch
//
//  Created by Satoshi Komatsu on 2019/06/09.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation

enum GitHub: String {
    
    case baseUrl = "https://api.github.com"
    case repositoryPath = "/search/repositories"
    
}

enum LoadStatus: String {
    
    case loading = "ローディング中"
    case nothing = "該当なし"
    case fail    = "ロード失敗"
    
}
