//
//  WTOwnViewController.m
//  WeiYi
//
//  Created by TY on 13-11-18.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import "WTOwnViewController.h"

@interface WTOwnViewController ()

@end

@implementation WTOwnViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SignOut:(id)sender {
    //退出用户
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}
@end
