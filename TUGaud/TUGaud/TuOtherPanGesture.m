//
//  TuOtherPanGesture.m
//  TUGaud
//
//  Created by Mac on 2019/12/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "TuOtherPanGesture.h"
#import "TuBaseViewController.h"
#import "UIView+TuFrame.h"

NSInteger const _scrollY = 150;

@interface TuOtherPanGesture ()
{
    NSInteger _containeBottomY;
    NSInteger _containeCenterY;
    NSInteger _containerTopY;
    NSInteger _containerOriginY;
    NSInteger _containerY;
    
    NSInteger _centerOriginY;
}

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, assign, readwrite) BOOL isPanGesture;

@end

@implementation TuOtherPanGesture

+ (instancetype)panGestureView:(UIView *)gestureView {
    return [[self alloc] initWithGestureView:gestureView];
}

- (instancetype)initWithGestureView:(UIView *)gestureView
{
    self = [super init];
    if (self) {
        _containeBottomY = KScreenHeight-100;
        _containeCenterY = KScreenHeight*0.7;
        _containerTopY = KStatusHeight;
        self.containerView = gestureView;
        self.isPanGesture = YES;
    }
    return self;
}

- (void)tu_panGesture:(UIPanGestureRecognizer *)gesture {
    UIView *centerView = [gesture.view viewWithTag:1001];
    CGPoint panPoint = [gesture translationInView:self.containerView.superview];
    if (gesture.state==UIGestureRecognizerStateBegan) {
        _containerOriginY = (NSInteger)self.containerView.tu_y;
        _containerY = _containerOriginY;
        _centerOriginY = centerView.tu_y;
    }else if (gesture.state==UIGestureRecognizerStateChanged) {
        [self tu_panStateChangePoint:panPoint];
    }else if (gesture.state==UIGestureRecognizerStateEnded) {
        CGPoint speed = [gesture velocityInView:gesture.view];
        BOOL isAnimated = [self tu_panStateEndedPoint:panPoint speedPoint:speed];
        if (isAnimated) {
            NSInteger containerOriginY = _containerOriginY;
            UIView *topView = [self.containerView viewWithTag:1000];
            if (containerOriginY==_containerTopY) {
                NSInteger tuY = CGRectGetMaxY(topView.frame);
                [UIView animateWithDuration:0.25 animations:^{
                    centerView.tu_y = tuY;
                } completion:^(BOOL finished) {
                    UIScrollView *rootScroll = (UIScrollView *)centerView.superview;
                    rootScroll.scrollEnabled = YES;
                    self.isPanGesture = NO;
                }];
            }
            if (containerOriginY==_containeCenterY) {
                NSInteger tuY = CGRectGetMaxY(topView.frame)*0.2;
                [UIView animateWithDuration:0.25 animations:^{
                    centerView.tu_y = tuY;
                } completion:^(BOOL finished) {
                    UIScrollView *rootScroll = (UIScrollView *)centerView.superview;
                    rootScroll.scrollEnabled = NO;
                    self.isPanGesture = YES;
                }];
            }
            if (containerOriginY==_containeBottomY) {
                NSInteger tuY = CGRectGetMaxY(topView.frame)*0.2;
                [UIView animateWithDuration:0.25 animations:^{
                    centerView.tu_y = tuY;
                } completion:^(BOOL finished) {
                    UIScrollView *rootScroll = (UIScrollView *)centerView.superview;
                    rootScroll.scrollEnabled = NO;
                    self.isPanGesture = YES;
                }];
            }
            [UIView animateWithDuration:0.25 animations:^{
                self.containerView.tu_y = containerOriginY;
            }];
        }
    }
}
- (void)tu_panStateChangePoint:(CGPoint)panPoint{
    _containerOriginY = _containerY+panPoint.y;
    if (_containerOriginY<=_containerTopY) {//滑动到顶端
        _containerOriginY = _containerTopY;//固定顶端位置
    }
    if (_containerOriginY>=_containeBottomY) {//滑动到最下面
        _containerOriginY = _containeBottomY;//固定最下面的位置
    }
    self.containerView.tu_y = _containerOriginY;
    
    UIView *centerView = [self.containerView viewWithTag:1001];
    if (panPoint.y<0) {//向上
        if (_containerOriginY<=_containerTopY) {//如果已经在顶端，向上滑动直接返回
            UIScrollView *rootScroll = (UIScrollView *)centerView.superview;
            rootScroll.contentSize = CGSizeMake(rootScroll.contentSize.width, rootScroll.contentSize.height+50);
            return;
        }
        if (_containerY == _containeBottomY) {
            if (_containerOriginY<=_containeCenterY) {
                NSInteger panY = panPoint.y;
                NSInteger tuY = labs(panY)*0.5;
                UIView *topView = [self.containerView viewWithTag:1000];
                if (tuY>=topView.tu_height) {
                    tuY = topView.tu_height;
                }
                centerView.tu_y = tuY;
            }
        }
        if (_containerY == _containeCenterY) {
            NSInteger tuY = _centerOriginY+fabs(panPoint.y)*0.5;
            UIView *topView = [self.containerView viewWithTag:1000];
            if (tuY>=topView.tu_height) {
                tuY = topView.tu_height;
            }
            centerView.tu_y = tuY;
        }
    }
    if (panPoint.y>0) {//向下
        if (_containerOriginY>=_containeBottomY) {//
            return;
        }
        if (_containerOriginY<=_containeCenterY) {
            NSInteger tuY = _centerOriginY-panPoint.y*0.5;
            UIView *topView = [self.containerView viewWithTag:1000];
            if (tuY<=topView.tu_height*0.2) {
                tuY = topView.tu_height*0.2;
            }
            centerView.tu_y = tuY;
        }
    }
    
}
- (BOOL)tu_panStateEndedPoint:(CGPoint)panPoint speedPoint:(CGPoint)speed {
    if (panPoint.y<0) {//向上滑动
        if (_containerY==_containerTopY) {//如果已经在顶端，向上滑动直接返回
            return NO;
        }
        if (fabs(speed.y)>=1000) {//速度大于1000
            if (_containerY==_containeBottomY) {//如果在最下面向上滑动
                _containerOriginY = _containeCenterY;//直接赋值CenterY
            }
            if (_containerY==_containeCenterY) {//如果在中间向上滑动
                _containerOriginY = _containerTopY;//直接赋值TopY
            }
            return YES;
        }
        //速度小于1000
        if (_containerY==_containeBottomY) {//如果在最下面向上滑动
            if (fabs(panPoint.y)<=_scrollY/3) {//距离小于等于50
                _containerOriginY = _containeBottomY;//回到初始位置
            }else if (fabs(panPoint.y)>=_scrollY) {//距离大于等于150
                _containerOriginY = _containerTopY;//直接赋值TopY
            }else {//距离大于50
                _containerOriginY = _containeCenterY;//直接赋值CenterY
            }
            return YES;
        }
        if (_containerY==_containeCenterY) {//如果在中间向上滑动
            if (fabs(panPoint.y)>=_scrollY) {//距离大于等于150
                _containerOriginY = _containerTopY;//直接赋值TopY
            }else {
                _containerOriginY = _containeCenterY;//回到初始位置
            }
            return YES;
        }
        return NO;
    }
    if (panPoint.y>0) {//向下滑动
        if (_containerY==_containeBottomY) {//如果已经在最下面，向下滑动直接返回
            return NO;
        }
        if (fabs(speed.y)>=1000) {//速度大于1000
            if (_containerY==_containeCenterY) {//如果在中间向下滑动
                _containerOriginY = _containeBottomY;//直接赋值BottomY
            }
            if (_containerY==_containerTopY) {//如果在顶端向下滑动
                _containerOriginY = _containeCenterY;//直接赋值CenterY
            }
            return YES;
        }
        //速度小于1000 按照滑动距离计算
        if (_containerY==_containeCenterY) {//如果在中间向下滑动
            if (panPoint.y<=_scrollY/3) {//距离小于等于50
                _containerOriginY = _containeCenterY;//回到初始位置
            }else {//距离大于50
                _containerOriginY = _containeBottomY;//直接赋值BottomY
            }
            return YES;
        }
        if (_containerY==_containerTopY) {//如果在顶端向下滑动
            if (labs(_containeBottomY-_containerOriginY)<=_scrollY/3) {
                _containerOriginY = _containeBottomY;//直接赋值BottomY
                return YES;
            }
            if (panPoint.y>=_scrollY) {//距离大于等于150
                _containerOriginY = _containeCenterY;//直接赋值CenterY
            }else {//距离小于150
                _containerOriginY = _containerTopY;//回到初始位置
            }
            return YES;
        }
        return NO;
    }
    return NO;
}

@end
