//
//  ViewController.m
//  LLJSon
//
//  Created by lin on 16/1/1.
//  Copyright (c) 2016年 lin. All rights reserved.
//

#import "ViewController.h"
#import "LLJson.h"

static NSString *kUrl1 = @"http://gc.ditu.aliyun.com/geocoding?a=苏州市";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self JSONTest];
}

- (void)JSONTest {
    NSArray  *test1   = @[@{@"lin": @1}, @{@"jun": @2}, @{@"yi": @3}];
    NSData   *data1   = [LLJson dataWithJSONObject:test1];
    NSArray  *result1 = [LLJson JSONObjectWithData:data1];
    NSDictionary *dic1= result1[0];
    NSNumber *num1    = dic1[@"lin"];
    NSLog(@"%lld", num1.longLongValue);
    
    NSString *url2    = [kUrl1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData   *data2   = [NSData dataWithContentsOfURL:[NSURL URLWithString:url2]];
        NSDictionary *result2 = [LLJson JSONObjectWithData:data2];
        NSLog(@"result2 : %@", result2);
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
