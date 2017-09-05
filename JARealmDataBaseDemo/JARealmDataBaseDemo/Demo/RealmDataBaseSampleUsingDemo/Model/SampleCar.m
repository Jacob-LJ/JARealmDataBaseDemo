//
//  SampleCar.m
//  JARealmDataBaseDemo
//
//  Created by Jacob_Liang on 2017/9/4.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import "SampleCar.h"

@implementation SampleCar

// 主键
+ (NSString *)primaryKey {
    return @"id";
}

//设置属性默认值
+ (NSDictionary *)defaultPropertyValues{
    return @{@"carName":@"测试" };
}

//设置忽略属性,即不存到realm数据库中
+ (NSArray<NSString *> *)ignoredProperties {
    return @[@"JA_Color"];
}

//如果实现了这个方法的话,就只有name为nil会抛出异常; realm可空属性的支持请看文档《可空属性(Optional Properties)》
+ (NSArray *)requiredProperties {
    return @[@"carName"];
}

//设置索引,可以加快检索的速度
+ (NSArray *)indexedProperties {
    return @[@"id"];
}

@end
