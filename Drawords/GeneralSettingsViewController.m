//
//  GeneralSettingsViewController.m
//  Drawords
//
//  Created by hjc on 16/6/1.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "GeneralSettingsViewController.h"
#import "Consistant.h"
#import "HomeViewController.h"
#import "SoftWareViewController.h"
#import "AccountSettingViewController.h"
#import "SuggestionViewController.h"
#import "AboutViewController.h"
#import "StudyPlanViewController.h"



@interface GeneralSettingsViewController ()
@property(nonatomic,strong)HomeViewController * homePage;

@end

@implementation GeneralSettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = HJCBACKGROUNDCOLOR;
    
    [self.navigationItem setTitle:@"设置"];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:HJCWORDCOLOR}];


    UIButton * PLbtn = [[UIButton alloc]init];
    [self initbutton:PLbtn withtitle:@"学习规划" cordinationY:140];

    [PLbtn setImage:[UIImage imageNamed:@"tabbar_home_selected"] forState:UIControlStateNormal];
    
       PLbtn.imageEdgeInsets = UIEdgeInsetsMake(0, 25, 0, 0);
    PLbtn.titleEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    [PLbtn addTarget:self action:@selector(planClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * SWBtn = [[UIButton alloc]init];
    [SWBtn setImage:[UIImage imageNamed:@"compose_trendbutton_background_highlighted"] forState:UIControlStateNormal];
    SWBtn.imageEdgeInsets =UIEdgeInsetsMake(0, 28, 0, 0);
    SWBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 36, 0, 0);
    [self initbutton:SWBtn withtitle:@"软件设置" cordinationY:260];
    
    [SWBtn addTarget:self action:@selector(firstClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton * ACBtn = [[UIButton alloc]init];
    [ACBtn setImage:[UIImage imageNamed:@"tabbar_profile_selected"] forState:UIControlStateNormal];
    ACBtn.imageEdgeInsets =UIEdgeInsetsMake(0, 25, 0, 0);
    ACBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    [self initbutton:ACBtn withtitle:@"账号设置" cordinationY:200];

    [ACBtn addTarget:self action:@selector(AccountSetting) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * SGBtn = [[UIButton alloc]init];
    [SGBtn setImage:[UIImage imageNamed:@"tabbar_message_center_selected"] forState:UIControlStateNormal];
    SGBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 25, 0, 0);
    SGBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    [self initbutton:SGBtn withtitle:@"建议反馈" cordinationY:320];
    [SGBtn addTarget:self action:@selector(Suggestion) forControlEvents:UIControlEventTouchUpInside];
                    
    

    UIButton * aboutBtn = [[UIButton alloc]init];
    [aboutBtn setImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] forState:UIControlStateNormal];
    aboutBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 25, 0, 0);
    aboutBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);

    [self initbutton:aboutBtn withtitle:@"关于软件" cordinationY:380];
    [aboutBtn addTarget:self action:@selector(About) forControlEvents:UIControlEventTouchUpInside];
   
}
-(void)planClick
{
    UIViewController * studyPlan = [[StudyPlanViewController alloc]init];
    UINavigationController * navi = [[UINavigationController alloc]initWithRootViewController:studyPlan];
    [self presentViewController:navi animated:YES completion:nil];
}
-(void)AccountSetting
{
    
    AccountSettingViewController * accountsetting = [[AccountSettingViewController alloc]init];
    UINavigationController * navi = [[UINavigationController alloc]initWithRootViewController:accountsetting];
    [self presentViewController:navi animated:YES completion:nil];
    
}
-(void)Suggestion
{
    UIViewController * suggestion  = [[SuggestionViewController alloc]init];
    UINavigationController * navi = [[UINavigationController alloc]initWithRootViewController:suggestion];
    [self presentViewController:navi animated:YES completion:nil];
}
-(void)About
{
    UIViewController * about = [[AboutViewController alloc]init];
    UINavigationController  * navi = [[UINavigationController alloc]initWithRootViewController:about];
    [self presentViewController:navi animated:YES completion:nil];
    
}
-(void)initbutton:(UIButton*)button withtitle:(NSString *)title  cordinationY:(CGFloat)cordinationY
{
    //UIButton * button = [[UIButton alloc]init];
    button.frame = CGRectMake(0, cordinationY, self.view.bounds.size.width,60);
    [button setTitle:title forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    button.titleLabel.font = [UIFont systemFontOfSize:20 weight:5];
    [button setTitleColor:HJCWORDCOLOR forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:153.0/255 green:77.0/255 blue:82.0/255 alpha:1] forState:UIControlStateHighlighted];
//    ;
    [self.view addSubview:button];
}

-(HomeViewController *)homePage
{
    if (!_homePage)
    {
        _homePage = [[HomeViewController alloc]init];
    }
    return _homePage;
}
-(void)firstClick
{
    SoftWareViewController *SoftWareSetting = [[SoftWareViewController alloc]init];
    
    UINavigationController * navi = [[UINavigationController alloc]initWithRootViewController:SoftWareSetting];
    
    [self presentViewController:navi animated:YES completion:nil];

}
-(void)moveToHome
{
    NSLog(@"%s",__func__);
    [self.navigationController presentViewController:_homePage animated:YES completion:nil];
    
}

@end
