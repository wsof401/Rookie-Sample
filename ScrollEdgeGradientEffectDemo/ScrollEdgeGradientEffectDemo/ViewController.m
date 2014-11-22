//
//  ViewController.m
//  ScrollEdgeGradientEffectDemo
//
//  Created by wusong on 14/11/22.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import "ViewController.h"
@import QuartzCore;
@interface ViewController ()

@property(nonatomic, strong) CAGradientLayer *gradientMastlayer;

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _gradientMastlayer = nil;
    }
    return self;
}

- (void)viewDidLayoutSubviews{
    if (_gradientMastlayer) {
        [_gradientMastlayer removeFromSuperlayer];
        _gradientMastlayer = nil;
    }
    //If you do that on a scrollView or tableview even a collectionView, U shoul do this in their layoutSubView method,when the scroll begin , the mask would be remove. Surely the smart way to implementation the gradientEffect is to add a clear View on the it.make sure the clear cover's userInteractionEnabled = YES;

    self.gradientMastlayer = [CAGradientLayer layer];
    self.gradientMastlayer.frame = self.view.bounds;
    self.gradientMastlayer.colors = @[(id)[[UIColor clearColor] CGColor],(id)[[UIColor blackColor] CGColor]];
    self.gradientMastlayer.startPoint = CGPointMake(0.0f, .8f);
    
    self.gradientMastlayer.endPoint = CGPointMake(.0f, 1.0f);
    [self.view.layer addSublayer:self.gradientMastlayer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
     // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
