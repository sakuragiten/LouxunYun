//
//  YunConfiguration.m
//  LouxunYun
//
//  Created by louxunmac on 2019/10/22.
//

#import "YunConfiguration.h"
#import "LXCacheManager.h"

@implementation YunConfiguration


static YunConfiguration *_manager = nil;
+ (instancetype)sharedConfig
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [YunConfiguration new];
    });
    
    return _manager;
}


- (void)initialWithEnvironment:(NSInteger)environment userId:(NSString *)userId
{
    self.environment = environment;
    self.userId = userId;
    
    [LXCacheManager sharedManager].separateKey = userId;
    [LXCacheManager sharedManager].environment = environment;
}

@end
