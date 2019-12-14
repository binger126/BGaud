//
//  TuMapViewController.m
//  TUGaud
//
//  Created by Mac on 2019/12/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "TuMapViewController.h"
#import "TuOtherViewController.h"

#import "TuOtherPanGesture.h"

@interface TuMapViewController ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) TuOtherPanGesture *tuGesture;

@end

@implementation TuMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TuOtherViewController *controller = [[TuOtherViewController alloc] init];
    [self addChildViewController:controller];
    [controller didMoveToParentViewController:self];
    self.containerView = controller.view;
    self.containerView.frame = CGRectMake(0, KScreenHeight-100, KScreenWidth, KScreenHeight);
    [self.view addSubview:self.containerView];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(tu_panGesture:)];
    [self.containerView addGestureRecognizer:panGesture];
    self.tuGesture = [TuOtherPanGesture panGestureView:self.containerView];
}
- (void)tu_panGesture:(UIPanGestureRecognizer *)gesture {
    [self.tuGesture tu_panGesture:gesture];
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
