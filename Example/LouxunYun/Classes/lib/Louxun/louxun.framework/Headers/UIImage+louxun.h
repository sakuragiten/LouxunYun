//
//  UIImage+YDExtension.h
//  louxun
//
//  Created by louxunmac on 2019/9/28.
//  Copyright © 2019 gongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BubbleImageOption : NSObject


/// 气泡填充颜色
@property (nonatomic, strong) UIColor *fillColor;


/// 气泡线条颜色
@property(nonatomic, assign) CGFloat lineWidth;

/// 线条颜色
@property (nonatomic, strong) UIColor *strokeColor;

/// 三角箭头大小
@property(nonatomic, assign) CGSize triangleSize;

/// 气泡大小
@property(nonatomic, assign) CGSize size;


@end


@interface UIImage (louxun)

/// 图片的大小 单位 byte
@property(nonatomic, assign, readonly) NSInteger lx_contentSize;


//压缩到指定大小
- (NSData *)lx_compressWithMaxSize:(NSUInteger)maxSize;


/// 压缩图片到指定大小
- (UIImage *)lx_resetImageWithMaxSize:(NSUInteger)maxSize;


// 生成一个气泡图片
+ (instancetype)lx_bubbleImageWithOption:(BubbleImageOption *)bubbleOption;



/**
 通过颜色创建一个image对象

 @param color 颜色
 @return 图片对象
 */
+ (UIImage *)lx_imagemFromeColor:(UIColor *)color;


@end
