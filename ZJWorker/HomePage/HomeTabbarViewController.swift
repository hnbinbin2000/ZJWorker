//
//  HomeTabbarViewController.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/15.
//

import UIKit

class HomeTabbarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        templateNet.request(TemplateNet.poiList(pageNum: 1, keyWord:"郑州")){ result in
            switch result {
            case .success(let response):
                do {
                    let reDat = try JSONDecoder().decode(TemplateModel.self, from: response.data)
                    print("redat %@",reDat);
                } catch {
                    print("json error");
                }
                if let model = try? response.map(TemplateModel.self){
                    print("model %@",model)
                }
                break
            case .failure(let error):
                print("error %@",error)
                break
            }
        }
    }

}
