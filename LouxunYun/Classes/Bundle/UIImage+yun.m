//
//  UIImage+yun.m
//  LouxunYun
//
//  Created by louxunmac on 2019/11/13.
//

#import "UIImage+yun.h"



@implementation UIImage (yun)

+ (UIImage *)yun_imageNamed:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName inBundle:YUNNSBundle compatibleWithTraitCollection:nil];
        
    return image;
}

@end
