//
//  WTNetworkState.h
//  WeiYi
//
//  Created by TY on 13-11-25.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
@interface WTNetworkState : NSObject
// 是否wifi
+ (BOOL)isEnableWIFI;
// 是否3G
+ (BOOL)isEnable3G;
//判断当前网络是否连接服务器
// 网络连接
+ (BOOL)isConnect;
//服务器连接
+ (BOOL)isServerConnect;
//获取服务器连接情况
+ (NetworkStatus)getServerConnect;
@end
