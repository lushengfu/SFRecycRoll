//
//  ViewController.m
//  SFRecycRoll
//
//  Created by lushengfu on 2017/3/14.
//  Copyright © 2017年 CM. All rights reserved.
//

#import "ViewController.h"
#import "BaseCollectionFlowLayout.h"
#import "SFNewModel.h"
#import "SFNewsCollectionViewCell.h"

#define kSFCollectionSectionCount 3

@interface ViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView *collectionView;
/**存放模型的数组*/
@property (nonatomic, strong)NSMutableArray *news;
/**循环滚动的timer*/
@property (nonatomic, strong)NSTimer *cycleTimer;

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    //添加一个循环滚动的timer
    [self addTimer];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //图片的原始宽高
    CGFloat imageWidth = 300;
    CGFloat imageHeight = 130;
    CGFloat collectionX = ([UIScreen mainScreen].bounds.size.width - imageWidth) * 0.5;
    //高度随用户需求任意设置
    CGFloat collectionY = 70;
    self.collectionView.frame = CGRectMake(collectionX, collectionY, imageWidth, imageHeight);
}

#pragma mark - private method
//添加定时器
- (void)addTimer
{
    _cycleTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_cycleTimer forMode:NSRunLoopCommonModes];
}

//移除定时器
- (void)removeTimer
{
    [self.cycleTimer invalidate];
    self.cycleTimer = nil;
}

- (void)nextPage
{
    NSIndexPath *currentIndexPath = [self resetIndexPath];
    
    NSInteger nextItem = currentIndexPath.item + 1;
    NSInteger nextSection = currentIndexPath.section;
    if (nextItem == self.news.count) {
        nextItem = 0;
        nextSection++;
    }
    
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - 重置NSIndexPath,实现定时器循环滚动
- (NSIndexPath *)resetIndexPath
{
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:kSFCollectionSectionCount/2];
    
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    return currentIndexPathReset;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return kSFCollectionSectionCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.news.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SFNewsCollectionViewCell *newsCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SFNewsCollectionViewCell class]) forIndexPath:indexPath];
    newsCell.newsModel = self.news[indexPath.item];
    
//    NSLog(@"%p", newsCell);
    return newsCell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}

#pragma mark - getter and setter
- (NSArray *)news
{
    if (!_news) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"newses" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _news = [NSMutableArray array];
        for (NSDictionary *modelDict in array) {
            SFNewModel *newsModel = [SFNewModel modelWith:modelDict];
            [_news addObject:newsModel];
        }
    }
    return _news;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        BaseCollectionFlowLayout *flowLayout = [[BaseCollectionFlowLayout alloc] initWithScrollDirection:UICollectionViewScrollDirectionHorizontal space:0 interitem:0];
        flowLayout.itemSize = CGSizeMake(300, 130);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[SFNewsCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([SFNewsCollectionViewCell class])];
    }
    return _collectionView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
