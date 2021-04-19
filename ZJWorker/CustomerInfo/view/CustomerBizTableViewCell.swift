//
//  CustomerBizTableViewCell.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/17.
//

import UIKit
/**
 客户信息--业务明细
 */
enum CellPosition {
    case up
    case center
    case down
}

class CustomerBizTableViewCell: UITableViewCell,ViewInitProtocol {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = COLORFROM16(h: 0xF6F6F6)
        setUpSubViews()
        autoLayoutView()
    }
    
    //圆角和低线的控制
    public func setPosition(posi:CellPosition) {
        switch posi {
        case .up:
            break
        case .center:
            break
        case .down:
            break
        }
    }
    //办理按钮状态
    func buttonCanUse(canUse:Bool) {
        button.isUserInteractionEnabled = canUse
        if canUse {
            button.borderColor = COLORFROM16(h: 0xF08E47)
            button.setTitle("去办理", for: .normal)
            button.setTitleColor(COLORFROM16(h: 0xFF974B), for: .normal)
        } else {
            button.borderColor = COLORFROM16(h: 0xdddddd)
            button.setTitle("已办理", for: .normal)
            button.setTitleColor(COLORFROM16(h: 0xcccccc), for: .normal)
        }
    }

    func setUpSubViews() {
        contentView.addSubview(bgView)
        bgView.addSubview(icon)
        bgView.addSubview(titleLabel)
        bgView.addSubview(subTitleLabel)
        bgView.addSubview(button)
        bgView.addSubview(line)
    }
    func autoLayoutView() {
        bgView.snp.makeConstraints { (make) in
            make.leading.equalTo(17)
            make.trailing.equalTo(-17)
            make.top.bottom.equalToSuperview()
        }
        icon.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.top.equalTo(16)
            make.width.height.equalTo(19)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(48)
            make.centerY.equalTo(icon)
        }
        subTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview().offset(-12)
        }
        button.snp.makeConstraints { (make) in
            make.trailing.equalTo(-12)
            make.top.equalTo(32)
            make.height.equalTo(24)
            make.width.equalTo(63)
        }
        line.snp.makeConstraints { (make) in
            make.leading.equalTo(9)
            make.trailing.equalTo(-9)
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
    }
    //背图
    var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    //icon
    var icon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "shouye_yewu_iconn_shouji")
        return view
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "业务名称"
        label.textColor = COLORFROM16(h: 0x333333)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "业务名称"
        label.textColor = COLORFROM16(h: 0x999999)
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    //办理按钮
    var button: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 12
        btn.borderWidth = 1
        btn.borderColor = COLORFROM16(h: 0xF08E47)
        btn.setTitle("去办理", for: .normal)
        btn.setTitleColor(COLORFROM16(h: 0xFF974B), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        return btn
    }()
    //分割线
    var line: UIView = {
        let view = UIView()
        view.backgroundColor = COLORFROM16(h: 0xf0f0f0)
        return view
    }()
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
