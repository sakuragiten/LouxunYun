//
//  LXToast.h
//  LouxunYun
//
//  Created by louxunmac on 2019/10/21.
//

#import <Foundation/Foundation.h>



@interface LXToast : NSObject


/// loading
+ (void)showLoading;

+ (void)showLoadingInView:(nullable UIView *)view;

/// loading with text
+ (void)showLoadingWithText:(nullable NSString *)text;

/// loading with text and during time
+ (void)showLoadingWithText:(nullable NSString *)text timeInterval:(NSInteger)timeInterval;

/// 显示一个文字吐丝
+ (void)showToast:(nullable NSString *)text;


+ (void)showToast:(nullable NSString *)text inView:(nullable UIView *)view;

/// 规定时间内显示一个吐丝
+ (void)showToast:(nullable NSString *)text timeInterval:(NSInteger)timeInterval;

/// 吐丝结束后的回调
+ (void)showToast:(nullable NSString *)text completionHandle:(nullable dispatch_block_t)completionHandle;




+ (void)showSucceed:(nullable NSString *)text;
+ (void)showSucceed:(nullable NSString *)text detailText:(nullable NSString *)detailText;

+ (void)showError:(nullable NSString *)text;
+ (void)showError:(nullable NSString *)text detailText:(nullable NSString *)detailText;

+ (void)showInfo:(nullable NSString *)text;
+ (void)showInfo:(nullable NSString *)text detailText:(nullable NSString *)detailText;





/// 消失
+ (void)dismiss;



@end


