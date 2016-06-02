//
//  StudyModeViewController.m
//  Drawords
//
//  Created by hjc on 16/6/2.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "StudyModeViewController.h"
#import "Consistant.h"
#import "UIView+Extension.h"

@interface StudyModeViewController ()

@end

@implementation StudyModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HJCBACKGROUNDCOLOR;
    [self setUpNavi];
    [self setUpInterFace];
}
-(void)setUpInterFace
{
    UIView * progressView = [[UIView alloc]init];
    progressView.frame = CGRectMake(10, 10, self.view.width-20, 5);
    progressView.backgroundColor = HJCMENUCOLOR;
    [self.view addSubview:progressView];
    
    UIButton * wordDisplay = [[UIButton alloc]init];
    wordDisplay.frame = CGRectMake(progressView.x, progressView.y+15, progressView.width, 40);
    wordDisplay.backgroundColor = HJCMENUCOLOR;
    [self.view addSubview:wordDisplay];
   
    
    UIButton * tooEasyBtn = [[UIButton alloc]init];
    tooEasyBtn.frame = CGRectMake(progressView.x, self.view.height-250, progressView.width, 40);
    tooEasyBtn.backgroundColor = [UIColor colorWithRed:153.0/255 green:77.0/255 blue:82.0/255 alpha:1];
    [tooEasyBtn setTitle:@"很熟悉，不再学习" forState:UIControlStateNormal];
    [self.view addSubview:tooEasyBtn];
    
    UIButton * rememberBtn = [[UIButton alloc]init];
    rememberBtn.frame = CGRectMake(progressView.x, CGRectGetMaxY(tooEasyBtn.frame)+5, progressView.width, 40);
    rememberBtn.backgroundColor = HJCWORDCOLOR;
    [rememberBtn setTitle:@"记得" forState:UIControlStateNormal];
    [self.view addSubview:rememberBtn];
    
    UIButton * forgetBtn = [[UIButton alloc]init];
    forgetBtn.frame = CGRectMake(progressView.x, CGRectGetMaxY(rememberBtn.frame)+5, progressView.width, 40);
    forgetBtn.backgroundColor = [UIColor colorWithRed:230.0/255 green:180.0/255 blue:80.0/255 alpha:1];
    
    [forgetBtn setTitle:@"忘记了" forState:UIControlStateNormal];
    [self.view addSubview:forgetBtn];
    
    
}
-(void)setUpNavi
{
    self.view.backgroundColor = HJCBACKGROUNDCOLOR;
    [self.navigationItem setTitle:@"测试模式"];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:HJCWORDCOLOR}];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.barTintColor = HJCBACKGROUNDCOLOR;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:23.0/255 green:44.0/255 blue:60.0/255 alpha:0.7];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tabbar_home_selected"] style:UIBarButtonItemStylePlain target:self action:@selector(moveToTodayPlan)];
    UIBarButtonItem * leftBarBtn = self.navigationItem.leftBarButtonItem;
    leftBarBtn.tintColor = HJCWORDCOLOR;
    
    
}
-(void)moveToTodayPlan
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end
