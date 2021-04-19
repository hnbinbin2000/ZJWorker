//
//  CreditListViewController.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/17.
//

import UIKit
/**
 风险贷款名单
 */
class CreditListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
        autoLayoutView()
    }
    
    func setUpSubViews() {
        view.backgroundColor = COLORFROM16(h: 0xf6f6f6)
        view.addSubview(searchView)
        view.addSubview(tableView)
    }
    func autoLayoutView() {
        searchView.snp.makeConstraints { (make) in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalToSuperview().offset(22+STATUS_NAV_BAR_Y)
            make.height.equalTo(42)
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(searchView.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    //MARK: --tableview delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CreditTableViewCell.self), for: indexPath) as! CreditTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //MARK: --varible
    //数据表
   lazy var tableView: UITableView = {
       let view = UITableView()
        view.estimatedRowHeight = 144
        view.rowHeight = UITableView.automaticDimension
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.register(CreditTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(CreditTableViewCell.self))
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    ///搜索
    var searchView: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = COLORFROM16(h: 0xffffff)
        tf.placeholder = "输入用户姓名查询"
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
}
