//
//  WuTableViewCell.h
//  test
//
//  Created by wusong on 14/11/9.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAutoLayoutLabel.h"
@interface WuTableViewCell : UITableViewCell

@property(weak, nonatomic)IBOutlet CustomAutoLayoutLabel *detaiLabel;
@property(weak, nonatomic)IBOutlet CustomAutoLayoutLabel *signLabel;

- (void)configWithDataDetail:(id)detai signFont:(id)font;

@end
