//
//  WTMessageDynamicCell.m
//  weiyi
//
//  Created by TY on 13-11-26.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import "WTMessageDynamicCell.h"

@implementation WTMessageDynamicCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
//    NSString *name=self.dynamicname.text;
//    NSString *evaluate=self.dynamicevaluate.text;
//    CGSize nameFontSize=[name sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(230, 500) lineBreakMode:NSLineBreakByWordWrapping];
//    CGSize evaluateFontSize=[evaluate sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(230, 500) lineBreakMode:NSLineBreakByWordWrapping];
//    [self.dynamicname setFrame:CGRectMake(self.dynamicname.frame.origin.x, self.dynamicname.frame.origin.y, nameFontSize.width, nameFontSize.height)];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
