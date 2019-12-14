//
//  TuOtherViewController.m
//  TUGaud
//
//  Created by Mac on 2019/12/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "TuOtherViewController.h"

@interface TuOtherViewController ()



@end

@implementation TuOtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    NSInteger height = (KScreenHeight-KStatusHeight)/2-100;
    [self tu_setupScrollContent];
    self.rootScrollView.scrollEnabled = NO;
    self.rootScrollView.contentSize = CGSizeMake(KScreenWidth, KScreenHeight+20);
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, height)];
    topView.backgroundColor = [UIColor greenColor];
    topView.tag = 1000;
    [self.rootScrollView addSubview:topView];
    NSInteger originY = height*0.2;
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, originY, KScreenWidth, height)];
    centerView.backgroundColor = [UIColor blueColor];
    centerView.tag = 1001;
    [self.rootScrollView addSubview:centerView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint translatedPoint = [scrollView.panGestureRecognizer translationInView:scrollView];
    if(translatedPoint.y < 0) {
        scrollView.scrollEnabled = YES;
    }
    if(translatedPoint.y > 0) {
        scrollView.scrollEnabled = NO;
    }
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
