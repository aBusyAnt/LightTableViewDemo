//
//  GLTableDelegate.swift
//  LightTableViewDemo
//
//  Created by Grey.Luo on 16/8/31.
//  Copyright © 2016年 Grey. All rights reserved.
//

import UIKit

@objc class GLTableDelegate: NSObject, UITableViewDelegate {
    var dataSource: GLDataSource<User>

    init(dataSource: GLDataSource<User>) {
        self.dataSource = dataSource
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = dataSource.items[indexPath.row]
        print("Select user: \(item.name)")
    }
}
