//
//  UINavigationController+PopGesture.h
//  louxun
//
//  Created by louxunmac on 2019/10/25.
//  Copyright © 2019 gongsheng. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (PopGesture)

/// The gesture recognizer that actually handles interactive pop.
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *lx_fullscreenPopGestureRecognizer;



/// A view controller is able to control navigation bar's appearance by itself,
/// rather than a global way, checking "lx_prefersNavigationBarHidden" property.
/// Default to YES, disable it if you don't want so.
@property (nonatomic, assign) BOOL lx_viewControllerBasedNavigationBarAppearanceEnabled;

@end


@interface UIViewController (PopGesture)

/// Whether the interactive pop gesture is disabled when contained in a navigation
/// stack.
@property (nonatomic, assign) BOOL lx_interactivePopDisabled;

/// Indicate this view controller prefers its navigation bar hidden or not,
/// checked when view controller based navigation bar's appearance is enabled.
/// Default to NO, bars are more likely to show.
@property (nonatomic, assign) BOOL lx_prefersNavigationBarHidden;

/// Max allowed initial distance to left edge when you begin the interactive pop
/// gesture. 0 by default, which means it will ignore this limit.
@property (nonatomic, assign) CGFloat lx_interactivePopMaxAllowedInitialDistanceToLeftEdge;



@end


NS_ASSUME_NONNULL_END
