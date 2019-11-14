/*****
 * Tencent is pleased to support the open source community by making QMUI_iOS available.
 * Copyright (C) 2016-2019 THL A29 Limited, a Tencent company. All rights reserved.
 * Licensed under the MIT License (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
 * http://opensource.org/licenses/MIT
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 *****/

//
//  LXUITips.m
//  qmui
//
//  Created by QMUI Team on 15/12/25.
//

#import "LXUITips.h"


//#import "QMUICore.h"
//#import "QMUIToastContentView.h"
//#import "QMUIToastBackgroundView.h"
//#import "NSString+QMUI.h"

const NSInteger LXUITipsAutomaticallyHideToastSeconds = -1;

@interface LXUITips ()

@property(nonatomic, strong) UIView *contentCustomView;

@end

@implementation LXUITips

- (void)showLoading {
    [self showLoading:nil hideAfterDelay:0];
}

- (void)showLoadingHideAfterDelay:(NSTimeInterval)delay {
    [self showLoading:nil hideAfterDelay:delay];
}

- (void)showLoading:(NSString *)text {
    [self showLoading:text hideAfterDelay:0];
}

- (void)showLoading:(NSString *)text hideAfterDelay:(NSTimeInterval)delay {
    [self showLoading:text detailText:nil hideAfterDelay:delay];
}

- (void)showLoading:(NSString *)text detailText:(NSString *)detailText {
    [self showLoading:text detailText:detailText hideAfterDelay:0];
}

- (void)showLoading:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay {
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [indicator startAnimating];
    self.contentCustomView = indicator;
    [self showTipWithText:text detailText:detailText hideAfterDelay:delay];
}

- (void)showWithText:(NSString *)text {
    [self showWithText:text detailText:nil hideAfterDelay:0];
}

- (void)showWithText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay {
    [self showWithText:text detailText:nil hideAfterDelay:delay];
}

- (void)showWithText:(NSString *)text detailText:(NSString *)detailText {
    [self showWithText:text detailText:detailText hideAfterDelay:0];
}

- (void)showWithText:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay {
    self.contentCustomView = nil;
    [self showTipWithText:text detailText:detailText hideAfterDelay:delay];
}

- (void)showSucceed:(NSString *)text {
    [self showSucceed:text detailText:nil hideAfterDelay:0];
}

- (void)showSucceed:(NSString *)text hideAfterDelay:(NSTimeInterval)delay {
    [self showSucceed:text detailText:nil hideAfterDelay:delay];
}

- (void)showSucceed:(NSString *)text detailText:(NSString *)detailText {
    [self showSucceed:text detailText:detailText hideAfterDelay:0];
}

- (void)showSucceed:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay {
    self.contentCustomView = [[UIImageView alloc] initWithImage:[[UIImage yun_imageNamed:@"QMUI_tips_done"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self showTipWithText:text detailText:detailText hideAfterDelay:delay];
}

- (void)showError:(NSString *)text {
    [self showError:text detailText:nil hideAfterDelay:0];
}

- (void)showError:(NSString *)text hideAfterDelay:(NSTimeInterval)delay {
    [self showError:text detailText:nil hideAfterDelay:delay];
}

- (void)showError:(NSString *)text detailText:(NSString *)detailText {
    [self showError:text detailText:detailText hideAfterDelay:0];
}

- (void)showError:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay {
    self.contentCustomView = [[UIImageView alloc] initWithImage:[[UIImage yun_imageNamed:@"QMUI_tips_error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self showTipWithText:text detailText:detailText hideAfterDelay:delay];
}

- (void)showInfo:(NSString *)text {
    [self showInfo:text detailText:nil hideAfterDelay:0];
}

- (void)showInfo:(NSString *)text hideAfterDelay:(NSTimeInterval)delay {
    [self showInfo:text detailText:nil hideAfterDelay:delay];
}

- (void)showInfo:(NSString *)text detailText:(NSString *)detailText {
    [self showInfo:text detailText:detailText hideAfterDelay:0];
}

- (void)showInfo:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay {
    self.contentCustomView = [[UIImageView alloc] initWithImage:[[UIImage yun_imageNamed:@"QMUI_tips_info"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self showTipWithText:text detailText:detailText hideAfterDelay:delay];
}

- (void)showTipWithText:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay {
    
    QMUIToastContentView *contentView = (QMUIToastContentView *)self.contentView;
    contentView.customView = self.contentCustomView;
    
    contentView.textLabelText = text ?: @"";
    contentView.detailTextLabelText = detailText ?: @"";
    
    [self showAnimated:YES];
    
    if (delay == LXUITipsAutomaticallyHideToastSeconds) {
        [self hideAnimated:YES afterDelay:[LXUITips smartDelaySecondsForTipsText:text]];
    } else if (delay > 0) {
        [self hideAnimated:YES afterDelay:delay];
    }
}

+ (NSTimeInterval)smartDelaySecondsForTipsText:(NSString *)text {
    NSUInteger length = text.qmui_lengthWhenCountingNonASCIICharacterAsTwo;
    if (length <= 20) {
        return 1.5;
    } else if (length <= 40) {
        return 2.0;
    } else if (length <= 50) {
        return 2.5;
    } else {
        return 3.0;
    }
}

+ (LXUITips *)showLoadingInView:(UIView *)view {
    return [self showLoading:nil detailText:nil inView:view hideAfterDelay:0];
}

+ (LXUITips *)showLoading:(NSString *)text inView:(UIView *)view {
    return [self showLoading:text detailText:nil inView:view hideAfterDelay:0];
}

+ (LXUITips *)showLoadingInView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay {
    return [self showLoading:nil detailText:nil inView:view hideAfterDelay:delay];
}

+ (LXUITips *)showLoading:(NSString *)text inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay {
    return [self showLoading:text detailText:nil inView:view hideAfterDelay:delay];
}

+ (LXUITips *)showLoading:(NSString *)text detailText:(NSString *)detailText inView:(UIView *)view {
    return [self showLoading:text detailText:detailText inView:view hideAfterDelay:0];
}

+ (LXUITips *)showLoading:(NSString *)text detailText:(NSString *)detailText inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay {
    LXUITips *tips = [self createTipsToView:view];
    [tips showLoading:text detailText:detailText hideAfterDelay:delay];
    return tips;
}

+ (LXUITips *)showWithText:(nullable NSString *)text {
    return [self showWithText:text detailText:nil inView:DefaultTipsParentView hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showWithText:(nullable NSString *)text detailText:(nullable NSString *)detailText {
    return [self showWithText:text detailText:detailText inView:DefaultTipsParentView hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showWithText:(NSString *)text inView:(UIView *)view {
    return [self showWithText:text detailText:nil inView:view hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showWithText:(NSString *)text inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay {
    return [self showWithText:text detailText:nil inView:view hideAfterDelay:delay];
}

+ (LXUITips *)showWithText:(NSString *)text detailText:(NSString *)detailText inView:(UIView *)view {
    return [self showWithText:text detailText:detailText inView:view hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showWithText:(NSString *)text detailText:(NSString *)detailText inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay {
    LXUITips *tips = [self createTipsToView:view];
    [tips showWithText:text detailText:detailText hideAfterDelay:delay];
    return tips;
}

+ (LXUITips *)showSucceed:(nullable NSString *)text {
    return [self showSucceed:text detailText:nil inView:DefaultTipsParentView hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showSucceed:(nullable NSString *)text detailText:(nullable NSString *)detailText {
    return [self showSucceed:text detailText:detailText inView:DefaultTipsParentView hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showSucceed:(NSString *)text inView:(UIView *)view {
    return [self showSucceed:text detailText:nil inView:view hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showSucceed:(NSString *)text inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay {
    return [self showSucceed:text detailText:nil inView:view hideAfterDelay:delay];
}

+ (LXUITips *)showSucceed:(NSString *)text detailText:(NSString *)detailText inView:(UIView *)view {
    return [self showSucceed:text detailText:detailText inView:view hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showSucceed:(NSString *)text detailText:(NSString *)detailText inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay {
    LXUITips *tips = [self createTipsToView:view];
    [tips showSucceed:text detailText:detailText hideAfterDelay:delay];
    return tips;
}

+ (LXUITips *)showError:(nullable NSString *)text {
    return [self showError:text detailText:nil inView:DefaultTipsParentView hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showError:(nullable NSString *)text detailText:(nullable NSString *)detailText {
    return [self showError:text detailText:detailText inView:DefaultTipsParentView hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showError:(NSString *)text inView:(UIView *)view {
    return [self showError:text detailText:nil inView:view hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showError:(NSString *)text inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay {
    return [self showError:text detailText:nil inView:view hideAfterDelay:delay];
}

+ (LXUITips *)showError:(NSString *)text detailText:(NSString *)detailText inView:(UIView *)view {
    return [self showError:text detailText:detailText inView:view hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showError:(NSString *)text detailText:(NSString *)detailText inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay {
    LXUITips *tips = [self createTipsToView:view];
    [tips showError:text detailText:detailText hideAfterDelay:delay];
    return tips;
}

+ (LXUITips *)showInfo:(nullable NSString *)text {
    return [self showInfo:text detailText:nil inView:DefaultTipsParentView hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showInfo:(nullable NSString *)text detailText:(nullable NSString *)detailText {
    return [self showInfo:text detailText:detailText inView:DefaultTipsParentView hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showInfo:(NSString *)text inView:(UIView *)view {
    return [self showInfo:text detailText:nil inView:view hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showInfo:(NSString *)text inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay {
    return [self showInfo:text detailText:nil inView:view hideAfterDelay:delay];
}

+ (LXUITips *)showInfo:(NSString *)text detailText:(NSString *)detailText inView:(UIView *)view {
    return [self showInfo:text detailText:detailText inView:view hideAfterDelay:LXUITipsAutomaticallyHideToastSeconds];
}

+ (LXUITips *)showInfo:(NSString *)text detailText:(NSString *)detailText inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay {
    LXUITips *tips = [self createTipsToView:view];
    [tips showInfo:text detailText:detailText hideAfterDelay:delay];
    return tips;
}

+ (LXUITips *)createTipsToView:(UIView *)view {
    LXUITips *tips = [[LXUITips alloc] initWithView:view];
    [view addSubview:tips];
    tips.removeFromSuperViewWhenHide = YES;
    return tips;
}

+ (void)hideAllTipsInView:(UIView *)view {
    [self hideAllToastInView:view animated:NO];
}

+ (void)hideAllTips {
    [self hideAllToastInView:nil animated:NO];
}

@end
