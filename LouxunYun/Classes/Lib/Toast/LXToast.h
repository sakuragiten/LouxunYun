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

/// loading with text
+ (void)showLoadingWithText:(NSString *)text;

/// loading with text and during time
+ (void)showLoadingWithText:(NSString *)text timeInterval:(NSInteger)timeInterval;

/// 显示一个文字吐丝
+ (void)showToast:(NSString *)text;


/// 规定时间内显示一个吐丝
+ (void)showToast:(NSString *)text timeInterval:(NSInteger)timeInterval;

/// 吐丝结束后的回调
+ (void)showToast:(NSString *)text completionHandle:(dispatch_block_t)completionHandle;



/// 消失
+ (void)dismiss;



@end


