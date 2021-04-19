//
//  SettingTableViewCell.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/17.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.white
        setUpSubViews()
        autoLayoutView()
    }
    
    
    func setUpSubViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(desLabel)
        contentView.addSubview(arrowView)
    }
    
    func autoLayoutView() {
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(16)
            make.centerY.equalToSuperview()
        }
        arrowView.snp.makeConstraints { (make) in
            make.trailing.equalTo(-20)
            make.centerY.equalToSuperview()
        }
        desLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(arrowView.snp.leading)
            make.centerY.equalToSuperview()
        }
    }
    
    //MARK: --setters
    ///标题
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = COLORFROM16(h: 0x333333)
        label.text = "上标题"
        return label
    }()
    ///右侧文本
    var desLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = COLORFROM16(h: 0x999999)
        label.text = ""
        return label
    }()
    ///箭头
    var arrowView: UIImageView = {
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
