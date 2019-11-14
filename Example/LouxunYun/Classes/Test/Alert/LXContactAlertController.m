//
//  LXContactAlertController.m
//  JMPanKeTong
//
//  Created by louxunmac on 2019/11/11.
//  Copyright © 2019 Qfang.com. All rights reserved.
//

#import "LXContactAlertController.h"
#import <LouxunYun/LouxunYun.h>
#import <QMUIKit/QMUIKit.h>

@interface LXContactAlertController ()<QMUIModalPresentationContentViewControllerProtocol>

@property (nonatomic, assign) BOOL show;

@property(nullable, nonatomic, strong) QMUIModalPresentationViewController *modalPresentationViewController;

@end

@implementation LXContactAlertController


+ (instancetype)contactAlertController
{
    LXContactAlertController *vc = [[LXContactAlertController alloc] initWithNibName:@"LXContactAlertController" bundle:nil];
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    vc.modalPresentationViewController = [[QMUIModalPresentationViewController alloc] init];
    vc.modalPresentationViewController.modal = YES;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


- (void)showAniamted
{
//    self.modalPresentationViewController.contentViewMargins = self.dialogViewMargins;
//    self.modalPresentationViewController.maximumContentViewWidth = self.maximumContentViewWidth;
    self.modalPresentationViewController.contentViewController = self;
    [self.modalPresentationViewController showWithAnimated:YES completion:nil];
}

- (void)hide
{
    [self.modalPresentationViewController hideWithAnimated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.show) return;
    
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        self.view.backgroundColor = [UIColor colorWithHexString:@"#000000" alpha:0.4];
    } completion:^(BOOL finished) {
        self.show = YES;
    }];
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/// 取消
- (IBAction)cancelAction:(id)sender {
    
//    self.view.backgroundColor = [UIColor colorWithHexString:@"#000000" alpha:0];
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self hide];
}


- (void)dealloc
{
    NSLog(@"%s", __func__);
}


/// 拨打电话
- (IBAction)callAction:(id)sender {
    
    NSString *urlStr = self.phoneLabel.text.length ? self.phoneLabel.text : @"400-6878-777";
    urlStr = [NSString stringWithFormat:@"tel://%@",urlStr];
    NSURL *url = [NSURL URLWithString:urlStr];
    UIApplication *application=[UIApplication sharedApplication];
    if(![application canOpenURL:url]){
        [LXToast showToast:@"无法拨打电话!"];
        return;
    }
    [[UIApplication sharedApplication] openURL:url];
    
    [self cancelAction:nil];
    
}


/// 复制
- (IBAction)copyAction:(id)sender {
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.mailLabel.text.length ? self.mailLabel.text : @"service@louxun.com";
    
    [LXToast showToast:@"邮箱信息复制成功"];
    
    [self cancelAction:nil];
}

@end
