//
//  WTDynamicCell.m
//  WeiYi
//
//  Created by TY on 13-11-26.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import "WTDynamicCell.h"

@implementation WTDynamicCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    NSString *content=self.userInfoContent.text;
    CGSize contextFontSize=[content sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(230, 500) lineBreakMode:NSLineBreakByWordWrapping];
    [self.userInfoContent setFrame:CGRectMake(self.userInfoContent.frame.origin.x, self.userInfoContent.frame.origin.y, contextFontSize.width, contextFontSize.height)];
    
}
@end
