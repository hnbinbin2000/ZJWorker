//
//  MineTableViewCell.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/16.
//

import UIKit

class MineTableViewCell: UITableViewCell {
    
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
    ///标题
    var upLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = COLORFROM16(h: 0x333333)
        label.text = "上标题"
        return label
    }()
    ///箭头
    var arrowView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "shouye_shezhi_youce")
        return view
    }()
    ///红点
    var redIcon: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.red
        btn.layer.cornerRadius = 2
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
        contentView.addSubview(arrowView)
        contentView.addSubview(redIcon)
        contentView.addSubview(line)
    }
    
    func autoLayoutView() {
        iconView.snp.makeConstraints { (make) in
            make.leading.equalTo(39)
            make.height.width.equalTo(23)
            make.centerY.equalToSuperview()
        }
        upLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(68)
            make.centerY.equalTo(iconView)
        }
        arrowView.snp.makeConstraints { (make) in
            make.trailing.equalTo(-19)
            make.centerY.equalToSuperview()
        }
        redIcon.snp.makeConstraints { (make) in
            make.trailing.equalTo(-27)
            make.height.width.equalTo(4)
            make.centerY.equalToSuperview()
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
