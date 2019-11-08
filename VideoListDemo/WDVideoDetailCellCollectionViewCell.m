//
//  WDVideoDetailCellCollectionViewCell.m
//  VideoListDemo
//
//  Created by Unique on 2019/11/6.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDVideoDetailCellCollectionViewCell.h"

@implementation WDVideoDetailCellCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.coverImageView = [[UIImageView alloc] init];
        self.coverImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.coverImageView.clipsToBounds = YES;
        [self.contentView addSubview:self.coverImageView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor =  [UIColor whiteColor];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.coverImageView.frame = self.bounds;
    self.titleLabel.frame = CGRectMake(15, self.bounds.size.height - 100, self.bounds.size.width - 30, 100);
}
@end
