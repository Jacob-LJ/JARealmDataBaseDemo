//
//  SampleUser.m
//  JARealmDataBaseDemo
//
//  Created by Jacob_Liang on 2017/9/4.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import "SampleUser.h"

@implementation SampleUser

// 主键
+ (NSString *)primaryKey {
    return @"id";
}

//设置索引,可以加快检索的速度
+ (NSArray *)indexedProperties {
    return @[@"id"];
}

@end
