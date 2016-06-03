//
//  StudyPlanViewController.m
//  Drawords
//
//  Created by hjc on 16/6/1.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "StudyPlanViewController.h"
#import "Consistant.h"
#import "UIView+Extension.h"
#import "MBProgressHUD+MJ.h"
#import "LanChooseViewController.h"
#import "BookChooseViewController.h"

@interface StudyPlanViewController ()
@property(nonatomic,strong)UITableView * menuTableView;
@property(nonatomic,strong)UISwitch * soundSwitch;
@property(nonatomic,strong)UISwitch * nightSwitch;



@end

@implementation StudyPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavi];
    
    [self setTableView];
    
}
-(void)setTableView
{
    _menuTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _menuTableView.delegate = self;
    _menuTableView.dataSource = self;
    _menuTableView.backgroundColor = HJCBACKGROUNDCOLOR;
    self.menuTableView = _menuTableView;
    _menuTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _menuTableView.scrollEnabled = NO;
    _menuTableView.separatorColor = HJCWORDCOLOR;
    [self.view addSubview:_menuTableView];

}
-(void)setUpNavi
{
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.view.backgroundColor  = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(BckToSettings)];
    self.navigationController.navigationBar.barTintColor = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem.tintColor = HJCWORDCOLOR;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [self.navigationItem setTitle:@"学习规划"];
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"%s",__func__);

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%s",__func__);

    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__func__);
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    _soundSwitch = [[UISwitch alloc]init];
    _nightSwitch = [[UISwitch alloc]init];
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"语种选择";
            cell.imageView.image = [UIImage imageNamed:@"app"];
            break;
            
        case 1:
            cell.textLabel.text = @"单词书选择";
            cell.imageView.image = [UIImage imageNamed:@"album"];
            break;
            
        case 2:
            cell.textLabel.text = @"每日单词书设定";
            cell.imageView.image = [UIImage imageNamed:@"app"];
            break;
        case 3:
            cell.textLabel.text = @"再认次数设定";
            cell.imageView.image = [UIImage imageNamed:@"album"];
            break;
    }
    cell.separatorInset = UIEdgeInsetsZero;
    cell.backgroundColor = HJCBACKGROUNDCOLOR;
    cell.textLabel.textColor = HJCWORDCOLOR;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        LanChooseViewController*lanChoose = [[LanChooseViewController alloc]init];
        [self.navigationController pushViewController:lanChoose animated:YES];
    }
    if(indexPath.row == 1){
        BookChooseViewController * bookChoose = [[BookChooseViewController alloc]init];
        [self.navigationController pushViewController:bookChoose animated:YES];
    }
    
        
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

@end
