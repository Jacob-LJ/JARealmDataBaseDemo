//
//  SampleUser.h
//  JARealmDataBaseDemo
//
//  Created by Jacob_Liang on 2017/9/4.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import <Realm/Realm.h>
#import "SampleCar.h"

@interface SampleUser : RLMObject

/*
 注意: RLMObject 官方建议不要加上 Objective-C的property attributes(如nonatomic, atomic, strong, copy, weak 等等）假如设置了，这些attributes会一直生效直到RLMObject被写入realm数据库
 */

//用户注册id
@property NSInteger id;
//姓名
@property NSString *userName;

@property RLMArray<SampleCar> *cars; //对多关系

@end
RLM_ARRAY_TYPE(SampleUser) // 定义RLMArray<RLMUser>
