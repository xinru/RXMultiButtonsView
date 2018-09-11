
//
//  ViewController.m
//  RXMultiButtonSelection
//
//  Created by dookay_73 on 2018/9/11.
//  Copyright © 2018年 RX. All rights reserved.
//

#import "ViewController.h"
#import "RXMoreButtonsView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RXMoreButtonsView *moreBtns = [[RXMoreButtonsView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)
                                                               andBtnsName:@[@"按钮1", @"按钮2", @"按钮3"]
                                                               andIsCenter:YES];
    [moreBtns setClickedBtnsBlock:^(NSInteger index) {
        NSLog(@"clicked index --------%ld", (long)index);
    }];
    [self.view addSubview:moreBtns];
    
    RXMoreButtonsView *moreBtns2 = [[RXMoreButtonsView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 50)
                                                               andBtnsName:@[@"按钮1", @"按钮2", @"按钮3"]
                                                               andIsCenter:NO];
    [moreBtns2 setClickedBtnsBlock:^(NSInteger index) {
        NSLog(@"clicked index --------%ld", (long)index);
    }];
    [self.view addSubview:moreBtns2];
    
    RXMoreButtonsView *moreBtns3 = [[RXMoreButtonsView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 50)
                                                                andBtnsName:@[@"按钮1", @"按钮2", @"按钮3"]
                                                                andIsCenter:YES];
    moreBtns3.selectedIndex = 2;
    [moreBtns3 setClickedBtnsBlock:^(NSInteger index) {
        NSLog(@"clicked index --------%ld", (long)index);
    }];
    [self.view addSubview:moreBtns3];
    
    RXMoreButtonsView *moreBtns4 = [[RXMoreButtonsView alloc] initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, 50)];
    [moreBtns4 sendBtnNameArray:@[@"按钮1", @"按钮2", @"按钮3"] andIsCenter:YES];

    moreBtns4.selectedIndex = 1;
    [moreBtns4 setClickedBtnsBlock:^(NSInteger index) {
        NSLog(@"clicked index --------%ld", (long)index);
    }];
    [self.view addSubview:moreBtns4];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
