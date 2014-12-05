//
//  ViewController.h
//  FadeFloatMutibleHeadersDemo
//
//  Created by wusong on 14/12/4.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(weak, nonatomic) IBOutlet UITableView *tableView;

@property(weak, nonatomic) IBOutlet UIView *maskView;

@end

