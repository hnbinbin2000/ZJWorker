//
//  SystemStationTableCell.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/17.
//

import UIKit

enum StationLevel {
    case first
    case second
    case third
}

class SystemStationTableCell: UITableViewCell,ViewInitProtocol {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.white
        setUpSubViews()
        autoLayoutView()
    }
    
    //样式配置
    public func setStationLevel(level:StationLevel) {
        switch level {
        case .first:
            iconView.isHidden = true
            arrowView.isHidden = false
            nameLabel.snp.updateConstraints { (make) in
                make.leading.equalTo(25)
            }
            break
        case .second:
            iconView.isHidden = false
            arrowView.isHidden = false
            nameLabel.snp.updateConstraints { (make) in
                make.leading.equalTo(80)
            }
            break
        case .third:
            iconView.isHidden = false
            arrowView.isHidden = true
            nameLabel.snp.updateConstraints { (make) in
                make.leading.equalTo(80)
            }
            break
        }
    }
    
    //MARK: --setters
    ///icon
    var iconView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "first_recharge_gift_bg")
        return view
    }()
    ///标题
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = COLORFROM16(h: 0x333333)
        label.text = "名字"
        return label
    }()
    ///箭头
    var arrowView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "shouye_shezhi_youce")
        return view
    }()
    var line: UIView = {
        let lview = UIView()
        lview.backgroundColor = COLORFROM16(h: 0xF5F5F5)
        return lview
    }()

    func setUpSubViews() {
        contentView.addSubview(iconView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(arrowView)
        contentView.addSubview(line)
    }
    
    func autoLayoutView() {
        iconView.snp.makeConstraints { (make) in
            make.leading.equalTo(25)
            make.height.width.equalTo(34)
            make.centerY.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(80)
            make.centerY.equalTo(iconView)
        }
        arrowView.snp.makeConstraints { (make) in
            make.trailing.equalTo(-23)
            make.centerY.equalToSuperview()
        }
        line.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.leading.equalTo(26)
            make.trailing.equalTo(0)
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
