//
//  RootViewController.m
//  IT05Push
//
//  Created by student on 16/5/25.
//  Copyright © 2016年 李文良. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    //创建一个可交互的本地通知
    //TODO: 私人订制 交互本地通知
    
    //创建一个容器，用来存放通知栏需要添加的按钮
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:0];
    
    //    UIMutableUserNotificationAction 通知栏添加按钮的类
    UIMutableUserNotificationAction *action = [[UIMutableUserNotificationAction alloc]init];
    //唯一标识符
    action.identifier = @"sleep";
    //按钮的名称
    action.title = @"小睡";
    action.activationMode = UIUserNotificationActivationModeForeground;
    [actions addObject:action];
    
    //再添加一个按钮
    action = [[UIMutableUserNotificationAction alloc]init];
    action.identifier = @"up";
    action.title = @"起床";
    action.activationMode = UIUserNotificationActivationModeBackground;
    //锁屏的时候处理，如果是UIUserNotificationActivationModeBackground才会响应
    action.authenticationRequired = YES;
    action.destructive = YES;
    
    [actions addObject:action];
    //格式 通知栏中的样式 有几个
    UIMutableUserNotificationCategory * category = [[UIMutableUserNotificationCategory alloc]init];
    category.identifier = @"iClock";
    [category setActions:actions forContext:UIUserNotificationActionContextDefault];
    
    //设置
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeSound categories:[NSSet setWithObjects:category, nil]];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    
    
    //指定什么样的通知用这样样式
    
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    notification.alertBody = @"该起床了！！🐷";
    //该通知用什么样式的通知，让该通知有唯一标识符
    notification.category = @"iClock";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    UILocalNotification *notification1 = [[UILocalNotification alloc]init];
    notification1.fireDate = [NSDate dateWithTimeIntervalSinceNow:15];
    notification1.alertBody = @"该起床了！！🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷🐷";
    notification1.category = @"iClock";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification1];
    
    NSLog(@"我更新了");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
