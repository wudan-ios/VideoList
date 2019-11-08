//
//  WDVideoDetailView.h
//  VideoListDemo
//
//  Created by Unique on 2019/11/6.
//  Copyright © 2019 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef UIView *_Nullable(^WDVideoDetailViewDidChangeViewBlock)(NSInteger index);

@interface WDVideoDetailView : UIView

+ (instancetype)manager;

- (void)showDetailView:(NSString *)coverImageName
          currentIndex:(NSInteger)index
            currenView:(UIView *)view
    didChangeViewBlock:(WDVideoDetailViewDidChangeViewBlock)block;

@end

NS_ASSUME_NONNULL_END
