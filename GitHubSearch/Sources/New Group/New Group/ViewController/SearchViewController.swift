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

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate   = self
        }
    }
    var repos: [Repository]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell
    }
    
    
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: DZNEmptyDataSetSource {
    
}

