//
//  WTDynamicCell.h
//  WeiYi
//
//  Created by TY on 13-11-26.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTDynamicCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *userInfoImage;
@property (strong, nonatomic) IBOutlet UILabel *userInfoName;
@property (strong, nonatomic) IBOutlet UILabel *userInfoTime;
@property (strong, nonatomic) IBOutlet UILabel *userInfoComment;
@property (strong, nonatomic) IBOutlet UILabel *userInfoAgree;
@property (strong, nonatomic) IBOutlet UIScrollView *userInfoType;
@property (strong, nonatomic) IBOutlet UILabel *userInfoLong;
@property (strong, nonatomic) IBOutlet UIView *userinfoPhont;
@property (strong, nonatomic) IBOutlet UILabel *userInfoContent;

@end
