//
//  DailyQViewController.m
//  Drawords
//
//  Created by hjc on 16/6/4.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "DailyQViewController.h"
#import "Consistant.h"

@interface DailyQViewController ()
@property(nonatomic,strong)UITableView * menuTableView;
@property(nonatomic,strong)    NSString*planSettingPath;

@end

@implementation DailyQViewController

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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"学习计划" style:UIBarButtonItemStyleDone target:self action:@selector(BckToSettings)];
    self.navigationController.navigationBar.barTintColor = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem.tintColor = HJCWORDCOLOR;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [self.navigationItem setTitle:@"每日单词量选择"];
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
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"%s",__func__);
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%s",__func__);
    
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__func__);
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"50";
            break;
            
        case 1:
            cell.textLabel.text = @"100";
            break;
            
        case 2:
            cell.textLabel.text = @"150";
            break;
        case 3:
            cell.textLabel.text = @"200";
            break;
        case 4:
            cell.textLabel.text = @"自定义";
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
    NSArray *UserAccountPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [UserAccountPath objectAtIndex:0];
    NSString*plistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"UserAccount.plist"];
    NSDictionary*userAccountDict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    if (indexPath.row == 0)
    {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"已设置为:50" message:@"修改后的任务单词量将在第二天生效,若选择错误可重新设置"  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * confirmBtn = [UIAlertAction actionWithTitle:@"明白" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [userAccountDict setValue:@"50" forKey:@"DailyTaskCount"];
            [userAccountDict writeToFile:plistPath atomically:YES];
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
        [alert addAction:confirmBtn];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if (indexPath.row == 1)
    {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"已设置为:100" message:@"修改后的任务单词量将在第二天生效,若选择错误可重新设置"  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * confirmBtn = [UIAlertAction actionWithTitle:@"明白" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [userAccountDict setValue:@"100" forKey:@"DailyTaskCount"];
            [userAccountDict writeToFile:plistPath atomically:YES];
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
        [alert addAction:confirmBtn];
        [self presentViewController:alert animated:YES completion:nil];

    }
    if (indexPath.row == 2)
    {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"已设置为:150" message:@"修改后的任务单词量将在第二天生效,若选择错误可重新设置"  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * confirmBtn = [UIAlertAction actionWithTitle:@"明白" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [userAccountDict setValue:@"150" forKey:@"DailyTaskCount"];
            [userAccountDict writeToFile:plistPath atomically:YES];
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
        [alert addAction:confirmBtn];
        [self presentViewController:alert animated:YES completion:nil];

    }
    if (indexPath.row == 3)
    {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"已设置为:200" message:@"修改后的任务单词量将在第二天生效,若选择错误可重新设置,若选择错误可重新设置"  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * confirmBtn = [UIAlertAction actionWithTitle:@"明白" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [userAccountDict setValue:@"200" forKey:@"DailyTaskCount"];
            [userAccountDict writeToFile:plistPath atomically:YES];
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [alert addAction:confirmBtn];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
