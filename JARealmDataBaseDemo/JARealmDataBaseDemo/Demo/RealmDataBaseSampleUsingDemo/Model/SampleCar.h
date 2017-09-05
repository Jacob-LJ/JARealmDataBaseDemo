//
//  SampleCar.h
//  JARealmDataBaseDemo
//
//  Created by Jacob_Liang on 2017/9/4.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import <Realm/Realm.h>
@class SampleUser;

@interface SampleCar : RLMObject

@property NSInteger id;

@property NSString *carName;

@property SampleUser *owner; //对一关系

@property NSString *JA_Color;

@end

RLM_ARRAY_TYPE(SampleCar) // 定义RLMArray<SampleCar>
