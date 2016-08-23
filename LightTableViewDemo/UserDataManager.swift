//
//  UserDataManager.swift
//  LightTableViewDemo
//
//  Created by Grey.Luo on 16/8/23.
//  Copyright © 2016年 Grey. All rights reserved.
//

import Foundation


class UserDataManager{
    var items: [User] = []
    
    typealias FetchDataHandle = ([User] -> Void)
    
    func fetchData(handle: FetchDataHandle) {
        items = [User](count: 20, repeatedValue: User())
        handle(items)
    }
}