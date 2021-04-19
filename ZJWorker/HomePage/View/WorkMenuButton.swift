//
//  WorkMenuButton.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/15.
//

import UIKit

class WorkMenuButton: UIButton {
    
    ///icon
    private var iconView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    ///text
    private var tlabel: UILabel = {
        let label = UILabel()
        label.textColor = COLORFROM16(h: 0x303237)
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconView)
        addSubview(tlabel)
        iconView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(0)
            make.height.width.equalTo(38)
        }
        tlabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
    }
    
    func setIconImage(name:String){
        iconView.image = UIImage.init(named: name)
    }   
    func setTitle(title:String) {
        tlabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
