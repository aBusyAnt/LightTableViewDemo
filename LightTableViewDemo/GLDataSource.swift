//
//  GLDataSource.swift
//  LightTableViewDemo
//
//  Created by Grey.Luo on 16/8/23.
//  Copyright © 2016年 Grey. All rights reserved.
//

import Foundation
import UIKit

class GLDataSource<T>: NSObject, UITableViewDataSource {
    typealias ConfigCellHandle = (cell: UITableViewCell, item: T , indexPath: NSIndexPath) -> Void
    var items: [T] = []
    var cellIdentifier: String = ""
    var configCellHandle: ConfigCellHandle?
    
    convenience init(items: [T], cellIdentifier: String, configCellHandle:ConfigCellHandle) {
        self.init()
        
        self.items = items
        self.cellIdentifier = cellIdentifier
        self.configCellHandle = configCellHandle
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let item = items[indexPath.row]
        configCellHandle?(cell: cell, item: item, indexPath: indexPath)
        return cell
    }
}