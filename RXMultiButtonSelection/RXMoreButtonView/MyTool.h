
//
//  MyTool.h
//  RXMultiButtonSelection
//
//  Created by rx on 2018/9/11.
//  Copyright © 2018年 RX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyTool : NSObject

//计算label的宽度
+ (float)getWidthWithStr:(NSString *)str andFont:(UIFont *)font;

//Font
+ (UIFont *)mediumFontWithSize:(CGFloat)size;

//button 
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont;

@end
