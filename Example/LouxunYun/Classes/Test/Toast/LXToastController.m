//
//  LXToastController.m
//  LouxunYun_Example
//
//  Created by louxunmac on 2019/10/21.
//  Copyright © 2019 387970107@qq.com. All rights reserved.
//

#import "LXToastController.h"
#import <LouxunYun/LouxunYun.h>
#import "LXContactAlertController.h"
//#import <UMShare/UMShare.h>
//#import <YYText/YYText.h>

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
    [self addTestBtn];
    
    QMUINavigationButton *button = [[QMUINavigationButton alloc] initWithType:QMUINavigationButtonTypeBack title:@""];
//    QMUINavigationButton *button = [[QMUINavigationButton alloc] initWithImage:[[UIImage imageNamed:@"nav_back_arrow"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
//    UIBarButtonItem *item = [UIBarButtonItem qmui_backItemWithTarget:self action:@selector(handleBackButtonEvent:)];// 自定义返回按钮要自己写代码去 pop 界面
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)addTestBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"test" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(testAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)testAction
{
//    [LXToast showToast:@"sadasda"];
//    [LXToast showError:@"错了哦" detailText:@"你到底那里错了"];
//    LXContactAlertController *vc = [LXContactAlertController contactAlertController];
//    [vc showAniamted];
    
    UIViewController *vc = [UIViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)test
{
//    [LXToast showLoading];
//    [LXToast showLoadingWithText:@"加载中..." timeInterval:10];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [LXToast showToast:@"123"];
//        [LXToast showToast:@"123"];
//        [LXToast showToast:@"123"];
//        [LXToast showToast:@"123dfsdsddfsdfdsasdasudgajjdahjdhjasjdahdahjdhjahjdhjajshdajhsdjhajhdsjhadjhajhsdhjajsdjajhdajhsdhashjda"];
//    });
    
    [LXToast showSucceed:@"加载成功"];
    
//    [LXToast showToast:@"测试block" completionHandle:^{
//        NSLog(@"finish");
//    }];
}

@end
