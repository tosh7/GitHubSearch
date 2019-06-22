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
import SVProgressHUD

final class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate   = self
            tableView.register(
                UINib(resource: R.nib.customTableViewCell),
                forCellReuseIdentifier: "cell"
            )
            tableView.rowHeight = 60
        }
    }
    var repos: SearchRepositoryResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.show(withStatus: LoadStatus.loading.rawValue)
        
        Session.send(GitHubAPI.SearchRepository(query: "giiisaaa")) { result in
            switch result {
            case .success(let response):
                self.repos = response
                self.tableView.reloadData()
                print(response)
                SVProgressHUD.dismiss()
                
                if response.totalCount == 0 {
                    SVProgressHUD.showError(withStatus: LoadStatus.nothing.rawValue)
                }
                
            case .failure(let error):
                SVProgressHUD.showError(withStatus: LoadStatus.fail.rawValue)
                print(error)
            }
        }
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _repos = repos else { return 0 }
        
        if _repos.totalCount >= 30 {
            return 30
        } else {
            return _repos.totalCount
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        if let _repos = repos {
            cell.nameLabel.text         = _repos.items[indexPath.row].name
            cell.loginLabel.text        = _repos.items[indexPath.row].owner.login
            cell.descriptionLabel.text  = _repos.items[indexPath.row].description
        }
        
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: DZNEmptyDataSetSource {
    
}

