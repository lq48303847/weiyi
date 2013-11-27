//
//  WTNetworkState.m
//  WeiYi
//
//  Created by TY on 13-11-25.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import "WTNetworkState.h"

@implementation WTNetworkState
// 是否wifi
+ (BOOL)isEnableWIFI {
    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] ==ReachableViaWiFi);
}
// 是否3G
+ (BOOL)isEnable3G {
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] ==ReachableViaWWAN);
}
// 网络连接
+ (BOOL)isConnect {
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] !=NotReachable);
}
//判断当前网络是否连接
+(BOOL)isServerConnect{
    return [[Reachability reachabilityWithHostname:WTHTTP_SERVER_IP] currentReachabilityStatus]!=NotReachable;
}
//检查服务器连接情况
+(NetworkStatus)getServerConnect{
    return [[Reachability reachabilityWithHostname:WTHTTP_SERVER_IP] currentReachabilityStatus];
}
@end
