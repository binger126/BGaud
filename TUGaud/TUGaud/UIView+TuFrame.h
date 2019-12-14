//
//  UIView+TuFrame.h
//  TUGaud
//
//  Created by Mac on 2019/12/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TuFrame)

@property (nonatomic, assign) CGFloat tu_x;
@property (nonatomic, assign) CGFloat tu_y;
@property (nonatomic, assign) CGFloat tu_centerX;
@property (nonatomic, assign) CGFloat tu_centerY;
@property (nonatomic, assign) CGFloat tu_width;
@property (nonatomic, assign) CGFloat tu_height;
@property (nonatomic, assign) CGSize tu_size;


@end

NS_ASSUME_NONNULL_END
