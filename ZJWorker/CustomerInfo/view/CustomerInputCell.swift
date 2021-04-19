//
//  CustomerInputCell.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/17.
//

import UIKit
/**
 客户详细信息--点击选择或者拍照/输入
 */
class CustomerInputCell: UITableViewCell,ViewInitProtocol {
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
    //cell样式
    func setInputStyle(isInput:Bool) {
        textField.isHidden = !isInput
        button.isHidden = !isInput
        subTitleLabel.isHidden = isInput
        arrow.isHidden = isInput
        
        textField.isHidden = false
        subTitleLabel.isHidden = true
        textField.isEnabled = isInput
    }
    
    func setUpSubViews() {
        contentView.addSubview(bgView)
        bgView.addSubview(titleLabel)
        bgView.addSubview(subTitleLabel)
        bgView.addSubview(arrow)
        bgView.addSubview(textField)
        bgView.addSubview(button)
    }
    func autoLayoutView() {
        bgView.snp.makeConstraints { (make) in
            make.leading.equalTo(17)
            make.trailing.equalTo(-17)
            make.top.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(14)
            make.top.equalTo(22)
            make.bottom.equalTo(-22)
        }
        subTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(91)
            make.centerY.equalTo(titleLabel)
        }
        arrow.snp.makeConstraints { (make) in
            make.trailing.equalTo(-18)
            make.centerY.equalTo(titleLabel)
        }
        textField.snp.makeConstraints { (make) in
            make.leading.equalTo(91)
            make.centerY.equalTo(titleLabel)
        }
        button.snp.makeConstraints { (make) in
            make.trailing.equalTo(-15)
            make.centerY.equalTo(titleLabel)
        }
    }
    //背图
    var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    //内容
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = COLORFROM16(h: 0x333333)
        label.text = "客户分类"
        return label
    }()
    var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = COLORFROM16(h: 0x999999)
        label.text = "请选择"
        return label
    }()
    var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "请输入"
        tf.textColor = COLORFROM16(h: 0x333333)
        tf.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return tf
    }()
    //拍照按钮
    var button: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "shouye_yewu_photo"), for: .normal)
        return btn
    }()
    //箭头
    var arrow: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "shouye_shezhi_youce")
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
