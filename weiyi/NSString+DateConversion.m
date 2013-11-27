//
//  NSString+DateConversion.m
//  东方脉搏
//
//  Created by TY on 13-10-29.
//  Copyright (c) 2013年 Reese@objcoder.com. All rights reserved.
//

#import "NSString+DateConversion.h"

@implementation NSString (DateConversion)
/**日期格式转换
 * 已默认日期格式yyyy-MM-dd HH:mm:ss的NSString类型数据转换为指定formatString的日期格式
 * @param formatString:dateFormat数据格式为准
 */
-(NSString*)dateConversionDateFormat:(NSString*)formatString{
   return [self dateConversionOriginalFormat:@"yyyy-MM-dd HH:mm:ss" objectFormat:formatString];
};
/**日期格式转换
 * 已originalformatString日期格式的NSString类型数据转换为指定formatString的日期格式
 * @param originalformatString:原日期格式
 * @param objectFormat:目标日期格式
 */
-(NSString*)dateConversionOriginalFormat:(NSString*)originalformatString objectFormat:(NSString*)objectFormatString{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:originalformatString];//设定时间格式,这里可以设置成自己需要的格式
    NSDate *date =[dateFormat dateFromString:self];
    if (date) {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //设定时间格式,这里可以设置成自己需要的格式
        [dateFormatter setDateFormat:objectFormatString];
        //用[NSDate date]可以获取系统当前时间
        NSString *currentDateStr = [dateFormatter stringFromDate:date];
        return currentDateStr;
    }else{
        return nil;
    }
}
@end
