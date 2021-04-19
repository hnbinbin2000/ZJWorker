# 一期功能范围及核心需求思想

#### 1需求注意

#### 2代码风格
subview比较多时，遵循ViewInitProtocol
方法书写顺序：
init方法最上面
public方法常用放其次
delegate的实现方法
addsubview+layout
var view不常用放下面
#### 3常用图片
箭头shouye_shezhi_youce

//背图
var bgView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    return view
}()


