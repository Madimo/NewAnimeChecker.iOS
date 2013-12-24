//
//  HTTPRequest.h
//  Rlooking
//
//  Created by Madimo on 13-12-19.
//  Copyright (c) 2013年 Madimo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPRequestSender : NSObject

+ (NSString *)sendGetRequestWithUrl:(NSString *)url;

@end
