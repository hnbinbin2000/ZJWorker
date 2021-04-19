//
//  LeftRightTextLabel.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/17.
//

import UIKit

class LeftRightTextLabel: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(leftLabel)
        addSubview(rightLabel)
        leftLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(17)
            make.top.bottom.equalToSuperview()
        }
        rightLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(120)
            make.centerY.equalTo(leftLabel)
            make.trailing.equalToSuperview()
        }
    }
    
    public var leftLabel: UILabel = {
        let label = UILabel()
        label.textColor = COLORFROM16(h: 0x999999)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    public var rightLabel: UILabel = {
        let label = UILabel()
        label.textColor = COLORFROM16(h: 0x333333)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
