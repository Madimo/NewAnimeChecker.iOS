//
//  AnimeAPI.h
//  NewAnimeChecker
//
//  Created by Madimo on 13-12-24.
//  Copyright (c) 2013年 Madimo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimeAPI : NSObject {
    NSString *key;
}

- (void)loginWithUsername:(NSString *)username password:(NSString *)password;
- (void)registerWithUsername:(NSString *)username password:(NSString *)password;
- (NSArray *)getSubscriptionList;

@end
