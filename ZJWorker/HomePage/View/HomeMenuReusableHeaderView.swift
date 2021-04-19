//
//  HomeMenuReusableHeaderView.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/16.
//

import UIKit

class HomeMenuReusableHeaderView: UICollectionReusableView {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = COLORFROM16(h: 0x333333)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(14)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
