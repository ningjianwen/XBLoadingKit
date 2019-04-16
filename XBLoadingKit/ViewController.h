//
//  ViewController.h
//  XBLoadingKit
//
//  Created by jianwen ning on 16/04/2019.
//  Copyright © 2019 jianwen ning. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 提示的状态
 
 - operation_success_status: 操作成功
 - operation_fail_status: 操作失败
 - operation_warning_status: 操作警告
 */
typedef NS_ENUM(NSInteger, TipStatus) {
    
    operation_success_status,
    operation_fail_status,
    operation_warning_status
};

@interface ViewController : UIViewController


@end

