//
//  YunBundle.m
//  LouxunYun
//
//  Created by louxunmac on 2019/11/13.
//

#import "YunBundle.h"

@implementation YunBundle

+ (NSBundle *)yun_bundle
{
    return [NSBundle bundleForClass:[self class]];
}

+ (NSBundle *)yun_mainBundle
{
    return [NSBundle bundleWithPath:[self yun_bundlePath]];
}

+ (NSString *)yun_bundlePath
{
    return [[NSBundle bundleForClass:[self class]] pathForResource:@"LouxunYun" ofType:@"bundle"];
}

@end
