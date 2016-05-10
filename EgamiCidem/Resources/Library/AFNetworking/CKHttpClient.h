//
//  CKHttpClient.h
//  MedCaseHttpTest
//
//  Created by Apple on 15/4/9.
//  Copyright (c) 2015年 iHefe. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"


#define HttpClient [CKHttpClient getInstance]

@interface CKHttpClient : AFHTTPRequestOperationManager
+ (instancetype)getInstance;
+ (AFHTTPRequestOperationManager *)getAFNInstance;
@end
