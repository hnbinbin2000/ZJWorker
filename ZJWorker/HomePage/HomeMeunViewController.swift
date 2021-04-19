//
//  HomeMeunViewController.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/16.
//

import UIKit
import ETNavBarTransparent

class HomeMeunViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    var bgHoldView: UIScrollView = {
        let view = UIScrollView()
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()
    lazy var homeMenuView: HomeWorkView = {
        let view = HomeWorkView()
        view.meunCollectionView.delegate = self
        view.meunCollectionView.dataSource = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navBarBgAlpha = 0
        self.navBarTintColor = .white
        self.navigationItem.title = ""
        
        self.view.addSubview(bgHoldView)
        bgHoldView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.bottomLayoutGuide.snp.bottom).offset(-84)
        }
        bgHoldView.contentSize = CGSize(width: SCREEN_WIDTH, height: 791+241)
        
        bgHoldView.addSubview(homeMenuView)
        homeMenuView.snp.makeConstraints { (make) in
            make.width.equalTo(SCREEN_WIDTH)
            make.top.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(791+241)
        }
    }
    
    
    //MARK: --delegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HomeMeunCollectionViewCell.self), for: indexPath) as! HomeMeunCollectionViewCell
        cell.setIconImage(name: "first_recharge_gift_bg")
        cell.setTitle(title: "菜单标题")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(HomeMenuReusableHeaderView.self), for: indexPath) as! HomeMenuReusableHeaderView
            header.titleLabel.text = "栏目标题"
            return header
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(HomeMenuReusableHeaderView.self), for: indexPath) as! HomeMenuReusableHeaderView
            return header
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10);
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

}
