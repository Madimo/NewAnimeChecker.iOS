//
//  HTTPRequest.m
//  Rlooking
//
//  Created by Madimo on 13-12-19.
//  Copyright (c) 2013年 Madimo. All rights reserved.
//

#import "HTTPRequestSender.h"

@implementation HTTPRequestSender

+ (NSData *)sendGetRequestWithUrl:(NSString *)url
{
    @try {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"GET"];
        
        NSHTTPURLResponse *response = nil;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        if (responseData == nil)
            @throw [[NSException alloc] initWithName:@"NetError" reason:nil userInfo:nil];
        return responseData;
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    @finally {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
}

+ (NSData *)sendPostRequestWithUrl:(NSString *)url dataString:(NSString *)dataString
{
    @try {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:[NSData dataWithBytes:[dataString UTF8String] length:[dataString length]]];
        
        NSHTTPURLResponse *response = nil;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        if (responseData == nil)
            @throw [[NSException alloc] initWithName:@"NetError" reason:nil userInfo:nil];
        return responseData;
        
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    @finally {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
}

@end
