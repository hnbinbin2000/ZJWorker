//
//  MineViewController.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/16.
//

import UIKit
import SDCycleScrollView
import ETNavBarTransparent

/**
 tabbar 4--我的
 */
class MineViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var dataSouce: [[String:String]] = {
        let array = [["icon":"shouye_shezhi_fannkui","name":"帮助与反馈"],
                     ["icon":"shouye_shezhi_guanyu","name":"关于我们"],
                     ["icon":"shouye_shezhi_shezhi","name":"设置"]]
        return array
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
        autoLayoutView()
        
        self.navBarBgAlpha = 0
        self.navBarTintColor = .white
        self.navigationItem.title = ""
        
        adView.localizationImageNamesGroup = ["lunbo_bannner","lunbo_bannner","lunbo_bannner"]
    }
    func setUpSubViews() {
        self.view.backgroundColor = COLORFROM16(h: 0xf8f8f8)
        self.view.addSubview(userHeaderView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(jobLabel)
        self.view.addSubview(adView)
        self.view.addSubview(tableView)
    }
    func autoLayoutView() {
        userHeaderView.snp.makeConstraints { (make) in
            make.leading.equalTo(18)
            make.top.equalTo(20+STATUSBAR_HEIGHT)
            make.width.height.equalTo(56)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(92)
            make.top.equalTo(30+STATUSBAR_HEIGHT)
        }
        jobLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(3)
        }
        adView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(userHeaderView.snp.bottom).offset(37)
            make.height.equalTo(100)
        }
        tableView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(adView.snp.bottom).offset(13)
            make.bottom.equalToSuperview()
        }
    }
    
    //MARK: --tableview delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSouce.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MineTableViewCell.self), for: indexPath) as! MineTableViewCell
        let icon = dataSouce[indexPath.row]["icon"]
        let name = dataSouce[indexPath.row]["name"]
        cell.iconView.image = UIImage.init(named: icon!)
        cell.upLabel.text = name
        return cell
    }
    
    //MARK: ---setter
    //MARK: --顶部
    var userHeaderView: UIImageView = {
       let view = UIImageView()
        view.layer.cornerRadius = 56/2
        view.image = UIImage.init(named: "icon_filter_f1")
        return view
    }()
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = COLORFROM16(h: 0x333333)
        label.text = "name"
        return label
    }()
    var jobLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = COLORFROM16(h: 0x999999)
        label.text = "job"
        return label
    }()
    //广告
    var adView: SDCycleScrollView = {
        let view = SDCycleScrollView()
        view.backgroundColor = UIColor.clear
        view.bannerImageViewContentMode = .scaleAspectFit
        view.autoScrollTimeInterval = 2
        return view
    }()
    //栏目
   lazy var tableView: UITableView = {
       let view = UITableView()
        view.estimatedRowHeight = 76
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.register(MineTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MineTableViewCell.self))
        return view
    }()
    
    
    
}
