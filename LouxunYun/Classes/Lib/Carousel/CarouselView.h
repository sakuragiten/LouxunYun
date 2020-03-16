//
//  CarouselView.h
//  LouxunYun
//
//  Created by louxunmac on 2020/1/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CarouselView : UIView

@property (nonatomic, strong) NSArray<NSString *> *imageArray;

@property (nonatomic, assign) BOOL autoScroll; //default is no

@property(nonatomic, assign) CGFloat scrollDistanceTime;    //default is 4.0

@property(nonatomic, assign) NSInteger selectIndex;     // default is 0;


@property (nonatomic, copy) void (^actionHandle)(NSInteger index);




@end

NS_ASSUME_NONNULL_END
