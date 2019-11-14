//
//  LXContactAlertController.h
//  JMPanKeTong
//
//  Created by louxunmac on 2019/11/11.
//  Copyright © 2019 Qfang.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXContactAlertController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *mailLabel;

+ (instancetype)contactAlertController;

- (void)showAniamted;

@end

NS_ASSUME_NONNULL_END
