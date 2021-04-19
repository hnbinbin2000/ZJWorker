//
//  CustomerInfoViewController.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/16.
//

import UIKit
/**
 客户信息--个人信息+业务明细+  详细信息根据业务显示
 */
class CustomerInfoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ViewInitProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
        autoLayoutView()
        
        
    }
    
    func setUpSubViews() {
        self.view.addSubview(tableView)
    }
    
    func autoLayoutView() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 57
        tableView.sectionFooterHeight = 0.01
        tableView.estimatedRowHeight = 69
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView .register(CustomerUserInfoTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(CustomerUserInfoTableViewCell.self))
        tableView .register(CustomerBizTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(CustomerBizTableViewCell.self))
                tableView.register(CustomerInfoReusableHeaderView.self, forHeaderFooterViewReuseIdentifier: NSStringFromClass(CustomerInfoReusableHeaderView.self))
        return tableView
    }()

    //MARK: --tableView delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 6 //接口
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
           let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CustomerUserInfoTableViewCell.self), for: indexPath) as! CustomerUserInfoTableViewCell
            cell.setWholeInfo(isWhole: false)  //业务展示不同
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CustomerBizTableViewCell.self), for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CustomerInfoReusableHeaderView()
        return header
    }
}
