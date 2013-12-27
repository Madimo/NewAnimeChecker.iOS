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

}

- (void)registerWithUsername:(NSString *)username password:(NSString *)password
{

}

- (NSArray *)getSubscriptionList
{

}


- (void)processErrorWithResult:(NSString *)result
{

}

@end
