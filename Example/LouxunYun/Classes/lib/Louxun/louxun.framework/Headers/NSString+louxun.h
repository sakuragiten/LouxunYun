//
//  NSString+louxun.h
//  louxun
//
//  Created by louxunmac on 2019/10/21.
//  Copyright © 2019 gongsheng. All rights reserved.
//


#import <Foundation/Foundation.h>



@interface NSString (Predicate)

/// 是否是合法的电话号码
@property (nonatomic, assign) BOOL isPhoneNumber;

@end




@interface NSString (louxun)

@property(nonatomic, copy) NSString *md5String;


/**
 去掉小数点后多余的0

 @param value 原值
 @return 返回原值所对应的字符串
 */
+ (NSString *)lx_decimalStringFromeDoubleValue:(double)value;

@end
