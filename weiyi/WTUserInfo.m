//
//  WTUserInfo.m
//  WeiYi
//
//  Created by TY on 13-11-25.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import "WTUserInfo.h"
static WTUserInfo *userinfoClass=nil;
@implementation WTUserInfo
@synthesize mainTitleFont;
@synthesize contentFont;
@synthesize nvBackgroundImage;
@synthesize defaultBackgroundColor;
@synthesize apiKey;
@synthesize btnFont;
@synthesize inputTextFont;
@synthesize mainContentFont;
@synthesize titleFont;
@synthesize nvMainTitleFont;
@synthesize nvtitleFont;
@synthesize defaultCellColor;
@synthesize defaultBackgroundImage;
@synthesize messageBackgroundImage;

+(WTUserInfo*)sharedUserInfo{
    @synchronized(self){  //为了确保多线程情况下，仍然确保实体的唯一性
        if (!userinfoClass) {
            userinfoClass=[[self alloc] init]; //该方法会调用 allocWithZone
        }
    }
    return userinfoClass;
}

+(id)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (!userinfoClass) {
            userinfoClass = [super allocWithZone:zone]; //确保使用同一块内存地址
            
            //---------字体设置---------
            //大标题字体格式
            userinfoClass.mainTitleFont=[UIFont fontWithName:@"Arial-BoldItalicMT" size:16];
            
            //普通标题字体格式
            userinfoClass.titleFont=[UIFont fontWithName:@"Arial-BoldItalicMT" size:14];
            
            //主内容字体格式
            userinfoClass.mainContentFont=[UIFont fontWithName:@"Arial-BoldItalicMT" size:14];
            
            //内容字体格式
            userinfoClass.contentFont=[UIFont fontWithName:@"Arial-BoldItalicMT" size:12];
            
            //按钮字体
            userinfoClass.btnFont=[UIFont systemFontOfSize:12];
            
            //输入文本字体
            userinfoClass.inputTextFont=[UIFont fontWithName:@"Arial-BoldItalicMT" size:14];
            
            // 导航标题字体
            userinfoClass.nvMainTitleFont=[UIFont fontWithName:@"Arial-BoldItalicMT" size:16];
            
            // 导航标题字体
            userinfoClass.nvtitleFont=[UIFont fontWithName:@"Arial-BoldItalicMT" size:14];
            
            //---------字体设置---------
            
            //---------背景颜色---------
            // 导航背景图片
            userinfoClass.nvBackgroundImage=[UIImage imageNamed:@"nvImage"];
            
            //界面默认背景图片
            userinfoClass.defaultBackgroundImage=[UIImage imageNamed:@"default"];
            
            //聊天界面界面默认背景图片
            userinfoClass.messageBackgroundImage=[UIImage imageNamed:@"default"];
            
            //界面默认背景颜色
            userinfoClass.defaultBackgroundColor=[UIColor whiteColor];
            
            //cell背景颜色
            userinfoClass.defaultCellColor=[UIColor whiteColor];
            //---------背景颜色---------
            
            return userinfoClass;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone;{
    return self; //确保copy对象也是唯一
}


@end
