//
//  CustomAutoLayoutTextView.m
//  UITableViewDynamicHeight
//
//  Created by wusong on 14/11/11.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import "CustomAutoLayoutTextView.h"

@implementation CustomAutoLayoutTextView

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
    _expectedDisplayWidth = CGFLOAT_MAX;
    _displayBoundsFitContents = YES;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.displayBoundsFitContents) {
        if (CGSizeEqualToSize(self.bounds.size, [self intrinsicContentSize])) return;
    }
    
    [self invalidateIntrinsicContentSize];
    
}

- (CGSize)intrinsicContentSize{
    CGSize expectSize = [super intrinsicContentSize];
    if (self.displayBoundsFitContents ) {
        expectSize = self.contentSize;
        if (self.expectedDisplayWidth != CGFLOAT_MAX ) {
            expectSize = [self sizeThatFits:CGSizeMake(self.expectedDisplayWidth, CGFLOAT_MAX)];
        }
    }
    return expectSize;
}

@end
