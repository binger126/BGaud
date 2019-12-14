//
//  TuBaseViewController.m
//  TUGaud
//
//  Created by Mac on 2019/12/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "TuBaseViewController.h"

@interface TuBaseViewController ()<UIScrollViewDelegate>

@end

@implementation TuBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)tu_setupScrollContent {
    self.rootScrollView.delegate = self;
    [self.view addSubview:self.rootScrollView];
}
- (UIScrollView *)rootScrollView {
    if (!_rootScrollView) {
        _rootScrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _rootScrollView.contentSize = CGSizeMake(KScreenWidth, KScreenHeight);
        _rootScrollView.showsHorizontalScrollIndicator = NO;
        _rootScrollView.showsVerticalScrollIndicator = NO;
        _rootScrollView.bounces = YES;
        _rootScrollView.scrollEnabled = YES;//控制控件是否能滚动
        _rootScrollView.pagingEnabled = YES;//是否翻页
    }
    return _rootScrollView;
}

- (void)dealloc {
    self.rootScrollView.delegate = nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
