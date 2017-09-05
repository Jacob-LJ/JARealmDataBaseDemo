//
//  JADataBaseModel.h
//  JARealmDataBaseDemo
//
//  Created by Jacob_Liang on 2017/9/4.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import <Realm/Realm.h>

#define JADB_Array_Type(ClassName) RLM_ARRAY_TYPE(ClassName) // 通过宏创建协议 表示 模型的对多关系
#define JADB_Array(OnlyRLMObjectTypeClassName) RLMArray<OnlyRLMObjectTypeClassName> //RLMArray: 属性类型; RLMArray 不支持存储 nil 值

//非可选值类型
#define JADB_EnumType(EnumTypeName) NSInteger
#define JADB_Integer NSInteger
#define JADB_Float float
#define JADB_Double double
#define JADB_BOOL BOOL

//可选值类型(Optional Properties)
#define JADB_String NSString
#define JADB_Data NSData
#define JADB_Date NSDate

//存储可空数字属性样式
//存储可空数字目前已经可以通过 NSNumber * 属性完成,由于 Realm 对不同类型的数字采取了不同的存储格式,设置可空的数字属性必须是 RLMInt、RLMFloat、RLMDouble 或者 RLMBool 类型
#define JADB_Optional_Number_BOOL NSNumber<RLMBool>
#define JADB_Optional_Number_Int NSNumber<RLMInt>
#define JADB_Optional_Number_Float NSNumber<RLMFloat>
#define JADB_Optional_Number_Double NSNumber<RLMDouble>

@interface JADataBaseModel : RLMObject


@end
