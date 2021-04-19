//
//  HomeMenuReusableFooterView.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/16.
//

import UIKit

class HomeMenuReusableFooterView: UICollectionReusableView {
    var line: UIView = {
        let label = UIView()
        label.backgroundColor = COLORFROM16(h: 0xf2f2f2)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(line)
        line.snp.makeConstraints { (make) in
            make.leading.equalTo(14)
            make.trailing.equalTo(-4)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
