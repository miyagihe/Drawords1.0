//
//  SoftWareViewController.m
//  Drawords
//
//  Created by hjc on 16/6/1.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "SoftWareViewController.h"
#import "Consistant.h"
#import "MBProgressHUD+MJ.h"

@interface SoftWareViewController ()
@property ( nonatomic,strong)UITableView * planTableView;
@property(nonatomic,strong)UISwitch * soundSwitch;
@property(nonatomic,strong)UISwitch * nightSwitch;
@end

@implementation SoftWareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavi];
    
    [self setTableView];
    
   
}
-(void)setTableView
{
    _planTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _planTableView.delegate = self;
    _planTableView.dataSource = self;
    _planTableView.backgroundColor = HJCBACKGROUNDCOLOR;
    self.planTableView = _planTableView;
    _planTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _planTableView.scrollEnabled = NO;
    _planTableView.separatorColor = HJCWORDCOLOR;
    [self.view addSubview:_planTableView];
    
}
-(void)setUpNavi
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.view.backgroundColor  = HJCBACKGROUNDCOLOR;
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
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"asdf");
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
            cell.textLabel.text = @"自动发音";
            cell.imageView.image = [UIImage imageNamed:@"app"];
            cell.accessoryView = _soundSwitch;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            break;
            
        case 1:
            cell.textLabel.text = @"夜间模式";
            cell.imageView.image = [UIImage imageNamed:@"album"];
            cell.accessoryView = _nightSwitch;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            break;
            
        case 2:
            cell.textLabel.text = @"清除缓存";
            cell.imageView.image = [UIImage imageNamed:@"app"];
            break;
        case 3:
            cell.textLabel.text = @"学习提醒";
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
    if (indexPath.row == 2) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:@"确认清除离线缓存文件？"  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * confirmBtn = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [MBProgressHUD showMessage:@"缓存清除中.."];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
                [MBProgressHUD showSuccess:@"清除完成"];
            });
        }];
        UIAlertAction * cancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alert addAction:confirmBtn];
        [alert addAction:cancelBtn];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
