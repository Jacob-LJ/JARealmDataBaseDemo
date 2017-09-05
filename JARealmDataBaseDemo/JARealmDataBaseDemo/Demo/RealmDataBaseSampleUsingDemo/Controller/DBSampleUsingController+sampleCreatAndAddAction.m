//
//  DBSampleUsingController+sampleCreatAndAddAction.m
//  JARealmDataBaseDemo
//
//  Created by Jacob_Liang on 2017/9/4.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import "DBSampleUsingController+sampleCreatAndAddAction.h"
#import "SampleCar.h"

@implementation DBSampleUsingController (sampleCreatAndAddAction)

- (void)sampleCreateAndAddActions {
    
    [self defaultCreteRLMObject];
    [self createRLMObjectByDict];
    [self createRLMObjectByPropertyValueArray];
}

#pragma mark -
/*
 1 使用指定初始化器(designated initializer)创建对象是最简单的方式。请注意，所有的必需属性都必须在对象添加到 Realm 前被赋值
 */
- (void)defaultCreteRLMObject {
    // (1) 创建一个Car对象，然后设置其属性
    SampleCar *car1 = [[SampleCar alloc] init];
    car1.id = 1000;
    car1.carName = @"Lamborghini";
    
    //普通的写入操作
    [self defaultWriteAction:car1];
}

//普通的写入操作
- (void)defaultWriteAction:(SampleCar *)car {
    // 获取默认的 Realm 实例
    RLMRealm *realm = [RLMRealm defaultRealm];
    // 每个线程只需要使用一次即可
    
    // 通过事务将数据添加到 Realm 中
    [realm beginWriteTransaction];
    [realm addObject:car];
    [realm commitWriteTransaction];
    //请注意，如果在进程中存在多个写入操作的话，那么单个写入操作将会阻塞其余的写入操作，并且还会锁定该操作所在的当前线程。
    //所以 Realm 建议 将写入操作转移到一个独立的线程中执行。
}

/*
 2 通过使用恰当的键值，对象还可以通过字典完成创建
 */
- (void)createRLMObjectByDict {
    // (2) 通过字典创建Car对象
    SampleCar *car2 = [[SampleCar alloc] initWithValue:@{
                                                         @"id" : @1002 ,
                                                         @"name" : @"Rolls-Royce"
                                                         }
                       ];
    //通过一个独立的线程执行写入操作
    [self otherThreadWriteAction:car2];
}

//通过一个独立的线程执行写入操作
- (void)otherThreadWriteAction:(SampleCar *)car {
    /*
     由于 Realm 采用了 MVCC 设计架构，读取操作并不会因为写入事务正在进行而受到影响。除非您需要立即使用多个线程来同时执行写入操作，不然您应当采用批量化的写入事务，而不是采用多次少量的写入事务。
     */
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addObject:car];
        }];
    });
}

/*
 3 最后，RLMObject 子类还可以通过数组完成实例化，数组中的值必须和数据模型中对应属性的次序相同。
 */
- (void)createRLMObjectByPropertyValueArray {
    
    // (3) 通过数组创建狗狗对象
    SampleCar *car3 = [[SampleCar alloc] initWithValue:@[@1003,@"BMW"]];
    [self otherThreadWriteAction:car3];
}


- (void)updateObjectInTransaction:(SampleCar *)car {
    // 获取默认的 Realm 实例
    RLMRealm *realm = [RLMRealm defaultRealm];
    // 每个线程只需要使用一次即可
    
    // 在一个事务中更新对象
    [realm beginWriteTransaction];
    car.carName = @"在一个事务中更新对象";
    [realm commitWriteTransaction];

}

@end
