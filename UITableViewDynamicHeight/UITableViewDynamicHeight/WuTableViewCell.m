//
//  WuTableViewCell.m
//  test
//
//  Created by wusong on 14/11/9.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import "WuTableViewCell.h"

@implementation WuTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];

    self.detaiLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.detaiLabel.frame);

}

@end
