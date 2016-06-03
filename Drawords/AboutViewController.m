//
//  AboutViewController.m
//  Drawords
//
//  Created by hjc on 16/6/1.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "AboutViewController.h"
#import "Consistant.h"
#import "UIView+Extension.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HJCBACKGROUNDCOLOR;

    [self setUpNavi];
    
    UIButton * wechat = [[UIButton alloc]init];
    wechat.frame = CGRectMake(self.view.bounds.size.width/2-100,
                              self.view.bounds.size.height/2+60,
                              200, 40);
    [self.view addSubview:wechat];
    [wechat setTitle:@"微信公众号:Drawords" forState:UIControlStateNormal];
    [wechat setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    wechat.backgroundColor = HJCWORDCOLOR;
    
    
    UIButton * weibo = [[UIButton alloc]init];
    weibo.frame = CGRectMake(self.view.bounds.size.width/2-100,
                              self.view.bounds.size.height/2+120,
                              200, 40);
    [self.view addSubview:weibo];
    [weibo setTitle:@"新浪微博:Drawords" forState:UIControlStateNormal];
    [weibo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    weibo.backgroundColor = HJCWORDCOLOR;
    
    
    UILabel * authorLabel = [[UILabel alloc]init];
    authorLabel.text = @"@MIYAGIHE";
    authorLabel.font  = [UIFont systemFontOfSize:20 weight:5];
    authorLabel.x = weibo.x;
    authorLabel.textColor = HJCWORDCOLOR;
    authorLabel.y =self.view.bounds.size.height/2+180;
    authorLabel.width = weibo.width;
    authorLabel.height  = weibo.height;
    [self.view addSubview:authorLabel];
    
    
    
}
-(void)setUpView
{
    
}

-(void)setUpNavi
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.view.backgroundColor  = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(BckToSettings)];
    self.navigationController.navigationBar.barTintColor = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem.tintColor = HJCWORDCOLOR;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    [self.navigationItem setTitle:@"关于Drawods"];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:HJCWORDCOLOR}];
}

-(void)BckToSettings
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
