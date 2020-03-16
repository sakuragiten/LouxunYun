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

/// 时间戳
@property(nonatomic, assign) long long timestamp;


/**
 去掉小数点后多余的0

 @param value 原值
 @return 返回原值所对应的字符串
 */
+ (NSString *)lx_decimalStringFromeDoubleValue:(double)value;



/**
 NSDictionary转json字符串

@param dict 需要转换的字典对象
@return 返回转换后的json字符串 转换失败 返回nil
*/
+ (NSString *)lx_jsonStringWithDictionary:(NSDictionary *)dict;









@end




@interface NSDictionary (louxun)

/**
json字符串转NSDictionary

@param jsonString json字符串
@return 返回转换后的字典对象 转换失败 返回nil
*/

+ (NSDictionary *)lx_dictionaryWithJsonString:(NSString *)jsonString;

@end
