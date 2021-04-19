//
//  LoginView.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/15.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews();
        autoLayoutView();
    }
    
    ///密码可见
    @objc func securityAction(btn:UIButton){
        pwdTextField.isSecureTextEntry = !pwdTextField.isSecureTextEntry
        var str = "denglu_icon_dakai"
        if (pwdTextField.isSecureTextEntry==true) {
            str = "denglu_icon_biyan"
        }
        btn.setImage(UIImage.init(named: str), for: .normal)
    }
    
    //MARK: -- setters
//    ///顶部标题
//    let titleLabel: UILabel = {
//        let label = UILabel()
////        label.text = "您好，欢迎来到\n数字普惠金融管理服务平台"
//        label.font = UIFont.boldSystemFont(ofSize: 26)
//        label.textAlignment = .left
//        label.numberOfLines = 0
//        return label
//    }()
    
    ///背景图
    var topBgImageView: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage.init(named: "denglu_bg")
        return imageV
    }()
    
    ///下部分背景
    var downBgView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 35
        view.backgroundColor = UIColor.white
        return view
    }()
    
    ///账号
    var accountLabel: UILabel = {
       let label = UILabel()
        label.text = "账号"
        label.textColor = COLORFROM16(h: 0x333333)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    var accountTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "请输入您的账号"
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = COLORFROM16(h: 0x999999)
        return tf
    }()
    var accountLine: UIView = {
        let line = UIView()
        line.backgroundColor = COLORFROM16(h: 0xF0F0F0)
        return line
    }()
    ///密码
    var pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "密码"
         label.textColor = COLORFROM16(h: 0x333333)
         label.font = UIFont.boldSystemFont(ofSize: 18)
         return label
    }()
    var pwdTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "请输入您的登录密码"
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = COLORFROM16(h: 0x999999)
        tf.isSecureTextEntry = true
        ///可见按钮
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn.setImage(UIImage.init(named: "denglu_icon_dakai"), for: .normal)
        btn.addTarget(self, action:#selector(securityAction(btn:)), for:UIControl.Event.touchUpInside)
        tf.rightView = btn
        tf.rightViewMode = .always
        return tf
    }()
    var pwdLine: UIView = {
        let line = UIView()
        line.backgroundColor = COLORFROM16(h: 0xF0F0F0)
        return line
    }()
    
    ///登录
    var loginBtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("登录", for: .normal)
        btn.setBackgroundImage(UIImage.init(named: ""), for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.cornerRadius = 25
        btn.backgroundColor = COLORFROM16(h: 0x008CF8)
        return btn
    }()
    

    
    func setUpSubViews() {
        addSubview(topBgImageView)
//        addSubview(titleLabel)
        addSubview(downBgView)

        downBgView.addSubview(accountLabel)
        downBgView.addSubview(accountTextField)
        downBgView.addSubview(accountLine)
        
        downBgView.addSubview(pwdLabel)
        downBgView.addSubview(pwdTextField)
        downBgView.addSubview(pwdLine)
        
        downBgView.addSubview(loginBtn)
    }
    
    func autoLayoutView() {
        topBgImageView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(230)
        }
//        titleLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(92)
//            make.leading.equalTo(32)
//            make.trailing.equalTo(-32)
//        }
        downBgView.snp.makeConstraints { (make) in
            make.top.equalTo(topBgImageView.snp.bottom).offset(-43)
            make.leading.trailing.bottom.equalToSuperview()
        }
        ///account
        accountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(52)
            make.leading.equalTo(35)
        }
        accountTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(accountLabel)
            make.top.equalTo(accountLabel.snp.bottom).offset(9)
        }
        accountLine.snp.makeConstraints { (make) in
            make.leading.equalTo(accountLabel)
            make.trailing.equalTo(-35)
            make.height.equalTo(1)
            make.top.equalTo(accountTextField.snp.bottom).offset(18)
        }
        ///pwd
        pwdLabel.snp.makeConstraints { (make) in
            make.top.equalTo(accountLine.snp.bottom).offset(15)
            make.leading.equalTo(35)
        }
        pwdTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(pwdLabel)
            make.trailing.equalTo(-30)
            make.top.equalTo(pwdLabel.snp.bottom).offset(9)
        }
        pwdLine.snp.makeConstraints { (make) in
            make.leading.equalTo(pwdLabel)
            make.trailing.equalTo(-35)
            make.height.equalTo(1)
            make.top.equalTo(pwdTextField.snp.bottom).offset(18)
        }
        
        loginBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(-100)
            make.leading.equalTo(38)
            make.trailing.equalTo(-38)
            make.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
