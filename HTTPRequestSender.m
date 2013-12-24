//
//  HTTPRequest.m
//  Rlooking
//
//  Created by Madimo on 13-12-19.
//  Copyright (c) 2013年 Madimo. All rights reserved.
//

#import "HTTPRequestSender.h"

@implementation HTTPRequestSender

+ (NSString *)sendGetRequestWithUrl:(NSString *)url
{
    @try {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"GET"];
        
        NSHTTPURLResponse *response = nil;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        if ([result isEqualToString:@""])
            @throw [[NSException alloc] initWithName:@"NetError" reason:nil userInfo:nil];
        return result;
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    @finally {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
}

@end
