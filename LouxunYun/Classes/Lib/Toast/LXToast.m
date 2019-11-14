//
//  LXToast.m
//  LouxunYun
//
//  Created by louxunmac on 2019/10/21.
//

#import "LXToast.h"
#import "LXUITips.h"


@implementation LXToast


+ (void)showLoading
{
    [self showLoadingInView:nil];
}

+ (void)showLoadingInView:(UIView *)view
{
    [self showLoadingWithText:nil inView:view timeInterval:0];
}

+ (void)showLoadingWithText:(NSString *)text
{
    [self showLoadingWithText:text inView:nil timeInterval:0];
}



+ (void)showLoadingWithText:(NSString *)text timeInterval:(NSInteger)timeInterval
{
    [self showLoadingWithText:text inView:nil timeInterval:timeInterval];
}

+ (void)showLoadingWithText:(NSString *)text inView:(UIView *)view timeInterval:(NSInteger)timeInterval
{
    if (view == nil) {
        view = [self parentsView];
    }

    [LXUITips showLoading:text inView:view hideAfterDelay:timeInterval];
}
    
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.mode = MBProgressHUDModeIndeterminate;      // 转菊花
//    hud.animationType = MBProgressHUDAnimationFade; //渐变显示
//    hud.removeFromSuperViewOnHide = YES;            // 隐藏的时候从父视图移除
//    hud.label.text = text;
//    [hud hideAnimated:YES afterDelay:timeInterval];



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
        view = [self parentsView];
    }
    [self dismissInView:view];
    
    timeInterval = timeInterval ? : 1.5;
    
    LXUITips *tips = [LXUITips createTipsToView:view];
    tips.didHideBlock = ^(UIView *hideInView, BOOL animated) {
        !completionHandle ? : completionHandle();
    };
    [tips showWithText:text hideAfterDelay:timeInterval];
    
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.mode = MBProgressHUDModeText;      // 显示文字
//    hud.animationType = MBProgressHUDAnimationFade; //渐变显示
//    hud.removeFromSuperViewOnHide = YES;            // 隐藏的时候从父视图移除
//    hud.label.text = text;
//    hud.label.numberOfLines = 3;
//    hud.label.minimumScaleFactor = 0.7;
//    hud.completionBlock = completionHandle;
//    [hud hideAnimated:YES afterDelay:timeInterval];
}

// 消失
+ (void)dismiss
{
    [self dismissInView:nil];
}

+ (void)dismissInView:(UIView *)view
{
    if (view == nil) {
        view = [self parentsView];
    }
    
    [LXUITips hideAllTipsInView:view];
//    [MBProgressHUD hideHUDForView:view animated:YES];
}



+ (void)showSucceed:(NSString *)text
{
    [self showSucceed:text detailText:nil];
}

+ (void)showSucceed:(NSString *)text detailText:(NSString *)detailText
{
    [LXUITips showSucceed:text detailText:detailText];
}

+ (void)showError:(NSString *)text
{
    [self showError:text detailText:nil];
}


+ (void)showError:(NSString *)text detailText:(NSString *)detailText
{
    [LXUITips showError:text detailText:detailText];
}



+ (void)showInfo:(NSString *)text
{
    [self showInfo:text detailText:nil];
}

+ (void)showInfo:(NSString *)text detailText:(NSString *)detailText
{
    [LXUITips showInfo:text detailText:detailText];
}


+ (UIView *)parentsView
{
    return [UIApplication sharedApplication].delegate.window;
}



@end
