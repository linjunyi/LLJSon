//
//  LLJson.h
//  LLJSon
//
//  Created by lin on 16/1/1.
//  Copyright (c) 2016年 lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLJson : NSObject

//解析JSON格式的数据
+ (id)JSONObjectWithData:(NSData *)data;

//生成JSON格式的数据
+ (NSData *)dataWithJSONObject:(id)object;

@end
