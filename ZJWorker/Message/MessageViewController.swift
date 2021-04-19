//
//  MessageViewController.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/16.
//

import UIKit
/**
 tabbar 3 -消息
 */
class MessageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    ///顶部标题
    var titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = COLORFROM16(h: 0x333333)
        label.text = "今日"
        return label
    }()
    var subLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = COLORFROM16(h: 0x999999)
        label.text = "2月15日 星期一"
        return label
    }()
    ///栏目内容
    lazy var tableView: UITableView = {
       let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.estimatedRowHeight = 81
        view.separatorStyle = .none
        view.backgroundColor = COLORFROM16(h: 0xF6F6F6)
        view.register(MessageTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MessageTableViewCell.self))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.navBarBgAlpha = 0
        self.navBarTintColor = .white
        self.navigationItem.title = ""
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(subLabel)
        self.view.addSubview(tableView)
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(19)
            make.top.equalTo(30+STATUSBAR_HEIGHT)
        }
        subLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(titleLabel.snp_trailingMargin).offset(6)
        }
        tableView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
        }
    }

    //MARK: -- tableview delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MessageTableViewCell.self), for: indexPath) as! MessageTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let messageList = MesageListViewController()
        self.navigationController?.pushViewController(messageList, animated: true)
    }
}
