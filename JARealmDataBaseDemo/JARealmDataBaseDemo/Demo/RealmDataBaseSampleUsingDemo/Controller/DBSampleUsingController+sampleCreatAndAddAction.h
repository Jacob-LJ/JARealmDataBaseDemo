//
//  DBSampleUsingController+sampleCreatAndAddAction.h
//  JARealmDataBaseDemo
//
//  Created by Jacob_Liang on 2017/9/4.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import "DBSampleUsingController.h"

@class SampleCar;

@interface DBSampleUsingController (sampleCreatAndAddAction)

/**< 简单在事务中添加数据 */
- (void)sampleCreateAndAddActions;

/**< 在一个事务中更新对象 */
- (void)updateObjectInTransaction:(SampleCar *)car;

@end
