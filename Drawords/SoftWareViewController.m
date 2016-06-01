//
//  SoftWareViewController.m
//  Drawords
//
//  Created by hjc on 16/6/1.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "SoftWareViewController.h"
#import "Consistant.h"

@interface SoftWareViewController ()

@end

@implementation SoftWareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavi];
    
    self.view.backgroundColor = HJCBACKGROUNDCOLOR;
   
}
-(void)setUpNavi
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.view.backgroundColor  = HJCMENUCOLOR;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(BckToSettings)];
    self.navigationController.navigationBar.barTintColor = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem.tintColor = HJCWORDCOLOR;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [self.navigationItem setTitle:@"软件设置"];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:HJCWORDCOLOR}];


}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(void)BckToSettings
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
