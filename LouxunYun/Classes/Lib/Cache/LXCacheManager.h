//
//  LXCacheManager.h
//  JMPanKeTong
//
//  Created by louxunmac on 2019/6/17.
//  Copyright © 2019 Qfang.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXCacheManager : NSObject

+ (instancetype)sharedManager;

/// 数据隔离
@property (nonatomic, copy) NSString *separateKey;


/// 运行环境
@property(nonatomic, assign) NSInteger environment;


/**
 增
 */
- (void)cacheDataDict:(NSDictionary *)dataDict forKey:(NSString *)key;

/** 是否需要进行用户隔离 */
- (void)cacheDataDict:(NSDictionary *)dataDict forKey:(NSString *)key separate:(BOOL)separate;


/**
 查
 */
- (NSDictionary *)getCacheDataDictForKey:(NSString *)key;


/** 是否需要进行用户隔离 */
- (NSDictionary *)getCacheDataDictForKey:(NSString *)key separate:(BOOL)separate;

/**
 删
 */
- (void)deleteDataForKey:(NSString *)key;






/**
 缓存data

 @param data NSData 类型
 @param key 缓存的key
 */
- (void)cacheData:(NSData *)data forKey:(NSString *)key;



/**
 c获取缓存数据

 @param key 缓存的key
 @return 缓存的对象
 */
- (NSData *)getCacheDataForKey:(NSString *)key;





@end

NS_ASSUME_NONNULL_END
