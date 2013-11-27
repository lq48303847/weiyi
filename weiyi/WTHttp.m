//
//  WTHttp.m
//  WeiYi
//
//  Created by TY on 13-11-25.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import "WTHttp.h"
#import "SVHTTPRequest.h"
#import "SBJson.h"
#import "WTNetworkState.h"

#define WTHTTP_HOME [WTHTTP_SERVER_IP stringByAppendingPathComponent:(@"api/")]
#define WTURL(SUB_URL) [WTHTTP_HOME stringByAppendingPathComponent:(SUB_URL)]

@implementation WTHttp
#pragma mark ---登陆---
/**登陆
 *
 * @param user:用户
 * @param passwd:密码
 */
+(void)loginUser:(NSString*)user
        password:(NSString*)passwd
 completionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock{
    if (user==nil||passwd==nil) {
        completionBlock(WTReturnCodeMissingParameter,nil);
        return;
    }
    NSMutableDictionary *parameters=[[NSMutableDictionary alloc]initWithObjectsAndKeys:user,@"userName",passwd,@"password",nil];
    [SVHTTPRequest POST:WTURL(@"login")
             parameters:parameters
             completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
                 WTReturnCode returnCode;
                 id data=[WTHttp reCode:response returnCode:&returnCode];
                 if (completionBlock) {
                     completionBlock(returnCode,data);
                 }
             }];
}

#pragma mark ---注册---
/**注册
 *
 * @param user:用户
 * @param passwd:密码
 */
+(void)registerUser:(NSString*)user
           password:(NSString*)passwd
    completionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock{
    if (user==nil||passwd==nil) {
        completionBlock(WTReturnCodeMissingParameter,nil);
        return;
    }
    NSMutableDictionary *parameters=[[NSMutableDictionary alloc]initWithObjectsAndKeys:user,@"userName",passwd,@"password",nil];
    [SVHTTPRequest POST:WTURL(@"register")
             parameters:parameters
             completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
                 WTReturnCode returnCode;
                 id data=[WTHttp reCode:response returnCode:&returnCode];
                 if (completionBlock) {
                     completionBlock(returnCode,data);
                 }
             }];
}

#pragma mark ---修改头像--
/**修改头像
 *
 * @param file:图片文件
 */
+(void)changeHeadFile:(NSData*)file
      completionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock{
    if ([WTUserInfo sharedUserInfo].apiKey==nil||file==nil) {
        completionBlock(WTReturnCodeMissingParameter,nil);
        return;
    }
    NSMutableDictionary *parameters=[[NSMutableDictionary alloc]initWithObjectsAndKeys:[WTUserInfo sharedUserInfo].apiKey,@"apiKey",file,@"file",nil];
    [SVHTTPRequest POST:WTURL(@"changeHead")
             parameters:parameters
             completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
                 WTReturnCode returnCode;
                 id data=[WTHttp reCode:response returnCode:&returnCode];
                 if (completionBlock) {
                     completionBlock(returnCode,data);
                 }
             }];
}

#pragma mark ---关注好友API--
/**关注好友API
 *
 * @param userId:对方id
 */
+(void)addFriendUserId:(NSString*)userId
       completionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock{
    if ([WTUserInfo sharedUserInfo].apiKey==nil||userId==nil) {
        completionBlock(WTReturnCodeMissingParameter,nil);
        return;
    }
    NSMutableDictionary *parameters=[[NSMutableDictionary alloc]initWithObjectsAndKeys:[WTUserInfo sharedUserInfo].apiKey,@"apiKey",userId,@"userId",nil];
    
    [SVHTTPRequest POST:WTURL(@"addFriend")
             parameters:parameters
             completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
                 WTReturnCode returnCode;
                 id data=[WTHttp reCode:response returnCode:&returnCode];
                 if (completionBlock) {
                     completionBlock(returnCode,data);
                 }
             }];
    
}

#pragma mark ---获取已关注列表API--
/**获取已关注列表API
 *
 */
+(void)getFriendCompletionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock{
    if ([WTUserInfo sharedUserInfo].apiKey==nil) {
        completionBlock(WTReturnCodeMissingParameter,nil);
        return;
    }
    NSMutableDictionary *parameters=[[NSMutableDictionary alloc]initWithObjectsAndKeys:[WTUserInfo sharedUserInfo].apiKey,@"apiKey",nil];
    [SVHTTPRequest POST:WTURL(@"getFriend")
             parameters:parameters
             completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
                 WTReturnCode returnCode;
                 id data=[WTHttp reCode:response returnCode:&returnCode];
                 if (completionBlock) {
                     completionBlock(returnCode,data);
                 }
             }];
}

#pragma mark ---查看我的粉丝列表API--
/**查看我的粉丝列表API
 *
 */
+(void)getFansCompletionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock{
    if ([WTUserInfo sharedUserInfo].apiKey==nil) {
        completionBlock(WTReturnCodeMissingParameter,nil);
        return;
    }
    NSMutableDictionary *parameters=[[NSMutableDictionary alloc]initWithObjectsAndKeys:[WTUserInfo sharedUserInfo].apiKey,@"apiKey",nil];
    [SVHTTPRequest POST:WTURL(@"getFans")
             parameters:parameters
             completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
                 WTReturnCode returnCode;
                 id data=[WTHttp reCode:response returnCode:&returnCode];
                 if (completionBlock) {
                     completionBlock(returnCode,data);
                 }
             }];
}

#pragma mark ---报告我的位置--
/**报告我的位置
 *
 * @param longitude:坐标
 * @param latitude:坐标
 */
+(void)reportLocLongitude:(NSString*)longitude
                 latitude:(NSString*)latitude
          CompletionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock{
    if ([WTUserInfo sharedUserInfo].apiKey==nil||longitude!=nil||latitude!=nil) {
        completionBlock(WTReturnCodeMissingParameter,nil);
        return;
    }
    NSMutableDictionary *parameters=[[NSMutableDictionary alloc]initWithObjectsAndKeys:[WTUserInfo sharedUserInfo].apiKey,@"apiKey",longitude,@"longitude",latitude,@"latitude",nil];
    [SVHTTPRequest POST:WTURL(@"reportLoc")
             parameters:parameters
             completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
                 WTReturnCode returnCode;
                 id data=[WTHttp reCode:response returnCode:&returnCode];
                 if (completionBlock) {
                     completionBlock(returnCode,data);
                 }
             }];
}

#pragma mark ---发布状态--
/**发布状态
 * @param text:发布的内容
 * @param longitude:坐标
 * @param latitude:坐标
 */
+(void)pubStatusTextNull:(NSString*)text
           LongitudeNull:(NSString*)longitude
            latitudeNull:(NSString*)latitude
         CompletionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock{
    if ([WTUserInfo sharedUserInfo].apiKey==nil) {
        completionBlock(WTReturnCodeMissingParameter,nil);
        return;
    }
    NSMutableDictionary *parameters=[[NSMutableDictionary alloc]initWithObjectsAndKeys:[WTUserInfo sharedUserInfo].apiKey,@"apiKey",nil];
    if (text) {
        [parameters setObject:text forKey:@"text"];
    }
    if (longitude&&latitude) {
        [parameters setObject:longitude forKey:@"longitude"];
        [parameters setObject:latitude forKey:@"latitude"];
    }
    [SVHTTPRequest POST:WTURL(@"pubStatus")
             parameters:parameters
             completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
                 WTReturnCode returnCode;
                 id data=[WTHttp reCode:response returnCode:&returnCode];
                 if (completionBlock) {
                     completionBlock(returnCode,data);
                 }
             }];
}

#pragma mark ---我发布的状态列表--
/**发布状态
 * @param pageIndex:默认1
 * @param pageSize:默认10
 */
+(void)myStatusPageIndexNull:(NSString*)pageIndex
                pageSizeNull:(NSString*)pageSize
             CompletionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock{
    if ([WTUserInfo sharedUserInfo].apiKey==nil) {
        completionBlock(WTReturnCodeMissingParameter,nil);
        return;
    }
    NSMutableDictionary *parameters=[[NSMutableDictionary alloc]initWithObjectsAndKeys:[WTUserInfo sharedUserInfo].apiKey,@"apiKey",nil];
    if (pageIndex) {
        [parameters setObject:pageIndex forKey:@"pageIndex"];
    }
    if (pageSize) {
        [parameters setObject:pageSize forKey:@"pageSize"];
    }
    [SVHTTPRequest POST:WTURL(@"myStatus")
             parameters:parameters
             completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
                 WTReturnCode returnCode;
                 id data=[WTHttp reCode:response returnCode:&returnCode];
                 if (completionBlock) {
                     completionBlock(returnCode,data);
                 }
             }];
}

#pragma mark ---对状态点赞的用户列表---
/**对状态点赞的用户列表
 *
 * @param statusId:状态id
 * @param pageIndex:默认1
 * @param pageSize:默认10
 */
+(void)likedUsersStatusId:(NSString*)statusId
            PageIndexNull:(NSString*)pageIndex
             pageSizeNull:(NSString*)pageSize
          completionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock{
    if ([WTUserInfo sharedUserInfo].apiKey==nil||statusId==nil) {
        completionBlock(WTReturnCodeMissingParameter,nil);
        return;
    }
    NSMutableDictionary *parameters=[[NSMutableDictionary alloc]initWithObjectsAndKeys:[WTUserInfo sharedUserInfo].apiKey,@"apiKey",statusId,@"statusId",nil];
    
    if (pageIndex) {
        [parameters setObject:pageIndex forKey:@"pageIndex"];
    }
    if (pageSize) {
        [parameters setObject:pageSize forKey:@"pageSize"];
    }
    
    [SVHTTPRequest POST:WTURL(@"likedUsers")
             parameters:parameters
             completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
                 WTReturnCode returnCode;
                 id data=[WTHttp reCode:response returnCode:&returnCode];
                 if (completionBlock) {
                     completionBlock(returnCode,data);
                 }
             }];
    
}

#pragma mark ---赞一下状态--
/**赞一下状态
 *
 * @param statusId:状态id
 */
+(void)likeStatusStatusId:(NSString*)statusId
          completionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock{
    if ([WTUserInfo sharedUserInfo].apiKey==nil||statusId==nil) {
        completionBlock(WTReturnCodeMissingParameter,nil);
        return;
    }
    NSMutableDictionary *parameters=[[NSMutableDictionary alloc]initWithObjectsAndKeys:[WTUserInfo sharedUserInfo].apiKey,@"apiKey",statusId,@"statusId",nil];
    
    [SVHTTPRequest POST:WTURL(@"likeStatus")
             parameters:parameters
             completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
                 WTReturnCode returnCode;
                 id data=[WTHttp reCode:response returnCode:&returnCode];
                 if (completionBlock) {
                     completionBlock(returnCode,data);
                 }
             }];
    
}

/**判断服务器返回的数据
 */
+(id)reCode:(id)response returnCode:(WTReturnCode*)returnCode{
    
    id json=response;
    WTReturnCode recode=WTReturnCodeSuccess;
    id data;
    
    if ([json isKindOfClass:[NSDictionary class]]) {
        NSDictionary *jsonDictionary=json;
        if (jsonDictionary) {
            data=jsonDictionary[@"data"];
            if (jsonDictionary[@"state"]!=nil) {
                NSInteger reCode=[jsonDictionary[@"state"] integerValue];
                switch (reCode) {
                    case 1:
                        recode=WTReturnCodeSuccess;
                        break;
                    case 2:
                        recode=WTReturnCodeUserOrPasswdError;
                        break;
                    case 3:
                        recode=WTReturnCodeUserAlreadyExists;
                        break;
                    case 4:
                        recode=WTReturnCodeUploadFileError;
                        break;
                    case -1:
                        recode=WTReturnCodeUnknownError;
                        break;
                    case 404:
                        recode=WTReturnCodeMissingParameter;
                        break;
                    case 500:
                        recode=WTReturnCodeAPIKEYInvalid;
                        break;
                    default:
                        NSAssert(NO, @"服务器返回错误编码未知:%d",reCode);
                        break;
                }
            }
        }
    }
    if(![WTNetworkState isServerConnect]) {
        recode=WTReturnCodeServerConnectError;
    }
    *returnCode = recode;
    
    NSLog(@"%@",data);
    
    return data;
}

@end
