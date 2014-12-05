//
//  WuTextViewTableViewCell.m
//  UITableViewDynamicHeight
//
//  Created by wusong on 14/11/11.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import "WuTextViewTableViewCell.h"

@interface WuTextViewTableViewCell ()

@property(nonatomic, strong)UIWebView *web;

@end

@implementation WuTextViewTableViewCell


- (void)configWithTextData:(id)data{
    self.textView.text = data;
    if (_web) {
        [_web stopLoading];
        [_web removeFromSuperview];
        _web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    }
}

@end
