//
//  LoginViewController.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/15.
//
import UIKit
import Foundation
import SnapKit

class LoginViewController: UIViewController {

    let loginView: LoginView = {
        let view = LoginView()
        view.loginBtn.addTarget(self, action:#selector(loginAction), for:UIControl.Event.touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.view.addSubview(loginView)
        loginView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    ///登录
    @objc func loginAction(){
        print("account %@ pwd %@",loginView.accountTextField.text,loginView.pwdTextField.text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

