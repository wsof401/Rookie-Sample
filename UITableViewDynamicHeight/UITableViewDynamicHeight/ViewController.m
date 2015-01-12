//
//  ViewController.m
//  test
//
//  Created by wusong on 14/11/9.
//  Copyright (c) 2014年 wusong. All rights reserved.
//

#import "ViewController.h"
#import "WuTableViewCell.h"
#import "WuTextViewTableViewCell.h"

static NSString *const kMutableLabelCellIdentifer = @"CustomLabelDynamic";
static NSString *const kMutableTextViewCellIdentifer = @"CustomTextViewDynamic";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
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
    
    
    _quoteArray = [@[@"Cannot find executable for CFBundle 0x7fa0b9e2c460 </Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/AccessibilityBundles/CertUIFramework.axbundle> (not loaded)",@"1234\n12312\n11\n",@"1",@"Cannot find executable for CFBundle 0x7fa0b9e2c460 </Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/AccessibilityBundles/CertUIFramework.axbundle> (not loaded)",@"1234\n12312\n11\n",@"1",@"Cannot find executable for CFBundle 0x7fa0b9e2c460 </Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/AccessibilityBundles/CertUIFramework.axbundle> (not loaded)",@"1234\n12312\n11\n",@"1",@"Cannot find executable for CFBundle 0x7fa0b9e2c460 </Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/AccessibilityBundles/CertUIFramework.axbundle> (not loaded)",@"1234\n12312\n11\n",@"1",@"Cannot find executable for CFBundle 0x7fa0b9e2c460 </Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/AccessibilityBundles/CertUIFramework.axbundle> (not loaded)",@"1234\n12312\n11\n",@"1",@"Cannot find executable for CFBundle 0x7fa0b9e2c460 </Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/AccessibilityBundles/CertUIFramework.axbundle> (not loaded)",@"1234\n12312\n11\n",@"1",@"Cannot find executable for CFBundle 0x7fa0b9e2c460 </Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/AccessibilityBundles/CertUIFramework.axbundle> (not loaded)",@"1234\n12312\n11\n",@"1"] mutableCopy];
    
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_quoteArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Label";
            break;
        case 1:
            return @"TextView";
            break;
        default:
            return nil;
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:{
            WuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMutableLabelCellIdentifer];
                cell.layoutMargins = UIEdgeInsetsMake(0, 100, 0, 100);
            [cell configWithDataDetail:_quoteArray[indexPath.row] signFont:_fontArray[indexPath.row]];
            return cell;
        }
            break;
        case 1:
        {
            WuTextViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMutableTextViewCellIdentifer];
            cell.layoutMargins = UIEdgeInsetsMake(0, 100, 0, 100);

            [cell configWithTextData:_quoteArray[indexPath.row]];
            return cell;
        }
            break;
        default:
            return nil;
            break;
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = nil;
    switch (indexPath.section) {
        case 0:
            cell = [self caculatingLabelCellAtIndexPath:indexPath];
            break;
        case 1:
            cell = [self caculatingTVCelAtIndexPath:indexPath];
            break;
        default:
            return 0;
            break;
    }

    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), 0);
    
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    // Get the height for the cell
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    
    CGFloat separatorHeight = 1;
   
    return height + separatorHeight;
}


- (UITableViewCell *)caculatingLabelCellAtIndexPath:(NSIndexPath *)indexPath{
    
    static WuTableViewCell *labelCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        labelCell = [self.tableView dequeueReusableCellWithIdentifier:kMutableLabelCellIdentifer];
    });
    labelCell.layoutMargins = UIEdgeInsetsMake(0, 100, 0, 100);
    [labelCell configWithDataDetail:_quoteArray[indexPath.row] signFont:_fontArray[indexPath.row]];
    return labelCell;
    
}

- (UITableViewCell *)caculatingTVCelAtIndexPath:(NSIndexPath *)indexPath{
    static WuTextViewTableViewCell *textViewcell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        textViewcell = [self.tableView dequeueReusableCellWithIdentifier:kMutableTextViewCellIdentifer];
    });
        textViewcell.layoutMargins = UIEdgeInsetsMake(0, 100, 0, 100);
    [textViewcell configWithTextData:_quoteArray[indexPath.row]];
    
    return textViewcell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"test"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
