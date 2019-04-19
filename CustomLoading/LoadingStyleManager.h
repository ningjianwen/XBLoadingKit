//
//  LoadingStyleManager.h
//  XBLoadingKit
//
//  Created by jianwen ning on 16/04/2019.
//  Copyright © 2019 jianwen ning. All rights reserved.
//  一个配置loading样式的单例

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 hud的样式

 - gray_background_style: 灰色背景
 - dim_background_style: 黑色背景
 */
typedef NS_ENUM(NSInteger, CustomHudStyle) {
    
    gray_background_style = 0,
    dim_background_style,
};

@interface LoadingStyleManager : NSObject

@property(nonatomic, assign) CustomHudStyle hudStyle;
@property(nonatomic, assign) NSTimeInterval hudShowTime;

+(instancetype)sharedInstance;


@end

NS_ASSUME_NONNULL_END
