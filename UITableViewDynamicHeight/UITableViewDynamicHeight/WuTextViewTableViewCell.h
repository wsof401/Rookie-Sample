//
//  WuTextViewTableViewCell.h
//  UITableViewDynamicHeight
//
//  Created by wusong on 14/11/11.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAutoLayoutTextView.h"
@interface WuTextViewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet CustomAutoLayoutTextView *textView;

- (void)configWithTextData:(id)data;

@end
