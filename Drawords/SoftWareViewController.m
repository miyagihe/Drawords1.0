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
@property ( nonatomic,strong)UITableView * menuTableView;
@property(nonatomic,strong)UISwitch * soundSwitch;
@property(nonatomic,strong)UISwitch * nightSwitch;
@property(nonatomic,strong)NSMutableDictionary * settingsDict;
@property(nonatomic,strong)NSString * plistPath;
@end

@implementation SoftWareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavi];
    [self setTableView];
    [self writeSettingsPlistToSandBox];
}
-(void)writeSettingsPlistToSandBox
{
    NSArray *storeFilePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [storeFilePath objectAtIndex:0];
    NSString *plistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"userSettings.plist"];
    NSFileManager *file = [NSFileManager defaultManager];
    if ([file fileExistsAtPath:plistPath])
    {
        NSLog(@"exists");
    }
    else //若沙盒中没有
    {
        NSError *error;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"SoftwareSettings" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath:plistPath error:&error];
    }
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    _soundSwitch = [[UISwitch alloc]init];
    [_soundSwitch addTarget:self action:@selector(setSwitch) forControlEvents:UIControlEventValueChanged];
    _nightSwitch = [[UISwitch alloc]init];
    [_nightSwitch addTarget:self action:@selector(setNight) forControlEvents:UIControlEventValueChanged];

    
    NSArray *storeFilePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [storeFilePath objectAtIndex:0];
    _plistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"userSettings.plist"];
    _settingsDict = [NSMutableDictionary dictionaryWithContentsOfFile:_plistPath];

    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"自动发音";
            cell.imageView.image = [UIImage imageNamed:@"app"];
            cell.accessoryView = _soundSwitch;
            if([[_settingsDict valueForKey:@"AutoSound"] isEqualToString:@"1"]){
                _soundSwitch.on = YES;
            }else{
                _soundSwitch.on = NO;
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            break;
        case 1:
            cell.textLabel.text = @"夜间模式";
            cell.imageView.image = [UIImage imageNamed:@"album"];
            cell.accessoryView = _nightSwitch;
            if([[_settingsDict valueForKey:@"NightMode"] isEqualToString:@"1"]){
                _nightSwitch.on = YES;
            }else{
                _nightSwitch.on = NO;
            }

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
-(void)setSwitch
{
    NSLog(@"%s",__func__);
    NSArray *storeFilePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [storeFilePath objectAtIndex:0];
    _plistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"userSettings.plist"];
    _settingsDict = [NSMutableDictionary dictionaryWithContentsOfFile:_plistPath];

    if ([[_settingsDict valueForKey:@"AutoSound"] isEqualToString:@"1"]) {
        [_settingsDict setValue:@"0" forKey:@"AutoSound"];
        [_settingsDict writeToFile:_plistPath atomically:YES];
    }
    else{
        [_settingsDict setValue:@"1" forKey:@"AutoSound"];
        [_settingsDict writeToFile:_plistPath atomically:YES];
    }
}
-(void)setNight
{
    NSLog(@"%s",__func__);
    NSArray *storeFilePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [storeFilePath objectAtIndex:0];
    _plistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"userSettings.plist"];
    _settingsDict = [NSMutableDictionary dictionaryWithContentsOfFile:_plistPath];
    
    if ([[_settingsDict valueForKey:@"NightMode"] isEqualToString:@"1"]) {
        [_settingsDict setValue:@"0" forKey:@"NightMode"];
        [_settingsDict writeToFile:_plistPath atomically:YES];
    }
    else{
        [_settingsDict setValue:@"1" forKey:@"NightMode"];
        [_settingsDict writeToFile:_plistPath atomically:YES];
    }

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
