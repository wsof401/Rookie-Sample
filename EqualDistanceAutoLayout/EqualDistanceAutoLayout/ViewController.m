//
//  ViewController.m
//  EqualDistanceAutoLayout
//
//  Created by wusong on 14/11/12.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *co;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //请灵活使用NSLayoutConstraint中的关于Constraint几个attribute的关系
    //attribute1 == multiplier × attribute2 + constant
    //因此我们只需要让attribute1 是Bottom Layout Guide.Top
    //也就是 Bottom Layout Guide.Top = multiplier * (Label.centerY) + constant(当然Storyboard里面我设置的是0)
    //因此就可以算出来从上方到下方分别的multiplier 为0.25，0.5，0.75
    //当然你有可能会听不懂我在说什么－ －
    //我只能说GG，GL
    //如果你还不懂…………那就是 Good Game，Good Luck
    //PS这个demo只是按照中心等距来进行排列
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

@end
