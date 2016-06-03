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
#import "UIView+Extension.h"
#import "StudyModeViewController.h"
#import "HJCButton.h"
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
    
    [self setUpUpContentView];
}
-(void)setUpUpContentView
{
    UIView * upContainerView = [[UIView alloc]init];
    upContainerView.backgroundColor = HJCMENUCOLOR;
    upContainerView.frame = CGRectMake(10,self.navigationController.navigationBar.bounds.size.height-30, self.view.bounds.size.width-20, 150);
    upContainerView.layer.cornerRadius = 5;
    [self.view addSubview:upContainerView];
    
    UIView * divider = [[UIView alloc]init];
    divider.frame = CGRectMake(upContainerView.width/2-20, 10, 2, upContainerView.height-20);
    divider.backgroundColor = HJCWORDCOLOR;
    [upContainerView addSubview:divider];
    
    UIButton * totalDays = [[UIButton alloc]init];
    [totalDays setTitle:@"12341" forState:UIControlStateNormal];
    totalDays.titleLabel.font = [ UIFont systemFontOfSize:32];
    totalDays.frame = CGRectMake(totalDays.x, 30,100, 50);
    totalDays.x=divider.x/2-totalDays.width/2;
    [totalDays setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [upContainerView addSubview:totalDays];
    
    UILabel * totalDaysWord = [[UILabel alloc]init];
    totalDaysWord.textAlignment = NSTextAlignmentCenter;
    totalDaysWord.text = @"学习天数";
    totalDaysWord.textColor = HJCWORDCOLOR;
    totalDaysWord.frame = CGRectMake(totalDays.x, totalDays.y+totalDays.height, 100, 30);
    [upContainerView addSubview:totalDaysWord];
    
    //累计学习单词数
    HJCButton * totalQuantity = [[HJCButton alloc]init];
    totalQuantity.quantity.text = @"12345";
    totalQuantity.quantity.textAlignment = NSTextAlignmentRight;
    totalQuantity.quantity.font = [UIFont systemFontOfSize:18];
    totalQuantity.quantity.textColor =[UIColor colorWithRed:230.0/255 green:180.0/255 blue:80.0/255 alpha:1];
    totalQuantity.Qdescription.text = @"/已学习单词数";
    totalQuantity.Qdescription.font = [UIFont systemFontOfSize:12];
    totalQuantity.Qdescription.textColor = HJCWORDCOLOR;
    totalQuantity.y = totalDays.y;
    totalQuantity.width = upContainerView.width-CGRectGetMaxX(divider.frame)-20;
    totalQuantity.height = 40;
    totalQuantity.x= CGRectGetMaxX(divider.frame)+(upContainerView.width-CGRectGetMaxX(divider.frame))/2-totalQuantity.width/2;
    [upContainerView addSubview:totalQuantity];
    
    //掌握单词数
    HJCButton * quantiryInHand = [[HJCButton alloc]init];
    quantiryInHand.quantity.text = @"12";
    quantiryInHand.quantity.textAlignment = NSTextAlignmentRight;
    quantiryInHand.quantity.font = [UIFont systemFontOfSize:18];
    quantiryInHand.quantity.textColor =[UIColor colorWithRed:230.0/255 green:180.0/255 blue:80.0/255 alpha:1];
    quantiryInHand.Qdescription.text = @"/已掌握单词数";
    quantiryInHand.Qdescription.font = [UIFont systemFontOfSize:12];
    quantiryInHand.Qdescription.textColor = HJCWORDCOLOR;
    quantiryInHand.y = totalDays.y+40;
    quantiryInHand.width = upContainerView.width-CGRectGetMaxX(divider.frame)-20;
    quantiryInHand.height = 40;
    quantiryInHand.x= CGRectGetMaxX(divider.frame)+(upContainerView.width-CGRectGetMaxX(divider.frame))/2-totalQuantity.width/2;
    [upContainerView addSubview:quantiryInHand];
    
    UIView * downContainerView = [[UIView alloc]init];
    downContainerView.frame = CGRectMake(upContainerView.x, CGRectGetMaxY(upContainerView.frame)+30, upContainerView.width, upContainerView.height);
    downContainerView.backgroundColor = upContainerView.backgroundColor;
    downContainerView.layer.cornerRadius = 5;
    [self.view addSubview:downContainerView];
    
    UIButton * todayQuantity = [[UIButton alloc]init];
    [todayQuantity setTitle:@"999" forState:UIControlStateNormal];
    todayQuantity.titleLabel.font = [ UIFont systemFontOfSize:32 weight:5];
    todayQuantity.frame = CGRectMake(30, 30,80, 50);
    todayQuantity.layer.cornerRadius = 5;
    [todayQuantity setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downContainerView addSubview:todayQuantity];
    
    UILabel * todayQuantityWords = [[UILabel alloc]init];
    todayQuantityWords.textAlignment = NSTextAlignmentCenter;
    todayQuantityWords.text = @"今日单词";
    todayQuantityWords.textColor = HJCWORDCOLOR;
    todayQuantityWords.frame = CGRectMake(todayQuantity.x, todayQuantity.y+todayQuantity.height, 80, 30);
    [downContainerView addSubview:todayQuantityWords];
    
    UIButton * newQuantity = [[UIButton alloc]init];
    [newQuantity setTitle:@"100" forState:UIControlStateNormal];
    newQuantity.titleLabel.font = [ UIFont systemFontOfSize:32 weight:5];
    newQuantity.frame = CGRectMake(upContainerView.width*0.5-40, 30,80, 50);
    newQuantity.layer.cornerRadius = 5;
    [newQuantity setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downContainerView addSubview:newQuantity];
    
    UILabel * newQuantityWords = [[UILabel alloc]init];
    newQuantityWords.textAlignment = NSTextAlignmentCenter;
    newQuantityWords.text = @"今日新词";
    newQuantityWords.textColor = HJCWORDCOLOR;
    newQuantityWords.frame = CGRectMake(newQuantity.x, newQuantity.y+newQuantity.height, 80, 30);
    [downContainerView addSubview:newQuantityWords];
    
    UIButton * finishedQuantity = [[UIButton alloc]init];
    [finishedQuantity setTitle:@"100" forState:UIControlStateNormal];
    finishedQuantity.titleLabel.font = [ UIFont systemFontOfSize:32 weight:5];
    [finishedQuantity setTitleColor:HJCWORDCOLOR forState:UIControlStateNormal];
    finishedQuantity.frame = CGRectMake(downContainerView.width-30-80, 30,80, 50);
    finishedQuantity.layer.cornerRadius = 5;
//    [finishedQuantity setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downContainerView addSubview:finishedQuantity];
    
    UILabel * finishedQuantityWords = [[UILabel alloc]init];
    finishedQuantityWords.textAlignment = NSTextAlignmentCenter;
    finishedQuantityWords.text = @"已完成";
    finishedQuantityWords.textColor = HJCWORDCOLOR;
    finishedQuantityWords.frame = CGRectMake(finishedQuantity.x, finishedQuantity.y+finishedQuantity.height, 80, 30);
    [downContainerView addSubview:finishedQuantityWords];
    
    
    UIButton * goBtn = [[UIButton alloc]init];
    goBtn.backgroundColor = HJCWORDCOLOR;
    goBtn.frame = CGRectMake(self.view.width/2-40,(CGRectGetMaxY(downContainerView.frame)+(self.view.height-CGRectGetMaxY(downContainerView.frame))/2)-80, 80, 80);
    goBtn.layer.cornerRadius = 40;
    [goBtn setTitle:@"GO" forState:UIControlStateNormal];
    [goBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [goBtn setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    goBtn.titleLabel.font = [UIFont systemFontOfSize:30];
    [goBtn addTarget:self action:@selector(goToStudy) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBtn];
    
}
-(void)goToStudy
{
    StudyModeViewController  * studyMode = [[StudyModeViewController alloc]init];
    [self.navigationController pushViewController:studyMode animated:YES];
    
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
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:23.0/255 green:44.0/255 blue:60.0/255 alpha:0.7];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(moveToSettings)];
    UIBarButtonItem * leftBarBtn = self.navigationItem.leftBarButtonItem;
    leftBarBtn.tintColor = HJCWORDCOLOR;
    

}
-(void)moveToSettings
{
    [self.sideMenuViewController presentLeftMenuViewController];

}

@end
