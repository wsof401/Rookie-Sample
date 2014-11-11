//
//  CustomAutoLayoutTextView.h
//  UITableViewDynamicHeight
//
//  Created by wusong on 14/11/11.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAutoLayoutTextView : UITextView

@property (nonatomic)  IBInspectable BOOL displayBoundsFitContents;
@property (nonatomic)  IBInspectable CGFloat expectedDisplayWidth;

@end
