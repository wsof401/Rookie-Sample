//
//  CustomAutoLayoutLabel.m
//  UITableViewDynamicHeight
//
//  Created by wusong on 14/11/11.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import "CustomAutoLayoutLabel.h"

@implementation CustomAutoLayoutLabel

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initializationConfig];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializationConfig];
    }
    return self;
}


- (void)initializationConfig{
    self.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.preferredMaxLayoutWidth == CGRectGetWidth(self.frame)) return;
    self.preferredMaxLayoutWidth = CGRectGetWidth(self.frame);
}

@end
