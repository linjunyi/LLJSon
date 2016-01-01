//
//  LLJson.m
//  LLJSon
//
//  Created by lin on 16/1/1.
//  Copyright (c) 2016年 lin. All rights reserved.
//

#import "LLJson.h"

@implementation LLJson

+ (id)JSONObjectWithData:(NSData *)data {
    if (data == nil) {
        return nil;
    }
    NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if ([content hasPrefix:@"["]) {
        NSLog(@"LLJSONObjectTypeArray");
    }else if ([content hasPrefix:@"{"]) {
        NSLog(@"LLJSONObjectTypeDictionary");
    }
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) {
        NSLog(@"%@", error.localizedDescription);
        return nil;
    }
    return object;
}

+ (NSData *)dataWithJSONObject:(id)object {
    if ([NSJSONSerialization isValidJSONObject:object]) {
        NSError *error = nil;
        id data = [NSJSONSerialization dataWithJSONObject:object options:kNilOptions error:&error];
        if (error != nil) {
            NSLog(@"%@", error.localizedDescription);
            return nil;
        }
        return data;
    }
    return nil;
}

@end
