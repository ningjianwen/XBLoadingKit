# XBLoadingKit 
## 一、原起
我为什么要对**MBProgressHUD**进行二次封装？今年新找的这份工作，项目的创建的时间比较早了，2014年创建的项目，项目中现在使用的一些操作提示，既然还是我刚开始从事iOS开发工作的时候就用到的**开源的第三方toast**。可以说这个开源库的年龄比我的工作年龄都长了，现在早都过时了，而且它的样式不好看，跟**MBProgressHUD**差远了。所以决定对**MBProgressHUD**进行二次封装，产出demo，决心说服产品进行替换。

## 二、XBLoadingKit的使用

XBLoadingKit主要封装了常用的几种提示，包括**成功**、**失败**、**警告**、**loading**、**长文本消息**。

### 1、使用方法


```objective-c

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
```
### 2、样式
**XBLoadingKit**提供了两种样式。

- 灰白色背景（icon和提示文字是灰色）
- 黑色背景（icon和提示文字是白色）

```objective-c
/**
 hud的样式

 - gray_background_style: 灰色背景
 - dim_background_style: 黑色背景
 */
typedef NS_ENUM(NSInteger, CustomHudStyle) {
    
    gray_background_style = 0,
    dim_background_style,
};
```

如果不进行设置，默认使用的是灰色背景。
可以通过`LoadingStyleManager`这个类提供的方法进行样式的修改，提示hud的显示时长的修改。

修改样式的代码示例：

```objective-c
[[LoadingStyleManager sharedInstance] setHudStyle:dim_background_style];
```

提示显示的时长**默认是2s**，可以自己根据需要进行修改。
修改提示显示的时长：

```objective-c
[[LoadingStyleManager sharedInstance] setHudDelayTime:1.5]; //设置提示显示的时长
```
效果展示：
![效果图](https://upload-images.jianshu.io/upload_images/767049-64dc941b85f0ce63.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## 三、特别说明


1. 提示所使用的三个图标都放在了**resource**目录下，是从之前的项目中找出来的，只有**@2x**图标，有需要使用的同学，请找设计师生成对应的**@3x**图标。

2. **如果需要使用其他样式的提示，请根据MBProgressHUD的demo自己进行封装**。

3. 欢迎下载使用，提出意见，如果觉得好，希望可以**star**一下。


