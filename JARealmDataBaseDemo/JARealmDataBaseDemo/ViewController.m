//
//  ViewController.m
//  JARealmDataBaseDemo
//
//  Created by Jacob_Liang on 2017/9/3.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import "ViewController.h"
//vc
#import "DBSampleUsingController.h"
//view
#import "JAActionDescCell.h"


static const CGFloat kDefaultCellHeight = 50;

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JAActionDescCell *cell = [tableView dequeueReusableCellWithIdentifier:JAActionDescCellID];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    NSInteger row = indexPath.row;
    if (row == 0) {
        cell.textLabel.text = @"1 RealmDataBaseSampleUsing(数据库简单创建与使用)";
    } else if (row == 1) {
        cell.textLabel.text = @"2";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kDefaultCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = indexPath.row;
    if ( row == 0) {
        DBSampleUsingController *createDBVc = [[DBSampleUsingController alloc] init];
        [self.navigationController pushViewController:createDBVc animated:YES];
    } else if (row == 1) {
        
    }
}



@end
