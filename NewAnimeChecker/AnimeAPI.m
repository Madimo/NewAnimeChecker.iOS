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
        NSString *dataString = [NSString stringWithFormat:@"u=%@&p=%@", username, password];
        NSData *result = [HTTPRequestSender sendPostRequestWithUrl:@"http://api.ricter.info/login" dataString:dataString];
        NSLog(@"%@", [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding]);
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:result options:kNilOptions error:nil];
        [self processErrorWithJson:json];
        key = json[@"data"][@"key"];
    }
    @catch (NSException *exception) {
        @throw exception;
    }
}

- (void)registerWithUsername:(NSString *)username password:(NSString *)password
{

}

- (NSArray *)getSubscriptionList
{
    return nil;
}


- (void)processErrorWithJson:(NSDictionary *)json
{
    NSLog(@"%@", json[@"status"]);
    if ([json[@"status"] intValue] != 200) {
        @throw [[NSException alloc] initWithName:@"APIReturnError" reason:json[@"message"] userInfo:nil];
    }
}

@end
