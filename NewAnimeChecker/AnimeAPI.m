//
//  AnimeAPI.m
//  NewAnimeChecker
//
//  Created by Madimo on 13-12-24.
//  Copyright (c) 2013年 Madimo. All rights reserved.
//

#import "AnimeAPI.h"
#import "HTTPRequestSender.h"

@implementation AnimeAPI

- (id)init
{
    self = [super init];
    if (self) {
        key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    }
    return self;
}

- (void)loginWithUsername:(NSString *)username password:(NSString *)password
{
    @try {
        NSString *url = [NSString stringWithFormat:@"http://api2.ricter.info/login?u=%@&p=%@", username, password];
        NSString *result = [HTTPRequestSender sendGetRequestWithUrl:url];
        [self processErrorWithResult:result];
        key = result;
    }
    @catch (NSException *exception) {
        @throw exception;
    }
}

- (void)registerWithUsername:(NSString *)username password:(NSString *)password
{
    @try {
        NSString *url = [NSString stringWithFormat:@"http://api2.ricter.info/reg?u=%@&p=%@", username, password];
        NSString *result = [HTTPRequestSender sendGetRequestWithUrl:url];
        [self processErrorWithResult:result];
        key = result;
    }
    @catch (NSException *exception) {
        @throw exception;
    }
}

/*
 *      ERROR_INVALID_DATA    数据提交错误，指参数不足或其他错误
 *      ERROR_INVALID_PSW     密码错误，在登陆以及修改密码时候可能遇到
 *      ERROR_INVALID_KEY     KEY错误，指KEY不存在，常见错误
 *      ERROR_INVALID_AID     AID错误，AID指的是订阅新番的ID号码，返回此错误原因是订阅可能不存在或者是电影
 *      ERROR_INVALID_NEWPW   新密码错误，指修改密码时新密码过长或过短
 *      ERROR_EXIST_EMAIL     EMAIL已被注册
 *      ERROR_EXIST_ANIME     订阅重复添加时的错误
 *      ERROR_INVALID_EPI     用户看到的集数错误，可能是大于总集数或小于0
 *      ERROR_SYSTEM          系统错误，和APP无关
 */

- (void)processErrorWithResult:(NSString *)result
{
    if ([result rangeOfString:@"ERROR_"].location != NSNotFound) {
        NSString *name, *reason;
        if ([result rangeOfString:@"ERROR_INVALID_PSW"].location != NSNotFound) {
            name   = @"ERROR_INVALID_PSW";
            reason = @"密码错误";
        } else if ([result rangeOfString:@"ERROR_INVALID_KEY"].location != NSNotFound) {
            name   = @"ERROR_INVALID_KEY";
            reason = @"您的帐号授权已过期，请重新登陆";
        } else if ([result rangeOfString:@"ERROR_EXIST_EMAIL"].location != NSNotFound) {
            name   = @"ERROR_EXIST_EMAIL";
            reason = @"您填写的邮箱已经被注册，请直接登陆或换个邮箱重试";
        } else if ([result rangeOfString:@"ERROR_EXIST_ANIME"].location != NSNotFound) {
            name   = @"ERROR_EXIST_ANIME";
            reason = @"此订阅已经在您的订阅列表中，请不要重复添加";
        } else if ([result rangeOfString:@"ERROR_SYSTEM"].location != NSNotFound) {
            name   = @"ERROR_SYSTEM";
            reason = @"服务器内部错误，请稍后重试";
        } else {
            name   = @"ERROR_UNKNOWN";
            reason = @"发生了错误，请重试";
        }
        
        @throw [[NSException alloc] initWithName:name reason:reason userInfo:nil];
    }
}

@end
