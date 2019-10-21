//
//  LXToast.m
//  LouxunYun
//
//  Created by louxunmac on 2019/10/21.
//

#import "LXToast.h"
#import <MBProgressHUD/MBProgressHUD.h>
@implementation LXToast


+ (void)showLoading
{
    [self showLoadingWithText:nil];
}

+ (void)showLoadingWithText:(NSString *)text
{
    [self showLoadingWithText:text timeInterval:0];
}


+ (void)showLoadingWithText:(NSString *)text timeInterval:(NSInteger)timeInterval
{
    [self showLoadingWithText:text timeInterval:timeInterval inView:nil];
}

+ (void)showLoadingWithText:(NSString *)text timeInterval:(NSInteger)timeInterval inView:(UIView *)view
{
    if (view == nil) {
        view = [UIApplication sharedApplication].windows.lastObject;
    }
    [self dismissInView:view];
    
    timeInterval = timeInterval ? : 30.0;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;      // 转菊花
    hud.animationType = MBProgressHUDAnimationFade; //渐变显示
    hud.removeFromSuperViewOnHide = YES;            // 隐藏的时候从父视图移除
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:timeInterval];
}


// 显示一个文字吐丝
+ (void)showToast:(NSString *)text
{
    [self showToast:text timeInterval:0];
}


// 规定时间内显示一个吐丝
+ (void)showToast:(NSString *)text timeInterval:(NSInteger)timeInterval
{
    [self showToast:text timeInterval:timeInterval inView:nil completionHandle:nil];
}

/// 吐丝结束后的回调
+ (void)showToast:(NSString *)text completionHandle:(dispatch_block_t)completionHandle
{
    [self showToast:text timeInterval:0 inView:nil completionHandle:completionHandle];
}

+ (void)showToast:(NSString *)text
     timeInterval:(NSInteger)timeInterval
           inView:(UIView *)view
 completionHandle:(dispatch_block_t)completionHandle
{
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    [self dismissInView:view];
    
    timeInterval = timeInterval ? : 1.5;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;      // 显示文字
    hud.animationType = MBProgressHUDAnimationFade; //渐变显示
    hud.removeFromSuperViewOnHide = YES;            // 隐藏的时候从父视图移除
    hud.label.text = text;
    hud.label.numberOfLines = 3;
    hud.label.minimumScaleFactor = 0.7;
    hud.completionBlock = completionHandle;
    [hud hideAnimated:YES afterDelay:timeInterval];
}

// 消失
+ (void)dismiss
{
    [self dismissInView:nil];
}

+ (void)dismissInView:(UIView *)view
{
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
