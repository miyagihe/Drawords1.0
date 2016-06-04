//
//  AccountSettingViewController.m
//  Drawords
//
//  Created by hjc on 16/6/1.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "AccountSettingViewController.h"
#import "Consistant.h"
#import "PsdModiViewController.h"
#import "EmailModiViewController.h"
#import "NameModiViewController.h"


@interface AccountSettingViewController ()
@property ( nonatomic,strong)UITableView * menuTableView;

@end

@implementation AccountSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavi];
    [self setTableView];
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
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"%s",__func__);
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%s",__func__);
    
    return 3;
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
            cell.textLabel.text = @"修改密码";
            cell.imageView.image = [UIImage imageNamed:@"app"];
            break;
            
        case 1:
            cell.textLabel.text = @"修改邮箱";
            cell.imageView.image = [UIImage imageNamed:@"album"];
            break;
            
        case 2:
            cell.textLabel.text = @"修改昵称";
            cell.imageView.image = [UIImage imageNamed:@"app"];
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
        PsdModiViewController *psdModi=[[PsdModiViewController alloc]init];
        [self.navigationController pushViewController:psdModi animated:YES];
    }
    if (indexPath.row == 1) {
        EmailModiViewController * emailModi = [[EmailModiViewController alloc]init];
        [self.navigationController pushViewController:emailModi animated:YES];
    }
    if (indexPath.row == 2) {
        NameModiViewController * nameModi = [[NameModiViewController alloc]init];
        [self.navigationController pushViewController:nameModi animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}



@end
