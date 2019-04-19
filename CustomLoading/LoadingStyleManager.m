//
//  LoadingStyleManager.m
//  XBLoadingKit
//
//  Created by jianwen ning on 16/04/2019.
//  Copyright © 2019 jianwen ning. All rights reserved.
//

#import "LoadingStyleManager.h"

static LoadingStyleManager *managerInstance = nil;

@implementation LoadingStyleManager

+(instancetype)sharedInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        managerInstance = [[self alloc] init];
        [managerInstance defaultStyle];
    });
    return managerInstance;
}

//hud的默认样式
- (void)defaultStyle{
    
    self.hudStyle = gray_background_style;
    self.hudShowTime = 2.0;
}

@end
