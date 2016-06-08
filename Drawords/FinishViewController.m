//
//  FinishViewController.m
//  Drawords
//
//  Created by hjc on 16/6/2.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "FinishViewController.h"
#import "Consistant.h"
#import "UIView+Extension.h"

@interface FinishViewController ()
@property (strong, nonatomic) UILabel *FinishLabel;
@property (strong, nonatomic) UIButton *BackToHomeBtn;


@end

@implementation FinishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavi];
    [self setInterface];
}
-(void)setInterface
{
    self.view.backgroundColor =HJCBACKGROUNDCOLOR;
    
    _FinishLabel = [[UILabel alloc]init];
    _FinishLabel.y = 180;
    _FinishLabel.width = 200;
    _FinishLabel.height = 50;
    _FinishLabel.x = self.view.width/2-_FinishLabel.width/2;
    _FinishLabel.text = @"今日计划已完成";
    _FinishLabel.font = [UIFont systemFontOfSize:25];
    _FinishLabel.textAlignment = NSTextAlignmentCenter;
    _FinishLabel.textColor = HJCWORDCOLOR;
    [self.view addSubview:_FinishLabel];
    
    _BackToHomeBtn = [[UIButton alloc]init];
    _BackToHomeBtn.layer.cornerRadius = 5;
    _BackToHomeBtn.y = _FinishLabel.y+_FinishLabel.height+200;
    _BackToHomeBtn.width = 300;
    _BackToHomeBtn.height = 50;
    _BackToHomeBtn.x = self.view.width/2-_BackToHomeBtn.width/2;
    [_BackToHomeBtn setTitle:@"返回首页" forState:normal];
    [_BackToHomeBtn addTarget:self action:@selector(BackToHomeAction) forControlEvents:UIControlEventTouchUpInside];
    [_BackToHomeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    _BackToHomeBtn.backgroundColor = HJCWORDCOLOR;
    [self.view addSubview:_BackToHomeBtn];
}
-(void)setUpNavi
{
    self.view.backgroundColor = HJCBACKGROUNDCOLOR;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:HJCWORDCOLOR}];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = HJCBACKGROUNDCOLOR;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:23.0/255 green:44.0/255 blue:60.0/255 alpha:0.7];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tabbar_home_selected"] style:UIBarButtonItemStylePlain target:self action:@selector(BackToHomeAction:)];
    UIBarButtonItem * leftBarBtn = self.navigationItem.leftBarButtonItem;
    leftBarBtn.tintColor = HJCWORDCOLOR;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)BackToHomeAction{
    
    NSArray *UserAccountPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [UserAccountPath objectAtIndex:0];
    NSString*plistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"UserAccount.plist"];
    NSDictionary*userAccountDict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    
    NSString * day =[userAccountDict valueForKey:@"TotalDays"];
    int intDAY = [day intValue]+1;
    NSString *stringInt = [NSString stringWithFormat:@"%d",intDAY];
    [userAccountDict setValue:stringInt forKey:@"TotalDays"];
    [userAccountDict writeToFile:plistPath atomically:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end
