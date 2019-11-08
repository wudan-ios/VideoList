//
//  WDVideoCollectionViewCell.m
//  VideoListDemo
//
//  Created by Unique on 2019/11/6.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDVideoCollectionViewCell.h"

@implementation WDVideoCollectionViewCell
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
    self.titleLabel.frame = self.bounds;
}
@end
