//
//  NSObject+louxun.h
//  louxun
//
//  Created by louxunmac on 2019/10/28.
//  Copyright © 2019 gongsheng. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (louxun)

@property (nonatomic, assign) BOOL isArray;



@end












#define UIFontUItraLightMake(size)           [UIFont lx_uitraLightFontOfSize:size]
#define UIFontThinMake(size)                 [UIFont lx_thinFontOfSize:size]
#define UIFontLightMake(size)                [UIFont lx_lightFontOfSize:size]
#define UIFontRegularMake(size)              [UIFont lx_regularFontOfSize:size]
#define UIFontMediumMake(size)               [UIFont lx_mediumFontOfSize:size]
#define UIFontBoldMake(size)                 [UIFont lx_boldFontOfSize:size]
#define UIFontSemiboldMake(size)             [UIFont lx_semiboldFontOfSize:size]
#define UIFontHeavyMake(size)                [UIFont lx_heavyFontOfSize:size]
#define UIFontBlackMake(size)                [UIFont lx_blackFontOfSize:size]
#define UIFontSystemMake(size)               [UIFont systemFontOfSize:size]
#define UIFontBoldSystemMake(size)           [UIFont boldSystemFontOfSize:size]


#define UIFontDingMake(size)                [UIFont lx_dingFontOfSize:size]

@interface UIFont (louxun)



///超细字体
+ (UIFont *)lx_uitraLightFontOfSize:(CGFloat)fontSize;
///纤细字体
+ (UIFont *)lx_thinFontOfSize:(CGFloat)fontSize;
///亮字体
+ (UIFont *)lx_lightFontOfSize:(CGFloat)fontSize;
///常规字体
+ (UIFont *)lx_regularFontOfSize:(CGFloat)fontSize;
///介于Regular和Semibold之间
+ (UIFont *)lx_mediumFontOfSize:(CGFloat)fontSize;
///加粗字体
+ (UIFont *)lx_boldFontOfSize:(CGFloat)fontSize;
///半粗字体
+ (UIFont *)lx_semiboldFontOfSize:(CGFloat)fontSize;
///介于Bold和Black之间
+ (UIFont *)lx_heavyFontOfSize:(CGFloat)fontSize;
///最粗字体
+ (UIFont *)lx_blackFontOfSize:(CGFloat)fontSize;


//DINCond-Black
+ (UIFont *)lx_dingFontOfSize:(CGFloat)fontSize;


@end



NS_ASSUME_NONNULL_END
