//
//  ViewController.swift
//  LightTableViewDemo
//
//  Created by Grey.Luo on 16/8/23.
//  Copyright © 2016年 Grey. All rights reserved.
//

import UIKit
import SnapKit

extension User: UserCellData {
    var tagString: String {
        return "Tag: " + tag
    }
}

class ViewController: UIViewController {
    var dataSource: GLDataSource<User>?
    let cellIdentifier = "UserCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupUI()
        setupDataSource()
        fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var tableView: UITableView = {
        let v = UITableView(frame: .zero, style: .Plain)
        v.rowHeight = UITableViewAutomaticDimension
        v.estimatedRowHeight = 60
        return v
    }()
    
    lazy var dataManager: UserDataManager = {
        return UserDataManager()
    }()
    
    func setupUI() {
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
    }
    
    func setupDataSource() {
        tableView.registerClass(UserTableCell.self, forCellReuseIdentifier: cellIdentifier)

        dataSource = GLDataSource(items: dataManager.items, cellIdentifier: cellIdentifier, configCellHandle: { (cell, item, indexPath) in
            guard let aCell = cell as? UserTableCell else { return }
            aCell.data = item
        })
        tableView.dataSource = dataSource
    }

    func fetchData() {
        dataManager.fetchData { [weak self] (items) in
            self?.dataSource?.items = items
            self?.updateUI()
        }
    }

    func updateUI() {
        tableView.reloadData()
    }
}

