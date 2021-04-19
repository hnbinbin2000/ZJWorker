//
//  SystemViewController.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/17.
//

import UIKit
/**
 组织架构 ---我的服务站
 */
class SystemViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,ViewInitProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "组织架构"
        
        setUpSubViews()
        autoLayoutView()
        
        ///更新当前显示
        currentView.addArrangedSubview(firstView)
        currentView.addArrangedSubview(firstArrow)
        currentView.addArrangedSubview(secondView)
        currentView.addArrangedSubview(secondArrow)
        currentView.addArrangedSubview(thirdView)
        ///默认1个
        secondView.isHidden = true
        secondArrow.isHidden = true
        thirdView.isHidden = true
    }
    //直接配置默认层级
    func setDefaultLevel(level:NSInteger) {
        self.navigationItem.title = "我的服务站"

        if level == 0 {
             
        }
        if level == 1 { //第二级
            
        }
        if level == 2 { //第三级
          
        }
    }
    //点击了顶部3级
    @objc func chooseStationLevel(button:UIButton){
        let level = button.tag
        ///刷新数据源
        if level == 0 {
            tableView.snp.updateConstraints { (make) in
                make.top.equalTo(searchView.snp.bottom).offset(8)
            }
            secondView.isHidden = true
            secondArrow.isHidden = true
            thirdView.isHidden = true
        } else {
            tableView.snp.updateConstraints { (make) in
                make.top.equalTo(searchView.snp.bottom).offset(57)
            }
            thirdView.isHidden = true
        }
        tableView.reloadData()
    }

    func setUpSubViews() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(searchView)
        self.view.addSubview(currentView)
        self.view.addSubview(spaceView)
        self.view.addSubview(tableView)
    }
    func autoLayoutView() {
        searchView.snp.makeConstraints { (make) in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalToSuperview().offset(22+STATUS_NAV_BAR_Y)
            make.height.equalTo(42)
        }
        currentView.snp.makeConstraints { (make) in
            make.leading.equalTo(25)
            make.top.equalTo(searchView.snp.bottom).offset(14)
            make.height.equalTo(43)
        }
        spaceView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(currentView.snp.bottom)
            make.height.equalTo(10)
        }
        tableView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(searchView.snp.bottom).offset(57)
        }
    }
    
    //MARK: --tableview delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SystemStationTableCell.self), for: indexPath) as! SystemStationTableCell
//        let icon = dataSouce[indexPath.row]["icon"]
//        let name = dataSouce[indexPath.row]["name"]
//        cell.iconView.image = UIImage.init(named: icon!)
//        cell.upLabel.text = name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //选择的第三级
        if !thirdView.isHidden {
             
        }
        else if !secondView.isHidden { //选择的第二级
            thirdView.isHidden = false
        }
        else { //第一
            secondView.isHidden = false
            secondArrow.isHidden = false
            tableView.snp.updateConstraints { (make) in
                make.top.equalTo(searchView.snp.bottom).offset(57)
            }
//            secondView.setTitle("", for: .normal)
        }

    }
    //MARK: --varible
    //数据表
   lazy var tableView: UITableView = {
       let view = UITableView()
        view.estimatedRowHeight = 76
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.register(SystemStationTableCell.self, forCellReuseIdentifier: NSStringFromClass(SystemStationTableCell.self))
        return view
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
    ///当前显示状态
    var currentView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 5
        return view
    }()
    ///1级
    var firstView: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(COLORFROM16(h: 0x008CF8), for: .normal)
        btn.setTitleColor(COLORFROM16(h: 0x999999), for: .disabled)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        btn.setTitle("网格名1", for: .normal)
        btn.tag = 0
        btn.addTarget(self, action: #selector(chooseStationLevel(button:)), for: .touchUpInside)
        return btn
    }()
    ///1级
    var firstArrow: UIButton = {
        let btn = UIButton()
        btn.setTitle(">", for: .normal)
        btn.setTitleColor(COLORFROM16(h: 0x008CF8), for: .normal)
        btn.setTitleColor(COLORFROM16(h: 0x999999), for: .disabled)
        return btn
    }()
    ///2级
    var secondView: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(COLORFROM16(h: 0x008CF8), for: .normal)
        btn.setTitleColor(COLORFROM16(h: 0x999999), for: .disabled)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        btn.setTitle("网格名2网格名2", for: .normal)
        btn.tag = 1
        btn.addTarget(self, action: #selector(chooseStationLevel(button:)), for: .touchUpInside)
        return btn
    }()
    ///2级
    var secondArrow: UIButton = {
        let btn = UIButton()
        btn.setTitle(">", for: .normal)
        btn.setTitleColor(COLORFROM16(h: 0x008CF8), for: .normal)
        btn.setTitleColor(COLORFROM16(h: 0x999999), for: .disabled)
        return btn
    }()
    ///3级
    var thirdView: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(COLORFROM16(h: 0x008CF8), for: .normal)
        btn.setTitleColor(COLORFROM16(h: 0x999999), for: .disabled)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        btn.setTitle("网格名333", for: .normal)
        btn.isUserInteractionEnabled = false
        return btn
    }()

    ///填充view
    var spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = COLORFROM16(h: 0xf6f6f6)
        return view
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
