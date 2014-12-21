//
//  WuTableViewCell.m
//  test
//
//  Created by wusong on 14/11/9.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import "WuTableViewCell.h"

@implementation WuTableViewCell

- (void)configWithDataDetail:(id)detai signFont:(id)font{
    self.detaiLabel.text = detai;
    self.signLabel.text = @"Steve-Jobs";
    self.signLabel.font = [UIFont fontWithName:font size:8.0f];
}

@end
