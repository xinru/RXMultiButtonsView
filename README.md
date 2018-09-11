# RXMultiButtonsView

## 描述
多按钮选择器功能，app开发中很常见的功能

## 下载地址
https://github.com/xinru/RXMultiButtonsView.git

## 效果图
![效果图.gif](https://upload-images.jianshu.io/upload_images/6207663-9b682243090aa005.gif?imageMogr2/auto-orient/strip)

## 使用说明
- 初始化有两种形式，分别用于按钮数组固定或不固定的情况
```
/*
 btnNameArray   多按钮的名称
 isCenter       按钮是否需要均分View的宽度
 
 此方法主要用于按钮数组固定的情况，默认选择第一个
 */
- (instancetype)initWithFrame:(CGRect)frame andBtnsName:(NSArray *)btnNameArray andIsCenter:(BOOL)isCenter;
```

```
/*
 btnNameArray   多按钮的名称
 isCenter       按钮是否需要均分View的宽度
 
 此方法用于按钮数组在初始化的时候不确定的情况
 */
- (void)sendBtnNameArray:(NSArray *)btnNameArray  andIsCenter:(BOOL)isCenter;
```

- 可以自定义首次选中的index

```
//当前的选中的位置
@property (nonatomic, assign) NSInteger selectedIndex;
```

- 点击按钮的回调处理事件
```
//点击按钮的回调
@property (nonatomic, copy) void (^clickedBtnsBlock)(NSInteger index);
```
