//
//  TuBaseViewController.h
//  TUGaud
//
//  Created by Mac on 2019/12/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 获取屏幕宽度
 */
#define KScreenWidth \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)

/**
 获取屏幕高度
 */
#define KScreenHeight \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)


/**
 状态栏
 */
#define KStatusHeight [[UIApplication sharedApplication] statusBarFrame].size.height

NS_ASSUME_NONNULL_BEGIN

@interface TuBaseViewController : UIViewController

@property (nonatomic, strong) UIScrollView *rootScrollView;


- (void)tu_setupScrollContent;

@end

NS_ASSUME_NONNULL_END
