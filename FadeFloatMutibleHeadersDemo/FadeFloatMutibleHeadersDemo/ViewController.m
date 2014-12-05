//
//  ViewController.m
//  FadeFloatMutibleHeadersDemo
//
//  Created by wusong on 14/12/4.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) UIView *coverView;
@property(nonatomic) BOOL firstDisplayFSectionHeader;
@property(nonatomic) BOOL firstDisplaySSectionHeader;
@property(nonatomic) CGFloat criticalY;
@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _firstDisplayFSectionHeader = YES;
        _firstDisplaySSectionHeader = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableView.layer.shouldRasterize = YES;
    // self.tableView.layer.cornerRadius = 10.0f;
    //self.tableView.clipsToBounds = YES;
  
    
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:NULL];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.maskView.bounds
                                               byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                                     cornerRadii:CGSizeMake(15, 15)];
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.frame = self.maskView.bounds;
    mask.path = path.CGPath;
    self.maskView.layer.mask = mask;
    

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if (![keyPath isEqualToString:@"contentOffset"]) {
        return;
    }
    CGPoint contentOffset = [change[@"new"] CGPointValue];
    _coverView.hidden = (contentOffset.y >= _criticalY) && !_firstDisplaySSectionHeader ? NO : YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 4;
            break;
        case 1:
            return 2;
            break;
        default:
            return 40;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0 : 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0 : 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    switch (section) {
        case 1:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"header"];
            cell.textLabel.text = @(section).stringValue;
            return cell;
        }
            break;
        case 2:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"header"];
            cell.textLabel.text = @(section).stringValue;
            return cell;
        }
            break;
        default:
            return nil;
            break;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    switch (section) {
        case 1:{
            if (!_firstDisplayFSectionHeader) {
                return;
            }
            _coverView = [[UIView alloc] initWithFrame:view.bounds];
            _coverView.backgroundColor = [UIColor blueColor];
            _coverView.hidden = YES;
            CGRect frame = _coverView.frame;
            frame.origin.y = self.tableView.frame.origin.y;
            _coverView.frame = frame;
            UITableViewCell *workingCover = [tableView dequeueReusableCellWithIdentifier:@"header"];
            workingCover.textLabel.text = @(section).stringValue;
            workingCover.frame = _coverView.bounds;
            [_coverView addSubview:workingCover];
            
            _firstDisplayFSectionHeader = NO;
            _criticalY = CGRectGetHeight(workingCover.frame);
        }
            break;
        case 2:
        {
            if (!_firstDisplaySSectionHeader) {
                return;
            }
            CGRect coverFrame = _coverView.frame;
            
            CGFloat postionEdge = CGRectGetHeight(coverFrame);
            
            coverFrame.size.height += CGRectGetHeight(view.frame);
            _coverView.frame = coverFrame;
            
            UITableViewCell *workingCover = [tableView dequeueReusableCellWithIdentifier:@"header"];
            workingCover.textLabel.text = @(section).stringValue;
            
            workingCover.frame = CGRectMake(0, postionEdge, view.frame.size.width, view.frame.size.height);
            
            [_coverView addSubview:workingCover];
            
            _criticalY = CGRectGetMinY(view.frame) - _criticalY;
            
            _firstDisplaySSectionHeader = NO;
            
            [self.maskView addSubview:_coverView];
    }
            break;
        default:
            
            break;
    }
}

@end
