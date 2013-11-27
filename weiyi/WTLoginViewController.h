//
//  WTLoginViewController.h
//  WeiYi
//
//  Created by TY on 13-11-18.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTLoginViewController : UIViewController
{
    __weak IBOutlet UITextField *passwrod;
    __weak IBOutlet UITextField *iphoneNum;
}
- (IBAction)loginClick:(id)sender;

- (IBAction)randomPassword:(id)sender;
- (IBAction)resetPassword:(id)sender;
- (IBAction)aboutWeiYi:(id)sender;

@end
