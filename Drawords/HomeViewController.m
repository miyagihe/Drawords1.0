//
//  HomeViewController.m
//  Drawords
//
//  Created by hjc on 16/6/1.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "HomeViewController.h"
#import "GeneralSettingsViewController.h"
#import "Consistant.h"
#import "RESideMenu.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavi];
    
}
-(void)setUpNavi
{
    self.view.backgroundColor = HJCBACKGROUNDCOLOR;
    [self.navigationItem setTitle:@"今日计划"];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:HJCWORDCOLOR}];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.barTintColor = HJCBACKGROUNDCOLOR;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:23.0/255 green:44.0/255 blue:60.0/255 alpha:0.7];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(moveToSettings)];
    UIBarButtonItem * leftBarBtn = self.navigationItem.leftBarButtonItem;
    leftBarBtn.tintColor = HJCWORDCOLOR;

}
-(void)moveToSettings
{
    [self.sideMenuViewController presentLeftMenuViewController];
}

@end
