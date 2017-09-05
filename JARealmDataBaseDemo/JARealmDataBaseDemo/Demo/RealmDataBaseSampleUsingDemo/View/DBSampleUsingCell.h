//
//  DBSampleUsingCell.h
//  JARealmDataBaseDemo
//
//  Created by Jacob_Liang on 2017/9/4.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SampleCar.h"

static NSString * const DBSampleUsingCellID = @"DBSampleUsingCell";
static const CGFloat DBSampleUsingCellH = 50;

@interface DBSampleUsingCell : UITableViewCell

@property (nonatomic, strong) SampleCar *car;

@end
