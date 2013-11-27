//
//  WTMessageDynamicCell.h
//  weiyi
//
//  Created by TY on 13-11-26.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTMessageDynamicCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *dynamicuserimage;
@property (strong, nonatomic) IBOutlet UILabel *dynamicname;
@property (strong, nonatomic) IBOutlet UILabel *dynamiccontent;
@property (strong, nonatomic) IBOutlet UILabel *dynamictime;
@property (strong, nonatomic) IBOutlet UILabel *dynamicevaluate;
@property (strong, nonatomic) IBOutlet UIImageView *dynamiceImage;

@end
