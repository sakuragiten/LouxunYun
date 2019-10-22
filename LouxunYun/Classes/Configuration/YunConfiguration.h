//
//  YunConfiguration.h
//  LouxunYun
//
//  Created by louxunmac on 2019/10/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YunConfiguration : NSObject

+ (instancetype)sharedConfig;


/// 用户id
@property (nonatomic, copy) NSString *userId;


/// 运行环境
@property(nonatomic, assign) NSInteger environment;


/// 初始化组件
- (void)initialWithEnvironment:(NSInteger)environment userId:(NSString *)userId;

@end

NS_ASSUME_NONNULL_END
