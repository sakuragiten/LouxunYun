//
//  TestAlbumViewController.m
//  LouxunYun_Example
//
//  Created by gongsheng on 2020/2/26.
//  Copyright © 2020 387970107@qq.com. All rights reserved.
//

#import "TestAlbumViewController.h"
//

@interface TestAlbumViewController ()<QMUIAlbumViewControllerDelegate, QMUIImagePickerViewControllerDelegate>

@end

@implementation TestAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addTestBtn];
}

- (void)addTestBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn setTitle:@"test" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 40);
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(testAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)testAction
{
    QMUIAlbumViewController *vc = [QMUIAlbumViewController new];
    vc.albumViewControllerDelegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}


- (QMUIImagePickerViewController *)imagePickerViewControllerForAlbumViewController:(QMUIAlbumViewController *)albumViewController
{
    QMUIImagePickerViewController *vc = [QMUIImagePickerViewController new];
    vc.imagePickerViewControllerDelegate = self;
    return vc;
}

/**
 *  创建一个 ImagePickerPreviewViewController 用于预览图片
 */
- (QMUIImagePickerPreviewViewController *)imagePickerPreviewViewControllerForImagePickerViewController:(QMUIImagePickerViewController *)imagePickerViewController
{
    QMUIImagePickerPreviewViewController *vc = [QMUIImagePickerPreviewViewController new];
    return vc;
}

@end
