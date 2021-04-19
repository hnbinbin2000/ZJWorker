//
//  MesageListViewController.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/16.
//

import UIKit
/**
 消息列表--点击cell可app内跳转
 */
class MesageListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "打卡考勤"
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    
    //MARK: --setter
    lazy var tableView:UITableView = {
        let view = UITableView.init(frame: CGRect.zero, style: .plain)
        view.dataSource = self
        view.delegate = self
        view.estimatedRowHeight = 200
        view.rowHeight = UITableView.automaticDimension
        view.register(MessgeListTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MessgeListTableViewCell.self))
        return view
    }()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MessgeListTableViewCell.self), for: indexPath)
        return cell
    }
    

}
