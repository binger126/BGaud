//
//  UIView+TuFrame.m
//  TUGaud
//
//  Created by Mac on 2019/12/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "UIView+TuFrame.h"

@implementation UIView (TuFrame)

- (void)setTu_x:(CGFloat)tu_x
{
    CGRect frame = self.frame;
    frame.origin.x = tu_x;
    self.frame = frame;
}

- (CGFloat)tu_x
{
    return self.frame.origin.x;
}

- (void)setTu_y:(CGFloat)tu_y
{
    CGRect frame = self.frame;
    frame.origin.y = tu_y;
    self.frame = frame;
}

- (CGFloat)tu_y
{
    return self.frame.origin.y;
}

- (void)setTu_centerX:(CGFloat)tu_centerX
{
    CGPoint center = self.center;
    center.x = tu_centerX;
    self.center = center;
}

- (CGFloat)tu_centerX
{
    return self.center.x;
}

- (void)setTu_centerY:(CGFloat)tu_centerY
{
    CGPoint center = self.center;
    center.y = tu_centerY;
    self.center = center;
}

- (CGFloat)tu_centerY
{
    return self.center.y;
}

- (void)setTu_width:(CGFloat)tu_width
{
    CGRect frame = self.frame;
    frame.size.width = tu_width;
    self.frame = frame;
}

- (CGFloat)tu_width
{
    return self.frame.size.width;
}

- (void)setTu_height:(CGFloat)tu_height
{
    CGRect frame = self.frame;
    frame.size.height = tu_height;
    self.frame = frame;
}

- (CGFloat)tu_height
{
    return self.frame.size.height;
}

- (void)setTu_size:(CGSize)tu_size
{
    CGRect frame = self.frame;
    frame.size = tu_size;
    self.frame = frame;
}

- (CGSize)tu_size
{
    return self.frame.size;
}


@end
