//
//  SearchViewModel.swift
//  GitHubSearch
//
//  Created by Satoshi Komatsu on 2019/06/26.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchViewModel: NSObject {
    
    let disposeBag = DisposeBag()
    
}

extension SearchViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        return cell
    }
}
