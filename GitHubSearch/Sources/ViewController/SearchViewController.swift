//
//  ViewController.swift
//  GitHubSearch
//
//  Created by Satoshi Komatsu on 2019/05/08.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

import DZNEmptyDataSet
import RxSwift
import RxCocoa
import APIKit

final class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate   = self
        }
    }
    var repos: SearchRepositoryResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Session.send(GitHubAPI.SearchRepository(query: "Guruppu")) { result in
            print(result)
            switch result {
            case .success(let response):
                print(response)
            
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos?.total_count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        return cell!
    }

}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: DZNEmptyDataSetSource {
    
}

