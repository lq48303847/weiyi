//
//  WTUserInfo.h
//  WeiYi
//
//  Created by TY on 13-11-25.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTUserInfo : NSObject{

}
#pragma mark ---个人信息资料---
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *apiKey;

#pragma mark ---字体设置---
@property (nonatomic,strong)UIFont *mainTitleFont;//大标题字体格式
@property (nonatomic,strong)UIFont *titleFont;//普通标题字体格式
@property (nonatomic,strong)UIFont *mainContentFont;//主内容字体格式
@property (nonatomic,strong)UIFont *contentFont;//内容字体格式
@property (nonatomic,strong)UIFont *btnFont;//按钮字体
@property (nonatomic,strong)UIFont *inputTextFont;//输入文本字体
@property (nonatomic,strong)UIFont *nvMainTitleFont;// 导航标题字体
@property (nonatomic,strong)UIFont *nvtitleFont;// 导航标题字体
#pragma mark ---背景颜色---
@property (nonatomic,strong)UIImage *nvBackgroundImage;// 导航背景图片
@property (nonatomic,strong)UIImage *defaultBackgroundImage; //默认背景图片
@property (nonatomic,strong)UIImage *messageBackgroundImage; //聊天背景图片
@property (nonatomic,strong)UIColor *defaultBackgroundColor;//默认背景颜色
@property (nonatomic,strong)UIColor *defaultCellColor;//背景颜色


+(WTUserInfo*)sharedUserInfo;

@end
