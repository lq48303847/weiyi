//
//  WTResetPasswordViewController.m
//  WeiYi
//
//  Created by TY on 13-11-18.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import "WTResetPasswordViewController.h"

@interface WTResetPasswordViewController ()

@end

@implementation WTResetPasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
//    [UIView animateWithDuration:0.5 animations:^{
        [self.navigationController setNavigationBarHidden:NO];
//    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"重置密码";
    [self addNav];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark --添加顶部按钮--
- (void)addNav{
    UIButton *backBut=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 66, 42)];
    //    [backBut setImage:[UIImage imageNamed:@"pub_topbar_btn_back"] forState:UIControlStateNormal];
    [backBut setTitle:@"返回" forState:UIControlStateNormal];
    [backBut setTintColor:[UIColor blackColor]];
    [backBut addTarget:self action:@selector(backBtnListener:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton=[[UIBarButtonItem alloc]initWithCustomView:backBut];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    
//    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,backBarButton,nil];
    self.navigationItem.leftBarButtonItem=backBarButton;
}
#pragma mark --顶部按钮事件--
- (void)backBtnListener:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
