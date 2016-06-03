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
@property (strong, nonatomic) IBOutlet UILabel *FinishLabel;
@property (strong, nonatomic) IBOutlet UIButton *BackToHomeBtn;
- (IBAction)BackToHomeAction:(UIButton *)sender;

@end

@implementation FinishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =HJCBACKGROUNDCOLOR;
    [self setUpNavi];
    [self setInterface];
}
-(void)setInterface
{
    _FinishLabel.y = self.view.height-300;
    _FinishLabel.width = 200;
    _FinishLabel.height = 50;
    
//    _BackToHomeBtn = [[UIButton alloc]init];
    _BackToHomeBtn.layer.cornerRadius = 5;
    _BackToHomeBtn.y = _FinishLabel.y+_FinishLabel.height+100;
    _BackToHomeBtn.width = 300;
    _BackToHomeBtn.height = 50;
    
    
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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tabbar_home_selected"] style:UIBarButtonItemStylePlain target:self action:@selector(moveToTodayPlan)];
    UIBarButtonItem * leftBarBtn = self.navigationItem.leftBarButtonItem;
    leftBarBtn.tintColor = HJCWORDCOLOR;
}
-(void)moveToTodayPlan
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)BackToHomeAction:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end
