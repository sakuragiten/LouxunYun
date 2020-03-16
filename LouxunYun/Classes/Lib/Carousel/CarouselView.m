//
//  CarouselView.m
//  LouxunYun
//
//  Created by louxunmac on 2020/1/8.
//

#import "CarouselView.h"
#import "LXPageControl.h"


/* ============================================================================================================
    
                                    新增NSTimer构建方法，防止循环引用
 
   ============================================================================================================ */

@interface NSTimer (carousel)

+ (NSTimer *)carousel_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats blockTimer:(void (^)(NSTimer *timer))block;

@end


@implementation NSTimer (carousel)

+ (NSTimer *)carousel_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats blockTimer:(void (^)(NSTimer *))block
{
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(carousel_timered:) userInfo:[block copy] repeats:repeats];
    return timer;
}

+ (void)carousel_timered:(NSTimer *)timer
{
    void (^block)(NSTimer *timer) = timer.userInfo;
    block(timer);
}
@end













@interface CarouselView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

/** page control */
@property (nonatomic, strong) LXPageControl *pageConrol;

@property (nonatomic, strong) NSTimer *timer;


@property(nonatomic, assign) NSInteger itemIndex;

/// 用户是否在操作
@property (nonatomic, assign) BOOL touching;

@end






@implementation CarouselView


- (instancetype)init
{
    if (self = [super init]) {
        [self initialAdView];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialAdView];
    }
    return self;
}


- (void)initialAdView
{
    [self configuration];
    [self setupUI];
   
}




- (void)setupUI
{
    
    [self addSubview:self.collectionView];
    [self addSubview:self.pageConrol];

    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.left.mas_equalTo(0);
        make.width.equalTo(self.mas_width).multipliedBy(2);
    }];
    
    [_pageConrol mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10.0);
        make.centerX.equalTo(self);
    }];
    
}


- (void)configuration
{
    self.scrollDistanceTime = 4.0;

    dispatch_async(dispatch_get_main_queue(), ^{
        BOOL flag = YES;
        while (flag) {
            if (self.collectionView.bounds.size.width > 0) {
                [self backOriginalPosition];
                flag = NO;
            }
        }
    });
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(carousel_willEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(carousel_willEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void)setImageArray:(NSArray<NSString *> *)imageArray
{
    if (!imageArray || imageArray == _imageArray) return;

    _imageArray = imageArray;
    self.collectionView.scrollEnabled = imageArray.count > 1;
    [self reloadData];
}

/// 恢复到最初的位置
- (void)backOriginalPosition
{
    CGPoint p = CGPointMake(self.collectionView.bounds.size.width * 0.5, 0);
    [self.collectionView setContentOffset:p];
}



- (void)reloadData
{
    [self.collectionView reloadData];
    self.itemIndex = 0;
    self.pageConrol.numberOfPages = self.imageArray.count;
    [self backOriginalPosition];
    [self resetTimer];
    [self startTimer];
}

- (void)startTimer
{
    if (self.autoScroll && self.imageArray.count > 1) {
        __weak typeof(self) weakSelf = self;
        _timer = [NSTimer carousel_scheduledTimerWithTimeInterval:self.scrollDistanceTime repeats:YES blockTimer:^(NSTimer *timer) {
            [weakSelf autoScrolling];
        }];
    }
}


- (void)carousel_willEnterBackground
{
    [self resetTimer];
}

- (void)carousel_willEnterForeground
{
    [self startTimer];
}





#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count ? 4 : 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"advertisingCollectonCell" forIndexPath:indexPath];
    UIImageView *imageView = [self imageViewFromCell:cell];
    NSInteger index = (self.itemIndex + indexPath.row - 1 + self.imageArray.count) % self.imageArray.count;
    NSLog(@"%ld", self.itemIndex);
    imageView.backgroundColor = self.imageArray[index];
//    NSInteger count = self.imageArray.count;
//    [imageView lx_setImageWithUrl:self.imageArray[indexPath.item % count]];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat w = collectionView.bounds.size.width * 0.5;
    CGFloat h = collectionView.bounds.size.height;
    
    return CGSizeMake(w, h);
    
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    !_actionHandle ? :  _actionHandle(self.itemIndex % self.imageArray.count);
}




- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _touching = YES;
    [self resetTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    _touching = NO;
    [self resetTimer];
    [self startTimer];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_touching) return;
    CGFloat x = scrollView.contentOffset.x;
    CGFloat w = scrollView.bounds.size.width * 0.5;
    if (x == w * 2) {
        // 往左滑
        self.itemIndex ++;
        [self backOriginalPosition];
        [self.collectionView reloadData];
    } else if (x == 0) {
        // 往右滑
        self.itemIndex --;
        [self backOriginalPosition];
        [self.collectionView reloadData];
    }
}




- (void)autoScrolling
{
    if (self.imageArray.count == 0) return;
    
    self.itemIndex ++;
    CGFloat w = self.collectionView.bounds.size.width * 0.5;
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.collectionView.transform = CGAffineTransformMakeTranslation(-w, 0);
    } completion:^(BOOL finished) {
        self.collectionView.transform = CGAffineTransformIdentity;
        [self.collectionView reloadData];
    }];
    
    
    
}


- (void)resetTimer
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}



#pragma mark - getter


- (UIImageView *)imageViewFromCell:(UICollectionViewCell *)cell
{
    UIImageView *imageView = [cell.contentView viewWithTag:12345];
    if (!imageView) {
        imageView = [UIImageView new];
        imageView.tag = 12345;
//        imageView.lx_sizeScale = 4.0;
        [cell.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
    }
    
    return imageView;
}


- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0.0;
        layout.minimumInteritemSpacing = 0.0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"advertisingCollectonCell"];
        
    }
    
    return _collectionView;
}


- (LXPageControl *)pageConrol
{
    if (!_pageConrol) {
        _pageConrol = [[LXPageControl alloc] init];
        _pageConrol.hidesForSinglePage = YES;
        _pageConrol.pageIndicatorTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        _pageConrol.currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    
    return _pageConrol;
}


- (void)dealloc
{
    [self resetTimer];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end




