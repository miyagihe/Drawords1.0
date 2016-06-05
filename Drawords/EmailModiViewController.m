//
//  EmailModiViewController.m
//  Drawords
//
//  Created by hjc on 16/6/4.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "EmailModiViewController.h"
#import "Consistant.h"
#import "MBProgressHUD+MJ.h"
#import "UIView+Extension.h"

@interface EmailModiViewController ()

@end

@implementation EmailModiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavi];
    [self setUpInterface];
}
-(void)setUpNavi
{
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.view.backgroundColor  = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"账号设置" style:UIBarButtonItemStyleDone target:self action:@selector(backTO)];
    self.navigationController.navigationBar.barTintColor = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem.tintColor = HJCWORDCOLOR;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [self.navigationItem setTitle:@"邮箱修改"];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:HJCWORDCOLOR}];
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(void)backTO
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setUpInterface
{
    UITextField * presentPsd = [[UITextField alloc]init];
    presentPsd.y = self.view.height/7;
    presentPsd.x = 20;
    presentPsd.width = self.view.width-40;
    presentPsd.height = 40;
    presentPsd.backgroundColor = [UIColor grayColor];
    presentPsd.placeholder = @"请输入密码";
    presentPsd.textAlignment = NSTextAlignmentCenter;

    [presentPsd setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:presentPsd];
    
    UITextField * newPsd = [[UITextField alloc]init];
    newPsd.y = self.view.height/7+60;
    newPsd.x = 20;
    newPsd.width = self.view.width-40;
    newPsd.height = 40;
    newPsd.backgroundColor = [UIColor grayColor];
    newPsd.placeholder = @"请输入新邮箱";
    newPsd.textAlignment = NSTextAlignmentCenter;

    [newPsd setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:newPsd];
    
    
    UIButton * confirmBtn = [[UIButton alloc]init];
    confirmBtn.frame = CGRectMake(newPsd.x, CGRectGetMaxY(newPsd.frame)+20, newPsd.width, 40);
    confirmBtn.backgroundColor = HJCWORDCOLOR;
    [confirmBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [confirmBtn addTarget:self action:@selector(confirmSave) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:confirmBtn];
    
}
-(void)confirmSave
{
    [MBProgressHUD showMessage:@"修改中"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        [MBProgressHUD showSuccess:@"修改完成"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
            
        });
    });
}

@end
