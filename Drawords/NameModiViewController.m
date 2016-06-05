//
//  NameModiViewController.m
//  Drawords
//
//  Created by hjc on 16/6/4.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "NameModiViewController.h"
#import "Consistant.h"
#import "MBProgressHUD+MJ.h"
#import "UIView+Extension.h"

@interface NameModiViewController ()
@property(nonatomic,strong)UITextField *modifiedName;

@end

@implementation NameModiViewController

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
    [self.navigationItem setTitle:@"昵称修改"];
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
    UILabel * presentName = [[UILabel alloc]init];
    presentName.y = self.view.height/7;
    presentName.x = 20;
    presentName.width = self.view.width-40;
    presentName.height = 40;
    presentName.textAlignment = NSTextAlignmentCenter;
    presentName.textColor = HJCWORDCOLOR;
    presentName.text = @"当前昵称:MIYAGIHE";
    [self.view addSubview:presentName];
    
    self.modifiedName = [[UITextField alloc]init];
    self.modifiedName.y = self.view.height/7+60;
    self.modifiedName.x = 20;
    self.modifiedName.width = self.view.width-40;
    self.modifiedName.height = 40;
    self.modifiedName.backgroundColor = [UIColor grayColor];
    self.modifiedName.placeholder = @"请输入新昵称";
    self.modifiedName.textAlignment = NSTextAlignmentCenter;
    [self.modifiedName setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:self.modifiedName];
    
    
    UIButton * confirmBtn = [[UIButton alloc]init];
    confirmBtn.frame = CGRectMake(self.modifiedName.x, CGRectGetMaxY(self.modifiedName.frame)+20, self.modifiedName.width, 40);
    confirmBtn.backgroundColor = HJCWORDCOLOR;
    [confirmBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [confirmBtn addTarget:self action:@selector(confirmSave) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:confirmBtn];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_modifiedName resignFirstResponder];
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
    });}

@end
