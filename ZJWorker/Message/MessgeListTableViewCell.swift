//
//  MessgeListTableViewCell.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/16.
//

import UIKit

class MessgeListTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = COLORFROM16(h: 0xf6f6f6)
        setUpSubViews()
        autoLayoutView()
    }
    
    func setUpSubViews() {
        contentView.addSubview(timeBgView)
        timeBgView.addSubview(timeLabel)
        contentView.addSubview(icon)
        contentView.addSubview(iconLabel)
        contentView.addSubview(bgView)
        bgView.addSubview(contentTitleLabel)
        bgView.addSubview(checkImageView)
        bgView.addSubview(checkedLabel)
        bgView.addSubview(subDesLabel)
        bgView.addSubview(detailDesLabel)
        bgView.addSubview(line)
        bgView.addSubview(seeLabel)
        bgView.addSubview(arrow)
    }
    
    func autoLayoutView() {
        timeBgView.snp.makeConstraints { (make) in
            make.top.equalTo(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(28)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        icon.snp.makeConstraints { (make) in
            make.leading.equalTo(19)
            make.top.equalTo(timeBgView.snp.bottom).offset(17)
            make.width.height.equalTo(26)
        }
        iconLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(icon.snp.trailing).offset(9)
            make.centerY.equalTo(icon)
        }
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(iconLabel.snp.bottom).offset(14)
            make.leading.equalTo(54)
            make.trailing.equalTo(-40)
            make.bottom.equalToSuperview()
        }
        contentTitleLabel.snp.makeConstraints { (make) in
            make.top.leading.equalTo(13)
        }
        checkImageView.snp.makeConstraints { (make) in
            make.top.equalTo(60)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(48)
        }
        checkedLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(checkImageView.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview()
        }
        subDesLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(13)
            make.trailing.equalTo(-13)
            make.top.equalTo(170)
        }
        detailDesLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(subDesLabel)
            make.top.equalTo(subDesLabel.snp.bottom).offset(8)
        }
        line.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.top.equalTo(detailDesLabel.snp.bottom).offset(10)
        }
        seeLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(13)
            make.top.equalTo(line.snp.bottom).offset(15)
            make.bottom.equalTo(bgView.snp.bottom).offset(-13)
        }
        arrow.snp.makeConstraints { (make) in
            make.trailing.equalTo(-16)
            make.centerY.equalTo(seeLabel)
        }
    }
    
    //时间
    var timeBgView: UIView = {
        let view = UIView()
        view.backgroundColor = COLORFROM16(h: 0xdddddd)
        view.layer.cornerRadius = 16
        return view
    }()
    var timeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.text = "0 0 00:00"
        label.textColor = UIColor.white
        return label
    }()
    
    //icon+title
    var icon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "shouye_icon_kaoqin")
        return view
    }()
    var iconLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = COLORFROM16(h: 0x4a4a4a)
        label.text = "打卡考勤"
        return label
    }()
    
    //内容
    var bgView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        return view
    }()
    var contentTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = COLORFROM16(h: 0x4a4a4a)
        label.text = "上周考勤周报"
        return label
    }()
    //签到图标
    var checkImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "shouye_icon_wancheng")
        return view
    }()
    var checkedLabel: UILabel = {
        let label = UILabel()
        label.text = "您的考勤无异常记录"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = COLORFROM16(h: 0x008CF8)
        label.textAlignment = .center
        return label
    }()
    //2行文本
    var subDesLabel: UILabel = {
        let label = UILabel()
        label.text = "2021.03.01-2021.03.07"
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = COLORFROM16(h: 0x333333)
        label.numberOfLines = 0
        return label
    }()
    var detailDesLabel: UILabel = {
        let label = UILabel()
        label.text = "工作辛苦了，上周考勤没有任何异常，太棒了！"
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = COLORFROM16(h: 0x333333)
        label.numberOfLines = 0
        return label
    }()
    var line: UIView = {
        let view = UIView()
        view.backgroundColor = COLORFROM16(h: 0xf0f0f0)
        return view
    }()
    //查看详情
    var seeLabel: UILabel = {
        let label = UILabel()
        label.text = "查看详情"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = COLORFROM16(h: 0x333333)
        return label
    }()
    var arrow: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "shouye_shezhi_youce")
        return view
    }()
    
    
    
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
