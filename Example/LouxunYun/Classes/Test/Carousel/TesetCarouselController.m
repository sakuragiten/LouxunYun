//
//  TesetCarouselController.m
//  LouxunYun_Example
//
//  Created by louxunmac on 2020/1/8.
//  Copyright © 2020 387970107@qq.com. All rights reserved.
//

#import "TesetCarouselController.h"

@interface TesetCarouselController ()

@end

@implementation TesetCarouselController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI
{
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Carousel";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    CarouselView *view = [CarouselView new];
    view.tag = 123;
    view.autoScroll = YES;
    view.imageArray = @[[UIColor redColor], [UIColor greenColor], [UIColor purpleColor], [UIColor orangeColor], [UIColor randomColor]];
    view.actionHandle = ^(NSInteger index) {
        NSLog(@"点击了%@", @[@"红色", @"绿色", @"紫色", @"橘黄色", @"随机色"][index]);
    };
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(150);
    }];
}


- (void)viewDidLayoutSubviews
{
//    CarouselView *view = [self.view viewWithTag:123];
//    [view reloadData];
    NSLog(@"Did layout subViews");
}

@end
