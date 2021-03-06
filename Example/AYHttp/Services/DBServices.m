//
//  DBServices.m
//  AYHttp
//
//  Created by Alan Yeh on 16/8/6.
//  Copyright © 2016年 Alan Yeh. All rights reserved.
//

#import "DBServices.h"
#import <AYHttp/AYHttp.h>

@implementation DBServices
- (AYPromise<DBBook *> *)getBookByID:(NSString *)bookID{
    [AYHttp client].baseURL = [NSURL URLWithString:@"https://api.douban.com"];
    return [[AYHttp client] executeRequest:[AYHttpRequest GET:@"v2/book/{bookID}"].withPathParam(@"bookID", bookID)]
    .then(^(AYHttpResponse *response){
        return response.responseJson;
    });
}

@end
