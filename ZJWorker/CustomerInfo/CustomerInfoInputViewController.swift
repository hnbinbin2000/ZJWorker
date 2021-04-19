//
//  CustomerDetailViewController.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/16.
//

import UIKit
/**
 输入客户信息和拍照
 */
class CustomerInfoInputViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
        autoLayoutView()
        
        self.navBarBgAlpha = 1
        self.navigationItem.title = "输入客户信息"
        
    }
    
    func setUpSubViews() {
        self.view.backgroundColor = COLORFROM16(h: 0xf6f6f6)
        self.view.addSubview(topBgView)
        self.view.addSubview(contentView)
        contentView.addSubview(desLabel)
        contentView.addSubview(captureBtn)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameTextField)
        contentView.addSubview(cardLabel)
        contentView.addSubview(cardTextField)
        contentView.addSubview(line)
        self.view.addSubview(checkBtn)
    }
    func autoLayoutView() {
        topBgView.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
        }
        contentView.snp.makeConstraints { (make) in
            make.leading.equalTo(17)
            make.trailing.equalTo(-17)
            make.top.equalTo(topBgView.snp.bottom).offset(-52)
        }
        desLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(17)
            make.trailing.equalTo(-17)
            make.top.equalTo(22)
        }
        captureBtn.snp.makeConstraints { (make) in
            make.top.equalTo(desLabel.snp.bottom).offset(19)
            make.leading.equalTo(21)
            make.trailing.equalTo(-21)
            make.height.equalTo(48)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(12)
            make.top.equalTo(captureBtn.snp.bottom).offset(26)
        }
        nameTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(90)
            make.centerY.equalTo(nameLabel)
            make.trailing.equalToSuperview()
        }
        line.snp.makeConstraints { (make) in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(1)
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
        cardLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(line.snp.bottom).offset(19)
            make.bottom.equalTo(contentView.snp.bottom).offset(-25)

        }
        cardTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(nameTextField)
            make.centerY.equalTo(cardLabel)
            make.trailing.equalToSuperview()
        }
        checkBtn.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.bottom).offset(102)
            make.leading.equalTo(34)
            make.trailing.equalTo(-34)
            make.height.equalTo(50)
        }
    }
    
    
    //MARK: -- setter
    var topBgView:UIImageView = {
       let view = UIImageView()
        view.image = UIImage.init(named: "shouye_yewu_tu")
        return view
    }()
    var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 8
        return view
    }()
    var desLabel: UILabel = {
        let label = UILabel()
        label.text = "以下信息为业务查询所需，我们将对信息严格保密。"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = COLORFROM16(h: 0x999999)
        return label
    }()
    var captureBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = COLORFROM16(h: 0x008CF8)
        btn.layer.cornerRadius = 8
        btn.setImage(UIImage.init(named: "shouye_yewu_photo"), for: .normal)
        btn.setTitle("拍照识别 自动填写信息", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
        return btn
    }()
    ///姓名
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "姓名"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = COLORFROM16(h: 0x333333)
        return label
    }()
    var nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "请输入姓名"
        tf.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return tf
    }()
    ///line
    var line: UIView = {
        let view = UIView()
        view.backgroundColor = COLORFROM16(h: 0xf0f0f0)
        return view
    }()
    ///身份证号
    var cardLabel: UILabel = {
        let label = UILabel()
        label.text = "身份证号"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = COLORFROM16(h: 0x333333)
        return label
    }()
    var cardTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "请输入身份证号码"
        tf.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return tf
    }()
    ///查询
    var checkBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("查询", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = COLORFROM16(h: 0x008CF8,alpha: 0.4)
        btn.layer.cornerRadius = 25
        return btn
    }()
    
}
