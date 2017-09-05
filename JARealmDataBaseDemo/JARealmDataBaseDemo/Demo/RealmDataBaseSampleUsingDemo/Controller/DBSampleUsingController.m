//
//  DBSampleUsingController.m
//  JARealmDataBaseDemo
//
//  Created by Jacob_Liang on 2017/9/4.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import "DBSampleUsingController.h"
#import "DBSampleUsingController+sampleCreatAndAddAction.h"
//lib
#import <Realm/Realm.h>
//model
#import "SampleCar.h"
//view
#import "DBSampleUsingCell.h"

@interface DBSampleUsingController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation DBSampleUsingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpInit];
    [self setUpTableView];
    
    //1. 创建数据库
    [self creatDataBaseWithName:@"SampleUsing_DataBase"];
    
    //2. 建表
    //表格关系请看使用到的模型
    
    //3. 简单的创建存储对象 并 写入到数据库中
//    [self sampleCreateAndAddActions];
}

#pragma mark - setUp
- (void)setUpInit {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setUpTableView {
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DBSampleUsingCell class]) bundle:nil] forCellReuseIdentifier:DBSampleUsingCellID];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DBSampleUsingCell *cell = [tableView dequeueReusableCellWithIdentifier:DBSampleUsingCellID forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return DBSampleUsingCellH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Private
#pragma mark 1. 创建数据库
- (void)creatDataBaseWithName:(NSString *)databaseName {
    //指定存放数据库目录
    NSArray *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [docPath objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:databaseName];
    NSURL *filePathUrl = [[NSURL URLWithString:filePath] URLByAppendingPathExtension:@"realm"];
    NSLog(@"数据库目录 = %@",path);
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.fileURL = filePathUrl;
    int currentVersion = 1.0;
    config.schemaVersion = currentVersion;
    
    config.migrationBlock = ^(RLMMigration *migration , uint64_t oldSchemaVersion) {
        // 这里是设置数据迁移的block
        if (oldSchemaVersion < currentVersion) {
        }
    };
    
    [RLMRealmConfiguration setDefaultConfiguration:config];
    /*
     数据库只有首次被调用
     1 如通过默认方法 [RLMRealm defaultRealm]
     2 访问默认 Realm 数据库的便捷版本方法，例如 [RLMObject allObjects] 【等同于 [RLMObject allObjectsInRealm:[RLMRealm defaultRealm]] 】
     3 执行写入操作等
     才会被创建
     */
    
}

#pragma mark - Add Delete Modify Search Actions

- (IBAction)addOrUpdate:(id)sender {
    //1 通过主键更新
    
}

- (IBAction)delete:(id)sender {
    
}

- (IBAction)modify:(id)sender {
    
}

- (IBAction)search:(id)sender {
    
}


@end
