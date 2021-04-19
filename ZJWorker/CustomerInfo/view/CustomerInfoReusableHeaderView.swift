//
//  CustomerInfoReusableHeaderView.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/17.
//

import UIKit
/**
  ｜ xxxx
 */

class CustomerInfoReusableHeaderView: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.backgroundColor = COLORFROM16(h: 0xF6F6F6)
        addSubview(line)
        addSubview(titleLabel)
        line.snp.makeConstraints { (make) in
            make.leading.equalTo(34)
            make.centerY.equalToSuperview()
            make.height.equalTo(19)
            make.width.equalTo(3)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(47)
            make.centerY.equalTo(line)
        }
    }
    
    var line: UIView = {
        let view = UIView()
        view.backgroundColor = COLORFROM16(h: 0x008CF8)
        return view
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = COLORFROM16(h: 0x333333)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "标题头"
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
