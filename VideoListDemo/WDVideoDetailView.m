//
//  WDVideoDetailView.m
//  VideoListDemo
//
//  Created by Unique on 2019/11/6.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDVideoDetailView.h"
#import "WDVideoDetailCellCollectionViewCell.h"

@interface WDVideoDetailView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *currentView;
@property (nonatomic, copy)   WDVideoDetailViewDidChangeViewBlock viewChangeBlock;
@end

@implementation WDVideoDetailView

+ (instancetype)manager {
    static dispatch_once_t onceToken;
    static WDVideoDetailView *view;
    dispatch_once(&onceToken, ^{
        view = [[WDVideoDetailView alloc] init];
    });
    return view;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)showDetailView:(NSString *)coverImageName
          currentIndex:(NSInteger)index
            currenView:(UIView *)view
    didChangeViewBlock:(WDVideoDetailViewDidChangeViewBlock)block {
    
    self.viewChangeBlock = block;
    self.currentView = view;
    UIView *keyWindow = UIApplication.sharedApplication.keyWindow;
    [keyWindow addSubview:self];
    self.frame = keyWindow.bounds;
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:(UICollectionViewScrollPositionNone) animated:NO];
    [self.collectionView layoutIfNeeded];

    WDVideoDetailCellCollectionViewCell *cell = (WDVideoDetailCellCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    
    CGRect originFrame = [view convertRect:view.bounds toView:self.window];
    cell.coverImageView.frame = originFrame;
        
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];

    [UIView animateWithDuration:0.35 animations:^{
        cell.coverImageView.frame = self.bounds;
        cell.coverImageView.clipsToBounds = YES;
        cell.titleLabel.hidden = YES;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    } completion:^(BOOL finished) {
        cell.titleLabel.hidden = NO;
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WDVideoDetailCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WDVideoDetailCellCollectionViewCell" forIndexPath:indexPath];
    
    if (indexPath.row % 10 == 0) {
        cell.coverImageView.image = [UIImage imageNamed:@"timg-1.jpeg"];
    } else if (indexPath.row % 10 == 1) {
        cell.coverImageView.image = [UIImage imageNamed:@"timg-2.jpeg"];
    } else if (indexPath.row % 10 == 2) {
        cell.coverImageView.image = [UIImage imageNamed:@"timg-3.jpeg"];
    } else {
        cell.coverImageView.image = [UIImage imageNamed:@"timg-4.jpeg"];
    }
    cell.titleLabel.text = @"古风古风古风古风古风古风古风古风古风古风古风古风古风古风古风";
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    WDVideoDetailCellCollectionViewCell *cell = (WDVideoDetailCellCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    [self hidenViewWithCell:cell];
}

- (void)hidenViewWithCell:(WDVideoDetailCellCollectionViewCell *)cell {
    CGRect toRect = [self.currentView convertRect:self.currentView.bounds toView:self.window];
    [UIView animateWithDuration:0.35 animations:^{
        cell.coverImageView.clipsToBounds = YES;
        cell.coverImageView.frame = toRect;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];
        cell.titleLabel.hidden = YES;
    } completion:^(BOOL finished) {
        cell.titleLabel.hidden = NO;
        [self removeFromSuperview];
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger index = (NSInteger)(scrollView.contentOffset.y / UIScreen.mainScreen.bounds.size.height);
    self.currentView = self.viewChangeBlock(index);
}

#pragma mark - Lazy
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = UIScreen.mainScreen.bounds.size;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[WDVideoDetailCellCollectionViewCell class] forCellWithReuseIdentifier:@"WDVideoDetailCellCollectionViewCell"];
        _collectionView.showsVerticalScrollIndicator = NO;
    }
    return _collectionView;
}
@end
