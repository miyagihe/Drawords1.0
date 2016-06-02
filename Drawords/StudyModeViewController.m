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
#import "WordDisplayButton.h"

@interface StudyModeViewController ()
@property(nonatomic,strong)UIButton * tooEasyBtn;
@property(nonatomic,strong)UIButton * forgetBtn;
@property(nonatomic,strong)UIButton * rememberBtn;


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
    
    WordDisplayButton * wordDisplay = [[WordDisplayButton alloc]init];
    wordDisplay.frame = CGRectMake(progressView.x, progressView.y+15, progressView.width, 40);
    wordDisplay.backgroundColor = HJCMENUCOLOR;
    wordDisplay.soundView.image = [UIImage imageNamed:@"d_haha"];
    wordDisplay.phonogramLabel.text = @"hkjhkjh";
    wordDisplay.wordLabel.text = @"hehehe";
    [self.view addSubview:wordDisplay];
   
    
    _tooEasyBtn = [[UIButton alloc]init];
    _tooEasyBtn.frame = CGRectMake(progressView.x, self.view.height-250, progressView.width, 40);
    _tooEasyBtn.backgroundColor = [UIColor colorWithRed:153.0/255 green:77.0/255 blue:82.0/255 alpha:1];
    [_tooEasyBtn setTitle:@"很熟悉，不再学习" forState:UIControlStateNormal];
    [self.view addSubview:_tooEasyBtn];
    
    _rememberBtn = [[UIButton alloc]init];
    _rememberBtn.frame = CGRectMake(progressView.x, CGRectGetMaxY(_tooEasyBtn.frame)+5, progressView.width, 40);
    _rememberBtn.backgroundColor = HJCWORDCOLOR;
    [_rememberBtn setTitle:@"记得" forState:UIControlStateNormal];
    [self.view addSubview:_rememberBtn];
    
    _forgetBtn = [[UIButton alloc]init];
    _forgetBtn.frame = CGRectMake(progressView.x, CGRectGetMaxY(_rememberBtn.frame)+5, progressView.width,
                                 40);
    _forgetBtn.backgroundColor = [UIColor colorWithRed:230.0/255 green:180.0/255 blue:80.0/255 alpha:1];
    [_forgetBtn setTitle:@"忘记了" forState:UIControlStateNormal];
    
    [_forgetBtn addTarget:self action:@selector(showReminder) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_forgetBtn];
}
-(void)showReminder
{
    self.navigationItem.title = @"提醒模式";
    _tooEasyBtn.frame = _rememberBtn.frame;
    _forgetBtn.frame = _rememberBtn.frame;
    [_rememberBtn setTitle:@"下一个" forState:UIControlStateNormal];
    _tooEasyBtn.hidden = YES;
    _forgetBtn.hidden = YES;
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
