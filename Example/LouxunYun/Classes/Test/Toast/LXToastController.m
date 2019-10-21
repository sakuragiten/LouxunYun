//
//  LXToastController.m
//  LouxunYun_Example
//
//  Created by louxunmac on 2019/10/21.
//  Copyright © 2019 387970107@qq.com. All rights reserved.
//

#import "LXToastController.h"
#import <LouxunYun/LouxunYun.h>

@interface LXToastController ()

@end

@implementation LXToastController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setuPUI];
    
    [self test];
    
}

- (void)setuPUI
{
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)test
{
//    [LXToast showLoading];
    [LXToast showLoadingWithText:@"加载中..." timeInterval:10];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LXToast showToast:@"123"];
        [LXToast showToast:@"123"];
        [LXToast showToast:@"123"];
        [LXToast showToast:@"123dfsdsddfsdfdsasdasudgajjdahjdhjasjdahdahjdhjahjdhjajshdajhsdjhajhdsjhadjhajhsdhjajsdjajhdajhsdhashjda"];
    });
}

@end
