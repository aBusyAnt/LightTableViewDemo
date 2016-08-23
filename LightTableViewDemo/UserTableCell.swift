//
//  UserTableCell.swift
//  LightTableViewDemo
//
//  Created by Grey.Luo on 16/8/23.
//  Copyright © 2016年 Grey. All rights reserved.
//

import UIKit

protocol UserCellData {
    var name: String { get }
    var website: String { get }
    var tagString: String { get }
}


class UserTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var data: UserCellData? {
        didSet {
            guard let cellData = data else { return }
            
            nameLabel.text = cellData.name
            websiteBtn.setTitle(cellData.website, forState: .Normal)
            tagLabel.text = cellData.tagString
            
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(nameLabel)
        addSubview(websiteBtn)
        addSubview(tagLabel)
    }
    
    func setupConstraints() {
        nameLabel.snp_makeConstraints { (make) in
            make.left.top.equalTo(self).offset(5)
            make.right.equalTo(self).offset(-5)
        }
        websiteBtn.snp_makeConstraints { (make) in
            make.left.right.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp_bottom).offset(5)
        }
        tagLabel.snp_makeConstraints { (make) in
            make.left.right.equalTo(nameLabel)
            make.top.equalTo(websiteBtn.snp_bottom).offset(5)
            make.bottom.equalTo(self).offset(-5)
        }
    }
    
    lazy var nameLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont.boldSystemFontOfSize(14)
        v.textColor = UIColor.redColor()
        return v
    }()
    
    lazy var websiteBtn: UIButton = {
        let v = UIButton()
        v.setTitleColor(UIColor.blueColor(), forState: .Normal)
        return v
    }()
    
    lazy var tagLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont.systemFontOfSize(12)
        v.textColor = UIColor.grayColor()
        return v
    }()
    
}
