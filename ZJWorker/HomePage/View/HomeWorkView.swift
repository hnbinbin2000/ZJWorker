//
//  HomeWorkView.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/15.
//

import UIKit
import SDCycleScrollView

/**
 根据网络接口 自适应布局
 */
class HomeWorkView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews();
        autoLayoutView();
        
        adView.localizationImageNamesGroup = ["lunbo_bannner","lunbo_bannner","lunbo_bannner"]
    }
    
    //MARK: -- setters
    ///顶部标题---常驻
    var topBgImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "")
        view.backgroundColor = UIColor.blue
        return view
    }()
    var userIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "icon_filter_f1")
        view.layer.cornerRadius = 56/2
        return view
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "网格员！早上好"
        return label
    }()
    ///顶部常用栏目---app本地记录 --自动隐藏
    var usedMenuView: UIView = {
        let view = UIView()
        return view
    }()
    ///广告栏目 --- 自动隐藏
    var adView: SDCycleScrollView = {
        let view = SDCycleScrollView()
        view.backgroundColor = UIColor.clear
        view.bannerImageViewContentMode = .scaleAspectFit
        view.autoScrollTimeInterval = 2
        return view
    }()
    ///总栏目列表
    var meunCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumLineSpacing = 1
        layout.headerReferenceSize = CGSize(width: SCREEN_WIDTH, height: 58)
        layout.footerReferenceSize = CGSize(width: SCREEN_WIDTH, height: 20)
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.isScrollEnabled = false
        collectionView.register(HomeMeunCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HomeMeunCollectionViewCell.self))
        collectionView.register(HomeMenuReusableHeaderView.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader , withReuseIdentifier: NSStringFromClass(HomeMenuReusableHeaderView.self))
        collectionView.register(HomeMenuReusableFooterView.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionFooter , withReuseIdentifier: NSStringFromClass(HomeMenuReusableFooterView.self))
        return collectionView
    }()

    
    func setUpSubViews() {
        addSubview(topBgImage)
        addSubview(userIcon)
        addSubview(titleLabel)
        addSubview(usedMenuView)
        addSubview(adView)
        addSubview(meunCollectionView)
    }
    func autoLayoutView() {
        topBgImage.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(221)
        }
        userIcon.snp.makeConstraints { (make) in
            make.leading.equalTo(18)
            make.top.equalTo(20+STATUSBAR_HEIGHT)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(userIcon)
            make.leading.equalTo(userIcon.snp_trailingMargin).offset(13)
        }
        usedMenuView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(userIcon.snp.bottom).offset(40)
            make.height.equalTo(80)
        }
        adView.snp.makeConstraints { (make) in
            make.top.equalTo(topBgImage.snp.bottom).offset(23)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(117)
        }
        meunCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(adView.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(600) //600根据实际内容高度计算
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
