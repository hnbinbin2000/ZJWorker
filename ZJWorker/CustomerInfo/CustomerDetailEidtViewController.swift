//
//  CustomerDetailEidtViewController.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/17.
//

import UIKit
/**
 客户详细信息编辑 --个人信息+客户分类+输入
 */
class CustomerDetailEidtViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ViewInitProtocol, UIPickerViewDelegate,UIPickerViewDataSource {
 
    
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
    @objc func cancelPick(){
        UIView.animate(withDuration: 0.6) {
            self.pickerView.removeFromSuperview()
        }
    }
    @objc func surePick(){
        UIView.animate(withDuration: 0.6) {
            self.pickerView.removeFromSuperview()
        }
    }
    
    //MARK: --varibles
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
        tableView .register(CustomerInputCell.self, forCellReuseIdentifier: NSStringFromClass(CustomerInputCell.self))
        tableView.register(CustomerInfoReusableHeaderView.self, forHeaderFooterViewReuseIdentifier: NSStringFromClass(CustomerInfoReusableHeaderView.self))
        return tableView
    }()
    
    //pickerview
    lazy var pickerView: UIView = {
        let holdView = UIView()
        holdView.backgroundColor = UIColor.white
        let view = UIPickerView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor.white
        let cancel = UIButton()
        cancel.setTitle("取消", for: .normal)
        cancel.setTitleColor(COLORFROM16(h: 0x666666), for: .normal)
        cancel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        cancel.addTarget(self, action: #selector(cancelPick), for: .touchUpInside)
        let sure = UIButton()
        sure.setTitle("确定", for: .normal)
        sure.setTitleColor(COLORFROM16(h: 0x008CF8), for: .normal)
        sure.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        sure.addTarget(self, action: #selector(surePick), for: .touchUpInside)
        holdView.addSubview(view)
        holdView.addSubview(cancel)
        holdView.addSubview(sure)
        view.snp.makeConstraints { (make) in
            make.bottom.trailing.leading.equalToSuperview()
            make.top.equalTo(50)
        }
        cancel.snp.makeConstraints { (make) in
            make.leading.top.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(28+34)
        }
        sure.snp.makeConstraints { (make) in
            make.trailing.top.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(28+34)
        }
        return holdView
    }()
    
    //MARK: --tableView delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CustomerUserInfoTableViewCell.self), for: indexPath) as! CustomerUserInfoTableViewCell
            cell.setWholeInfo(isWhole: false)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CustomerInputCell.self), for: indexPath) as! CustomerInputCell
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "客户分类"
            cell.textField.placeholder = "请选择客户分类"
            cell.setInputStyle(isInput: false)
            break
        case 1:
            cell.titleLabel.text = "客户评价"
            cell.textField.placeholder = "请选择客户评价"
            cell.setInputStyle(isInput: false)
            break
        case 2:
            cell.titleLabel.text = "不动产"
            cell.textField.placeholder = "请输入商品房房产证号"
            cell.setInputStyle(isInput: true)
            break
        case 3:
            cell.titleLabel.text = "客户分类"
            cell.textField.placeholder = "请选择客户分类"
            cell.setInputStyle(isInput: true)
            break
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            view.addSubview(self.pickerView)
            pickerView.snp.makeConstraints { (make) in
                make.bottom.leading.trailing.equalToSuperview()
                make.height.equalTo(244)
            }
            break
        case 1:
            view.addSubview(self.pickerView)
            pickerView.snp.makeConstraints { (make) in
                make.bottom.leading.trailing.equalToSuperview()
                make.height.equalTo(244)
            }
            break
        default:
            break
        }
        view.endEditing(true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = CustomerInfoReusableHeaderView()
            return header
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 57
        }
        return 10
    }
    
    //MARK: --pickerView delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,numberOfRowsInComponent component: Int) -> Int{
        return 9
    }

    func pickerView(_ pickerView: UIPickerView,rowHeightForComponent component: Int) -> CGFloat{
        return 46
     }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let showLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 34))
        showLabel.textAlignment = .center
        showLabel.text = "分类"
        return showLabel
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
