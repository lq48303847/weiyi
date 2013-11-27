//
//  WTHttp.h
//  WeiYi
//
//  Created by TY on 13-11-25.
//  Copyright (c) 2013年 hc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTHttp : NSObject
#pragma mark ---登陆验证---
/**登陆验证
 *
 * @param user:用户
 * @param passwd:密码
 */
+(void)loginUser:(NSString*)user
        password:(NSString*)passwd
 completionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock;

#pragma mark ---注册---
/**注册
 *
 * @param user:用户
 * @param passwd:密码
 */
+(void)registerUser:(NSString*)user
           password:(NSString*)passwd
    completionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock;

#pragma mark ---修改头像--
/**修改头像
 *
 * @param file:图片文件
 */
+(void)changeHeadFile:(NSData*)file
      completionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock;

#pragma mark ---关注好友API--
/**关注好友API
 *
 * @param userId:密码
 */
+(void)addFriendUserId:(NSString*)userId
       completionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock;

#pragma mark ---获取已关注列表API--
/**获取已关注列表API
 *
 */
+(void)getFriendCompletionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock;

#pragma mark ---查看我的粉丝列表API--
/**查看我的粉丝列表API
 *
 */
+(void)getFansCompletionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock;

#pragma mark ---报告我的位置--
/**报告我的位置
 *
 */
+(void)reportLocLongitude:(NSString*)longitude
                 latitude:(NSString*)latitude
          CompletionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock;

#pragma mark ---发布状态--
/**发布状态
 * @param text:发布的内容
 * @param longitude:坐标
 * @param latitude:坐标
 */
+(void)pubStatusTextNull:(NSString*)text
           LongitudeNull:(NSString*)longitude
            latitudeNull:(NSString*)latitude
         CompletionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock;

#pragma mark ---我发布的状态列表--
/**发布状态
 * @param pageIndex:默认1
 * @param pageSize:默认10
 */
+(void)myStatusPageIndexNull:(NSString*)pageIndex
                pageSizeNull:(NSString*)pageSize
             CompletionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock;

#pragma mark ---赞一下状态--
/**赞一下状态
 *
 * @param statusId:状态id
 */
+(void)likeStatusStatusId:(NSString*)statusId
          completionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock;

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
          completionBlock:(void (^)(WTReturnCode returnCode,id data))completionBlock;
@end
