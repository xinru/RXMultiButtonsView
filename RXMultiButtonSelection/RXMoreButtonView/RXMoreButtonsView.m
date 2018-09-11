
//
//  RXMoreButtonsView.m
//  RXMultiButtonSelection
//
//  Created by rx on 2018/9/11.
//  Copyright © 2018年 RX. All rights reserved.
//

#import "RXMoreButtonsView.h"
#import "MyTool.h"

@interface RXMoreButtonsView()

@property (nonatomic, strong) UIButton *selectedBtn;

@property (nonatomic, strong) NSMutableArray *btnsArray;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation RXMoreButtonsView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        
        _btnsArray = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame andBtnsName:(NSArray *)btnNameArray andIsCenter:(BOOL)isCenter
{
    if ([super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        
        _btnsArray = [NSMutableArray array];
        
        if (btnNameArray.count > 0) {
            [self dk_initSubViews:btnNameArray andIsCenter:isCenter];
        }
        
    }
    
    return self;
}


#pragma mark - initSubViews
- (void)dk_initSubViews:(NSArray *)btnNameArray andIsCenter:(BOOL)isCenter
{
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    
    CGFloat buttonWidth = 0;
    CGFloat btnX = 0;
    CGFloat edg = 0;
    if (isCenter) {
        buttonWidth = mainWidth / btnNameArray.count;
    }else{
        btnX = 20*ScaleX;
        edg = 20*ScaleX;
    }
    
    for (int i = 0; i < btnNameArray.count; i++) {
        
        CGFloat btnWidth;
        if (isCenter) {
            btnWidth = buttonWidth;
        }else{
            btnWidth = [MyTool getWidthWithStr:btnNameArray[i]
                                       andFont:[MyTool mediumFontWithSize:14*ScaleX]];
        }
        
        UIButton *btn = [MyTool buttonWithTitle:btnNameArray[i]
                                     titleColor:UIColorFromRGB(0x000000)
                                      titleFont:[MyTool mediumFontWithSize:14*ScaleX]];
        [btn setTitleColor:UIColorFromRGB(0xFF847B) forState:UIControlStateSelected];
        btn.frame = CGRectMake(btnX, 0, btnWidth, self.frame.size.height);
        btn.tag = i;
        [btn addTarget:self
                action:@selector(clickedBtnsAction:)
      forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
        [_btnsArray addObject:btn];
        btnX += (btnWidth + edg);
    }
    
    self.contentSize = CGSizeMake(btnX + 20*ScaleX, self.frame.size.height);
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1, btnX + 20*ScaleX, 1)];
    line.backgroundColor = UIColorFromRGB(0xDDDDDD);
    [self addSubview:line];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = UIColorFromRGB(0xFF847B);
    _lineView.frame = CGRectMake(0, self.frame.size.height-1, 0, 1);
    [self addSubview:_lineView];
    
    [self changeSelectedBtn:[_btnsArray objectAtIndex:0]];
    
    
}

- (void)sendBtnNameArray:(NSArray *)btnNameArray andIsCenter:(BOOL)isCenter
{
    [self dk_initSubViews:btnNameArray andIsCenter:isCenter];
}
#pragma mark - setter
- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    self.selectedBtn = _btnsArray[selectedIndex];
    
    for (UIButton *btn in _btnsArray) {
        btn.selected = NO;
    }
    
    self.selectedBtn.selected = YES;
    
    CGFloat btnWidth = [MyTool getWidthWithStr:_selectedBtn.titleLabel.text
                                       andFont:[MyTool mediumFontWithSize:14*ScaleX]];
    [self changeLineViewFrameWithBtnWidth:btnWidth];
}

#pragma mark - action
- (void)clickedBtnsAction:(UIButton *)btn
{
    [self changeSelectedBtn:btn];
    self.clickedBtnsBlock(btn.tag);
}

- (void)changeSelectedBtn:(UIButton *)btn
{
    for (UIButton *btn in _btnsArray) {
        btn.selected = NO;
    }
    
    self.selectedBtn = btn;
    self.selectedBtn.selected = YES;
    
    CGFloat btnWidth = [MyTool getWidthWithStr:_selectedBtn.titleLabel.text
                                       andFont:[MyTool mediumFontWithSize:14*ScaleX]];
    [self changeLineViewFrameWithBtnWidth:btnWidth];
}

- (void)changeLineViewFrameWithBtnWidth:(CGFloat)btnWidth
{
    CGRect frame = self.lineView.frame;
    frame.size.width = btnWidth;
    self.lineView.frame = frame;
    self.lineView.center = CGPointMake(self.selectedBtn.center.x, self.lineView.center.y);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
