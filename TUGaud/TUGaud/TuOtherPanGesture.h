//
//  TuOtherPanGesture.h
//  TUGaud
//
//  Created by Mac on 2019/12/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TuOtherPanGesture : NSObject

@property (nonatomic, assign, readonly) BOOL isPanGesture;

+ (instancetype)panGestureView:(UIView *)gestureView;

- (void)tu_panGesture:(UIPanGestureRecognizer *)gesture;

@end

NS_ASSUME_NONNULL_END
