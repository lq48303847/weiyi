//
//  WTAnimationViewController.m
//  WeiYi
//
//  Created by TY on 13-11-18.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import "WTAnimationViewController.h"

@interface WTAnimationViewController ()

@end

@implementation WTAnimationViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabBar:(UITabBar*)atabBar didSelectItem:(UITabBarItem*)item
{
    static NSInteger itemTag=0;

    if (itemTag!=item.tag) {
        CATransition* animation = [CATransition animation];
        [animation setDuration:0.75f];
        animation.type=@"rippleEffect";
        if (itemTag>item.tag) {
            [animation setSubtype:kCATransitionFromLeft];
        }else{
            [animation setSubtype:kCATransitionFromRight];
        }
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [[self.view layer]addAnimation:animation forKey:@"switchView"];
        itemTag=item.tag;
    }
}

@end
