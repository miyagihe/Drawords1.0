//
//  AccountSettingViewController.m
//  Drawords
//
//  Created by hjc on 16/6/1.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "AccountSettingViewController.h"
#import "Consistant.h"

@interface AccountSettingViewController ()

@end

@implementation AccountSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavi];
    self.view.backgroundColor = HJCBACKGROUNDCOLOR;

}
-(void)setUpNavi
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.view.backgroundColor  = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(BckToSettings)];
    self.navigationController.navigationBar.barTintColor = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem.tintColor = HJCWORDCOLOR;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    [self.navigationItem setTitle:@"账号设置"];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:HJCWORDCOLOR}];

}

-(void)BckToSettings
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
