//
//  UserTableViewCellDelegate.swift
//  LightTableViewDemo
//
//  Created by Grey.Luo on 16/8/31.
//  Copyright © 2016年 Grey. All rights reserved.
//

import UIKit

class UserTableViewCellDelegate: UserCellDelegate {
    var dataSource: GLDataSource<User>
    var tableView: UITableView

    init(dataSource: GLDataSource<User>, tableView: UITableView) {
        self.dataSource = dataSource
        self.tableView = tableView
    }

    @objc func followBtnClickHandle(cell: UITableViewCell, btn: UIButton) {
        guard let indexPath = tableView.indexPathForCell(cell) else { return }
        let item = dataSource.items[indexPath.row]
        print("Follow User: \(item.name)")

    }
}
