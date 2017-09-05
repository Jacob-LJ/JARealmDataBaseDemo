//
//  DBSampleUsingCell.m
//  JARealmDataBaseDemo
//
//  Created by Jacob_Liang on 2017/9/4.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import "DBSampleUsingCell.h"

@interface DBSampleUsingCell ()

@property (weak, nonatomic) IBOutlet UILabel *carIdLB;
@property (weak, nonatomic) IBOutlet UILabel *carNameLB;
@property (weak, nonatomic) IBOutlet UIView *tagView;

@end

@implementation DBSampleUsingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUpInit];
}

- (void)setUpInit {
    self.tagView.layer.cornerRadius = 10;
    self.tagView.layer.masksToBounds = YES;
    self.tagView.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1];
}

- (void)setCar:(SampleCar *)car {
    _car = car;
    self.carIdLB.text = [NSString stringWithFormat:@"%ld",car.id];
    self.carNameLB.text = car.carName;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
