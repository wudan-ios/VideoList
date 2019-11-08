//
//  ViewController.m
//  VideoListDemo
//
//  Created by Unique on 2019/11/6.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "ViewController.h"
#import "WDVideoCollectionViewCell.h"
#import "WDVideoDetailViewController.h"
#import "WDVideoDetailView.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频";
    [self.view addSubview:self.collectionView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WDVideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WDVideoCollectionViewCell" forIndexPath:indexPath];
    
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
    WDVideoCollectionViewCell *cell = (WDVideoCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        
    [WDVideoDetailView.manager showDetailView:@"" currentIndex:indexPath.row currenView:cell didChangeViewBlock:^UIView *(NSInteger index) {
        NSIndexPath *tIndexPath = [NSIndexPath indexPathForRow:index inSection:0];
        [collectionView scrollToItemAtIndexPath:tIndexPath atScrollPosition:(UICollectionViewScrollPositionNone) animated:false];
        return [collectionView cellForItemAtIndexPath:tIndexPath];
    }];
}

#pragma mark - Lazy
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        CGFloat width = (UIScreen.mainScreen.bounds.size.width - 30) / 2;
        layout.itemSize = CGSizeMake(width, width * 16 / 9);
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[WDVideoCollectionViewCell class] forCellWithReuseIdentifier:@"WDVideoCollectionViewCell"];
    }
    return _collectionView;
}

@end
