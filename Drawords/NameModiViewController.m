//
//  NameModiViewController.m
//  Drawords
//
//  Created by hjc on 16/6/4.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "NameModiViewController.h"
#import "Consistant.h"
#import "UIView+Extension.h"

@interface NameModiViewController ()

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
    
    UITextField * newName = [[UITextField alloc]init];
    newName.y = self.view.height/7+60;
    newName.x = 20;
    newName.width = self.view.width-40;
    newName.height = 40;
    newName.backgroundColor = [UIColor grayColor];
    newName.placeholder = @"请输入新昵称";
    [self.view addSubview:newName];
    
    
    UIButton * confirmBtn = [[UIButton alloc]init];
    confirmBtn.frame = CGRectMake(newName.x, CGRectGetMaxY(newName.frame)+20, newName.width, 40);
    confirmBtn.backgroundColor = HJCWORDCOLOR;
    [confirmBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:confirmBtn];
    
}


@end
