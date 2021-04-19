//
//  MessageTableViewCell.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/16.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.white
        setUpSubViews()
        autoLayoutView()
    }
    
    //MARK: --setters
    ///icon
    var iconView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "first_recharge_gift_bg")
        return view
    }()
    ///上标题
    var upLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = COLORFROM16(h: 0x333333)
        label.text = "上标题"
        return label
    }()
    ///下标题
    var downLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = COLORFROM16(h: 0x999999)
        label.text = "小标题小标题小标题小标题"
        return label
    }()
    ///时间
    var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = COLORFROM16(h: 0x999999)
        label.text = "10:20"
        return label
    }()
    ///红点
    var redIcon: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.red
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        btn.layer.cornerRadius = 10
        btn.setTitle("99", for: .normal)
        return btn
    }()
    var line: UIView = {
        let lview = UIView()
        lview.backgroundColor = COLORFROM16(h: 0xF5F5F5)
        return lview
    }()

    func setUpSubViews() {
        contentView.addSubview(iconView)
        contentView.addSubview(upLabel)
        contentView.addSubview(downLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(redIcon)
        contentView.addSubview(line)
    }
    
    func autoLayoutView() {
        iconView.snp.makeConstraints { (make) in
            make.leading.equalTo(18)
            make.height.width.equalTo(38)
            make.bottom.equalTo(-17)
        }
        upLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(68)
            make.top.equalTo(iconView)
        }
        downLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(upLabel)
            make.bottom.equalTo(iconView)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(-19)
            make.centerY.equalTo(upLabel)
        }
        redIcon.snp.makeConstraints { (make) in
            make.trailing.equalTo(-27)
            make.height.width.equalTo(20)
            make.centerY.equalTo(downLabel)
        }
        line.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.leading.equalTo(20)
            make.trailing.equalTo(-19)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
