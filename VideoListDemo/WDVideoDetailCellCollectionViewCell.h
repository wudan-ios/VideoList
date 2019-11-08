//
//  WDVideoDetailCellCollectionViewCell.h
//  VideoListDemo
//
//  Created by Unique on 2019/11/6.
//  Copyright © 2019 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WDVideoDetailCellCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *backView;
@end

NS_ASSUME_NONNULL_END
