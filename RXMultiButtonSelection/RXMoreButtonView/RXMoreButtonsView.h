
//
//  RXMoreButtonsView.h
//  RXMultiButtonSelection
//
//  Created by rx on 2018/9/11.
//  Copyright © 2018年 RX. All rights reserved.
//

#import <UIKit/UIKit.h>

#define mainWidth     [[UIScreen mainScreen] bounds].size.width
#define mainHeight       [[UIScreen mainScreen] bounds].size.height
#define ScaleX   mainWidth/375

/**定义颜色的宏*/
//颜色 16进制 例如: UIColorFromRGB(0x2b2b2b)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//带透明度的颜色
#define UIColorFromRGBA(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

@interface RXMoreButtonsView : UIScrollView

/*
 btnNameArray   多按钮的名称
 isCenter       按钮是否需要均分View的宽度
 
 此方法主要用于按钮数组固定的情况，默认选择第一个
 */
- (instancetype)initWithFrame:(CGRect)frame andBtnsName:(NSArray *)btnNameArray andIsCenter:(BOOL)isCenter;

/*
 btnNameArray   多按钮的名称
 isCenter       按钮是否需要均分View的宽度
 
 此方法用于按钮数组在初始化的时候不确定的情况
 */
- (void)sendBtnNameArray:(NSArray *)btnNameArray  andIsCenter:(BOOL)isCenter;



//当前的选中的位置
@property (nonatomic, assign) NSInteger selectedIndex;


//点击按钮的回调
@property (nonatomic, copy) void (^clickedBtnsBlock)(NSInteger index);

@end
