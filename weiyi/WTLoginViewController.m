//
//  WTLoginViewController.m
//  WeiYi
//
//  Created by TY on 13-11-18.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import "WTLoginViewController.h"
#import "WTAboutWeiyi.h"
#import "WTResetPasswordViewController.h"
@interface WTLoginViewController ()

@end

@implementation WTLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    //隐藏导航条
        [self.navigationController setNavigationBarHidden:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginClick:(id)sender {
    [WTHttp loginUser:@"lq48303847" password:@"48303847" completionBlock:^(WTReturnCode returnCode, NSDictionary *dataDict) {
        [WTUserInfo sharedUserInfo].apiKey=dataDict[@"apiKey"];
    }];
  
    if (NO) {
        //第一次登录
        [self performSegueWithIdentifier:@"firstTime" sender:self];
    }else{
        //不是第一次登录
        [self performSegueWithIdentifier:@"notFirstTime" sender:self];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (IBAction)randomPassword:(id)sender {
    CGSize windowSize;
    windowSize=[[UIScreen mainScreen] bounds].size;
    NSLog(@"width:%.0f,height:%.0f",windowSize.width,windowSize.height);
}

- (IBAction)resetPassword:(id)sender {
    WTResetPasswordViewController *resetPassword=[[WTResetPasswordViewController alloc]init];
    [self.navigationController pushViewController:resetPassword animated:YES];
}

- (IBAction)aboutWeiYi:(id)sender {
    WTAboutWeiyi *weiyi=[[WTAboutWeiyi alloc]init];
    [self.navigationController pushViewController:weiyi animated:YES];

}
@end
