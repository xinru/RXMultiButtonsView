
//
//  MyTool.m
//  RXMultiButtonSelection
//
//  Created by rx on 2018/9/11.
//  Copyright © 2018年 RX. All rights reserved.
//

#import "MyTool.h"

@implementation MyTool


+ (float)getWidthWithStr:(NSString *)str andFont:(UIFont *)font{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 9999, font.lineHeight)];
    label.text = str;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}

+ (UIFont *)mediumFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:size];
    if (!font) {
        font = [UIFont boldSystemFontOfSize:size];
    }
    return font;
}


+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont{
    return  [self buttonWithTitle:title titleColor:titleColor titleFont:titleFont image:nil selectedImage:nil];
}

+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                    titleFont:(UIFont *)titleFont
                        image:(UIImage *)image
                selectedImage:(UIImage *)selectedImage{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = titleFont;
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    
    return button;
}

@end
