//
//  ViewController.h
//  ScrollEdgeGradientEffectDemo
//
//  Created by wusong on 14/11/22.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(weak, nonatomic) IBOutlet UITableView *tableView;
@end

