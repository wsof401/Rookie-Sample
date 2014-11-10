//
//  ViewController.m
//  test
//
//  Created by wusong on 14/11/9.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import "ViewController.h"
#import "WuTableViewCell.h"
@interface ViewController (){
       NSMutableArray *_quoteArray;
        NSMutableArray *_fontArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) WuTableViewCell *customCell;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _fontArray = [[UIFont familyNames] mutableCopy];
    for(int i = 0; i < 100; i++) {
        [_fontArray addObjectsFromArray:[UIFont familyNames]];
    }
    
    _quoteArray = [@[@"For the past 33 years, I have looked in the mirror every morning and asked myself: 'If today were the last day of my life, would I want to do what I am about to do today?' And whenever the answer has been 'No' for too many days in a row, I know I need to change something. -Steve Jobs",
                     
                     @"Be a yardstick of quality. Some people aren't used to an environment where excellence is expected. - Steve Jobsadfads",
                     @"SteveJobsSteveJobsSteveJobsSteveJobsSteve JobsSteve JobsSteve JobsSteve JobsSteve JobsSteve JobsSteveJobsSteveJobsSteveJobsSteveJobsSteve JobsSteve JobsSteve JobsSteve JobsSteve JobsSteve JobsSteveJobsSteveJobsSteveJobsSteveJobsSteve JobsSteve JobsSteve JobsSteve JobsSteve JobsSteve JobsSteveJobsSteveJobsSteveobsSteveJobsSteve JobsSteve JobsSteve JobsSteve JobsSteve JobsSteve JobsSteveJobsSteveJobsSteveJobsSteveJobsSteve JobsSteve JobsSteve JobsSteve JobsSteve JobsSteve JobsSteveobsSteveJobsSteveJobsSteveJobsSteve JobsSteve JobsSteve JobsSteve JobsSteve JobsSteve JobsSteveobsSteveJobsSteveJobsSteveJobsSteve JobsSteve JobsSteve JobsSteve JobsSteveJobsdone",
                     @"Innovation distinguishes between a leader and a follower. -Steve Jobs"] mutableCopy];

    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_quoteArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WuTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    cell.detaiLabel.text = _quoteArray[indexPath.row];
    
   
    cell.signLabel.text = @"Steve-Jobs";
    NSString *fontName = _fontArray[indexPath.row];
        cell.signLabel.font = [UIFont fontWithName:fontName size:17];
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Calculate a height based on a cell
    if(!self.customCell) {
        self.customCell = [self.tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    }
    static WuTableViewCell *cel1 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cel1 = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    });

    
    cel1.detaiLabel.text = _quoteArray[indexPath.row];
    
    cel1.signLabel.text = @"Steve-Jobs";
    NSString *fontName = _fontArray[indexPath.row];
    cel1.signLabel.font = [UIFont fontWithName:fontName size:17];
    
    [cel1 setNeedsUpdateConstraints];
    [cel1 updateConstraintsIfNeeded];
    
    cel1.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cel1.bounds));
    
    // Layout the cell
    [cel1 setNeedsLayout];
    [cel1 layoutIfNeeded];
    
    // Get the height for the cell
  
    CGFloat height = [cel1.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
 
    CGFloat separatorHeight = 1;
    
    return height + separatorHeight;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 140;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
