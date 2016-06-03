//
//  MyprofileViewController.m
//  Drawords
//
//  Created by hjc on 16/6/2.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "MyprofileViewController.h"
#import "Consistant.h"

@interface MyprofileViewController ()

@end

@implementation MyprofileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = HJCBACKGROUNDCOLOR;
    
    [self setUpNavi];
    [self setUpInterface];
    
}
-(void)setUpInterface
{
    UIScrollView * contentScrollView = [[UIScrollView alloc]init];
    
    contentScrollView.frame = [UIScreen mainScreen].bounds;
    
    contentScrollView.backgroundColor = [UIColor redColor];
    contentScrollView.scrollEnabled = YES;
    [contentScrollView setScrollEnabled:YES];
    contentScrollView.contentSize = CGSizeMake(100, 100);
    contentScrollView.delegate = self;
    
    [self.view addSubview:contentScrollView];
}

-(void)setUpNavi
{
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.view.backgroundColor  = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(BckToSettings)];
    self.navigationController.navigationBar.barTintColor = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem.tintColor = HJCWORDCOLOR;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    [self.navigationItem setTitle:@"我的资料"];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:HJCWORDCOLOR}];

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"asdf");
}
-(void)BckToSettings
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
