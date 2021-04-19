//
//  CreditTableViewCell.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/17.
//

import UIKit

class CreditTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpSubViews()
        autoLayoutView()
    }
    
    func setUpSubViews() {
        contentView.backgroundColor = COLORFROM16(h: 0xf6f6f6)
        contentView.addSubview(bgView)
        bgView.addSubview(nameLabel)
        bgView.addSubview(button)
        bgView.addSubview(countTitleLabel)
        bgView.addSubview(countLabel)
        bgView.addSubview(dateTitleLabel)
        bgView.addSubview(dateLabel)
        bgView.addSubview(statusTitleLabel)
        bgView.addSubview(statusLabel)
    }
    func autoLayoutView() {
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.leading.equalTo(17)
            make.trailing.equalTo(-17)
            make.bottom.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(16)
            make.leading.equalTo(16)
        }
        countTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
        }
        countLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(105)
            make.centerY.equalTo(countTitleLabel)
        }
        dateTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(countTitleLabel.snp.bottom).offset(10)
        }
        dateLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(105)
            make.centerY.equalTo(dateTitleLabel)
        }
        statusTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(dateTitleLabel.snp.bottom).offset(10)
        }
        statusLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(105)
            make.centerY.equalTo(statusTitleLabel)
        }
        button.snp.makeConstraints { (make) in
            make.trailing.equalTo(-18)
            make.height.equalTo(24)
            make.width.equalTo(63)
            make.centerY.equalTo(nameLabel)
        }
        
    }
    
    //MARK: --varible
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = COLORFROM16(h: 0x333333)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "申请人：某"
        return label
    }()
    //贷款金额
    var countTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = COLORFROM16(h: 0x999999)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "贷款金额"
        return label
    }()
    var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = COLORFROM16(h: 0x333333)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "万元"
        return label
    }()
    //贷款期限
    var dateTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = COLORFROM16(h: 0x999999)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "贷款期限"
        return label
    }()
    var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = COLORFROM16(h: 0x333333)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "个月"
        return label
    }()
    //状态
    var statusTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = COLORFROM16(h: 0x999999)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "状态"
        return label
    }()
    var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = COLORFROM16(h: 0xFF0000)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "已逾期"
        return label
    }()
    //按钮
    var button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = COLORFROM16(h: 0x008CF8)
        btn.setTitle("催收", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.cornerRadius = 12
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        return btn
    }()
    //背景图
    var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 8
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
