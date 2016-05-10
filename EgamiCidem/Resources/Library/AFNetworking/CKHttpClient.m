//
//  CKHttpClient.m
//  MedCaseHttpTest
//
//  Created by Apple on 15/4/9.
//  Copyright (c) 2015年 iHefe. All rights reserved.
//

#import "CKHttpClient.h"

@implementation CKHttpClient

static CKHttpClient* client = nil;

+ (instancetype)getInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [CKHttpClient manager];
        client.requestSerializer = [AFJSONRequestSerializer serializer];
        client.responseSerializer = [AFJSONResponseSerializer serializer];
        [client.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        client.requestSerializer.timeoutInterval = 15.f;
        [client.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    });
    return client;
}

static AFHTTPRequestOperationManager *manager = nil;
+ (AFHTTPRequestOperationManager *)getAFNInstance
{
    static dispatch_once_t Token;
    dispatch_once(&Token, ^{
        manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/html", nil];
    });
    return manager;
}
@end
