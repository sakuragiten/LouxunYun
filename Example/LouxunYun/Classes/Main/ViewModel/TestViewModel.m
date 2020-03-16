//
//  TestViewModel.m
//  YDProject_Example
//
//  Created by gongsheng on 2019/1/9.
//  Copyright © 2019 387970107@qq.com. All rights reserved.
//

#import "TestViewModel.h"

@implementation TestViewModel


- (instancetype)initWithViewModelType:(TestViewModelType)type
{
    if (self = [super init]) {
        [self configurationWithModelType:type];
    }
    return self;
}

- (void)configurationWithModelType:(TestViewModelType)type
{
    switch (type) {
        case TestViewModelTypeDefault:
            [self settingMainDataSource];
            break;
        default:
            break;
    }
}



#pragma mark - main
- (void)settingMainDataSource
{
    self.dataArray = @[Test(@"Toast", @"LXToastController"),
                       Test(@"Share", @"LXShareViewController"),
                       Test(@"Carsouel", @"TesetCarouselController"),
                       Test(@"Album", @"TestAlbumViewController"),];
}



@end

