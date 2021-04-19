//
//  CustomerUserInfoTableViewCell.swift
//  ZJWorker
//
//  Created by 张宾 on 2021/4/17.
//

import UIKit

/**
 客户信息--个人信息
 */
class CustomerUserInfoTableViewCell: UITableViewCell,ViewInitProtocol {


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = COLORFROM16(h: 0xF6F6F6)
        setUpSubViews()
        autoLayoutView()
    }
    //信息是否全部显示
    public func setWholeInfo(isWhole:Bool) {
        catagoryLabel.isHidden = !isWhole
        commentLabel.isHidden = !isWhole
        moveLabel.isHidden = !isWhole
        noneMoveLabel.isHidden = !isWhole
    }
    
    func setUpSubViews() {
        contentView.addSubview(holdView)
        holdView.addArrangedSubview(upEmptyView)
        holdView.addArrangedSubview(nameLabel)
        holdView.addArrangedSubview(cardLabel)
        holdView.addArrangedSubview(catagoryLabel)
        holdView.addArrangedSubview(commentLabel)
        holdView.addArrangedSubview(moveLabel)
        holdView.addArrangedSubview(noneMoveLabel)
        holdView.addArrangedSubview(downEmptyView)
    }
    
    func autoLayoutView() {
        holdView.snp.makeConstraints { (make) in
            make.leading.equalTo(17)
            make.trailing.equalTo(-17)
            make.top.bottom.equalToSuperview()
        }
    }
    
    var holdView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 8
        view.axis = .vertical
        view.spacing = 12
        view.distribution = .equalSpacing
        return view
    }()    
    var nameLabel: LeftRightTextLabel = {
        let label = LeftRightTextLabel()
        label.leftLabel.text = "姓名"
        label.rightLabel.text = "nnnnnn"
        return label
    }()
    var cardLabel: LeftRightTextLabel = {
        let label = LeftRightTextLabel()
        label.leftLabel.text = "身份证号"
        label.rightLabel.text = "nnnnnn"
        return label
    }()
    var catagoryLabel: LeftRightTextLabel = {
        let label = LeftRightTextLabel()
        label.leftLabel.text = "客户分类"
        label.rightLabel.text = "nnnnnn"
        return label
    }()
    var commentLabel: LeftRightTextLabel = {
        let label = LeftRightTextLabel()
        label.leftLabel.text = "客户评价"
        label.rightLabel.text = "nnnnnn"
        return label
    }()
    var noneMoveLabel: LeftRightTextLabel = {
        let label = LeftRightTextLabel()
        label.leftLabel.text = "不动产"
        label.rightLabel.text = "nnnnnn"
        return label
    }()
    var moveLabel: LeftRightTextLabel = {
        let label = LeftRightTextLabel()
        label.leftLabel.text = "动产"
        label.rightLabel.text = "nnnnnn"
        return label
    }()
    //上下空白填充
    var upEmptyView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 100,height: 7))
        return view
    }()
    var downEmptyView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 1,height: 1))
        return view
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
