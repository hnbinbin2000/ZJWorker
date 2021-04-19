//
//  ContactViewController.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/16.
//

import UIKit

class ContactViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBarBgAlpha = 0
        self.navBarTintColor = .white
        self.navigationItem.title = ""
        
        setUpSubViews()
        autoLayoutView()
        
    }
    
    @objc func systemAction(){
        let vc = SystemViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func myStationAciton(){
        let vc = SystemViewController()
        vc.setDefaultLevel(level: 2)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUpSubViews() {
        self.view.addSubview(navLabel)
        self.view.addSubview(searchView)
        self.view.addSubview(systemView)
        self.view.addSubview(stationView)
    }
    func autoLayoutView() {
        navLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(19)
            make.top.equalTo(30+STATUSBAR_HEIGHT)
        }
        searchView.snp.makeConstraints { (make) in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(navLabel.snp.bottom).offset(29)
            make.height.equalTo(42)
        }
        systemView.snp.makeConstraints { (make) in
            make.leading.equalTo(50)
            make.top.equalTo(searchView.snp.bottom).offset(30)
            make.height.width.equalTo(80)
        }
        stationView.snp.makeConstraints { (make) in
            make.leading.equalTo(systemView.snp.trailing).offset(58)
            make.top.equalTo(systemView)
            make.height.width.equalTo(systemView)
        }
    }

    //MARK: --setters
    ///标题
    var navLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = COLORFROM16(h: 0x333333)
        label.text = "联系人"
        return label
    }()
    ///搜索
    var searchView: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = COLORFROM16(h: 0xf6f6f6)
        tf.placeholder = "搜索"
        tf.layer.cornerRadius = 21
        tf.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        let lView = UIView()
        lView.frame = CGRect(x: 0, y: 0, width: 44, height: 24)
        let icon = UIImageView()
        icon.image = UIImage.init(named: "shouye_icon_sousuo1")
        icon.frame = CGRect(x: 12, y: 0, width: 22, height: 22)
        icon.contentMode = .center
        lView.addSubview(icon)
        tf.leftView = lView
        tf.leftViewMode = .always
        return tf
    }()
    ///组织架构
    var systemView: WorkMenuButton = {
        let btn = WorkMenuButton()
        btn.setIconImage(name: "shouye_icon_jiagou")
        btn.setTitle(title: "组织架构")
        btn.addTarget(self, action: #selector(systemAction), for: .touchUpInside)
        return btn
    }()
    ///我的服务站
    var stationView: WorkMenuButton = {
        let btn = WorkMenuButton()
        btn.setIconImage(name: "shouye_icon_wodefuwu")
        btn.setTitle(title: "我的服务站")
        btn.addTarget(self, action: #selector(myStationAciton), for: .touchUpInside)
        return btn
    }()
    ///常用联系人
    

    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
