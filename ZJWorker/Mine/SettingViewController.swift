//
//  SettingViewController.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/17.
//

import UIKit

class SettingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
//    var dataSouce:[[String:String]] = [[["name":"我的","value":""]],
//                           [["name":"2","value":""],["name":"3","value":""]],
//                           ["name":"4","value":"1234"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    //MARK: --tableview delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (dataSouce[section] as! Array).count
        if section == 1 {
            return 2
        }
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 47
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section < 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SettingTableViewCell.self), for: indexPath) as! SettingTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SettingCenterTextTableCell.self), for: indexPath) as! SettingCenterTextTableCell
            return cell
        }

    }
    
    //MARK: ---setter
    //栏目
   lazy var tableView: UITableView = {
    let view = UITableView(frame: CGRect.zero, style: .grouped)
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.sectionHeaderHeight = 10
        view.register(SettingTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(SettingTableViewCell.self))
        view.register(SettingCenterTextTableCell.self, forCellReuseIdentifier: NSStringFromClass(SettingCenterTextTableCell.self))
        return view
    }()
    
}
