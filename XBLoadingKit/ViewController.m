//
//  ViewController.m
//  XBLoadingKit
//
//  Created by jianwen ning on 16/04/2019.
//  Copyright © 2019 jianwen ning. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+XBLoading.h"
#import "LoadingStyleManager.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kIsiPhoneX ((NSInteger)((kScreenHeight/kScreenWidth)*100) == 216)?YES:NO //判断是否是iphonex序列机型
#define kNavigationBarHeight (kIsiPhoneX? 88 : 64)
static NSString *const kCellIdentifier = @"UITableViewCell";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableview;
@property(nonatomic, strong) NSArray *dataArr;

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [[LoadingStyleManager sharedInstance] setHudStyle:dim_background_style]; //此处打开就是一个黑色背景的提示
    [[LoadingStyleManager sharedInstance] setHudShowTime:1.5]; //设置提示显示的时长
    [self.view addSubview:self.tableview];
    [self.tableview reloadData];
}

#pragma mark - tableview delegate & datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    if(indexPath.row < self.dataArr.count){
        
        cell.textLabel.text = self.dataArr[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self showOperationHudWithStatus:operation_success_status];
            break;
        case 1:
            [self showOperationHudWithStatus:operation_fail_status];
            break;
            
        case 2:
            [self showOperationHudWithStatus:operation_warning_status];
            break;
        case 3:
            [self networkLoading];
            break;
        case 4:
            [self showLongMessage];
            break;
        default:
            break;
    }
}

#pragma mark - private method

- (void)showOperationHudWithStatus:(TipStatus)tipStatus{
    
    switch (tipStatus) {
        case operation_success_status:
            [MBProgressHUD showSuccess:@"操作成功的提示" toView:self.view]; //成功的提示
            break;
        case operation_fail_status:
            [MBProgressHUD showError:@"操作失败的提示" toView:self.view]; //失败提示
            break;
        case operation_warning_status:
            [MBProgressHUD showWarning:@"操作遇到了警告" toView:self.view]; //警告提示
            break;
            
        default:
            break;
    }
}

//网络加载时的loading
- (void)networkLoading{
    
    [MBProgressHUD showMessage:@"loading..." toView:self.view];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

//显示长文本提示
- (void)showLongMessage{
    
    [MBProgressHUD showDetailMessage:@"寂寞空庭春欲晚，梨花满地不开门，昨夜雨疏风骤" toView:self.view delay:2.0];
}

#pragma mark - getter & setter

- (UITableView *)tableview{
    
    if(!_tableview){
        
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.tableFooterView = [UIView new];
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
        _tableview.rowHeight = 50.0;
    }
    return _tableview;
}

- (NSArray *)dataArr{
    
    if(!_dataArr){
        
        _dataArr = @[@"默认时长的成功提示", @"默认时长的出错提示", @"默认时长警告提示", @"网络请求的loading提示", @"显示长文本"];
    }
    return _dataArr;
}

@end
