//
//  UIColor+louxun.h
//  louxun
//
//  Created by louxunmac on 2019/9/28.
//  Copyright © 2019 gongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

// RGB 宏定义
#define RGB(r, g, b)        [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBA(r, g, b, a)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


@interface UIColor (louxun)


/**
 返回一个UIColor 对象

 @param hexString 色号
 @param alpha 透明度
 @return 对应的UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;



/**
 返回一个UIColor 对象
 
 @param hexString 色号
 @return 对应的UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;





/**
 随机生成一个颜色

 @return 对应的UIColor对象
 */
+ (instancetype)randomColor;




@end















