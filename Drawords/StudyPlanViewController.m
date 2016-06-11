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
#import "DailyQViewController.h"
#import "ReCountViewController.h"

@interface StudyPlanViewController ()
@property(nonatomic,strong)UITableView * menuTableView;
@property(nonatomic,strong)UILabel * lanLabel;
@property(nonatomic,strong)UILabel * bookLabel;
@property(nonatomic,strong)UILabel * dailyLabel;
@property(nonatomic,strong)UILabel * reconLabel;

@end

@implementation StudyPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavi];
    
    [self setTableView];
    
}
-(void)viewWillAppear:(BOOL)animated
{

    [_menuTableView reloadData];
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

    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__func__);
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
 
    if (indexPath.row == 0) {
        _lanLabel = [[UILabel alloc]init];
        _lanLabel.frame = CGRectMake(5, 5, 100, cell.height);
        _lanLabel.textAlignment = NSTextAlignmentRight;
        _lanLabel.textColor = HJCWORDCOLOR;

        cell.textLabel.text = @"语种选择";
        cell.imageView.image = [UIImage imageNamed:@"app"];
        _lanLabel.text = @"当前:德语";
        cell.accessoryView = _lanLabel;
    }
    
    
    if (indexPath.row == 1) {
        _bookLabel = [[UILabel alloc]init];
        _bookLabel.frame = CGRectMake(5, 5, 100, cell.height);
        _bookLabel.textAlignment = NSTextAlignmentRight;
        _bookLabel.textColor = HJCWORDCOLOR;
        
        cell.textLabel.text = @"单词书选择";
        cell.imageView.image = [UIImage imageNamed:@"album"];
        _bookLabel.text = @"当前:德语A1";
        cell.accessoryView = _bookLabel;

    }
            
    if (indexPath.row == 2) {
        _dailyLabel = [[UILabel alloc]init];
        _dailyLabel.frame = CGRectMake(5, 5, 120, cell.height);
        _dailyLabel.textAlignment = NSTextAlignmentRight;

        _dailyLabel.textColor = HJCWORDCOLOR;
        cell.textLabel.text = @"每日单词量";
        cell.imageView.image = [UIImage imageNamed:@"app"];
        NSArray *UserAccountPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        NSString *doucumentsDirectiory = [UserAccountPath objectAtIndex:0];
        NSString*plistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"UserAccount.plist"];
        NSDictionary*userAccountDict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
        
        _dailyLabel.text = [NSString stringWithFormat:@"已选择:%@",[userAccountDict valueForKey:@"DailyTaskCount"]];
        cell.accessoryView = _dailyLabel;

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
    if (indexPath.row == 0){
        LanChooseViewController*lanChoose = [[LanChooseViewController alloc]init];
        [self.navigationController pushViewController:lanChoose animated:YES];
    }
    if(indexPath.row == 1){
        BookChooseViewController * bookChoose = [[BookChooseViewController alloc]init];
        [self.navigationController pushViewController:bookChoose animated:YES];
    }
    if(indexPath.row == 2){
        DailyQViewController * daylyQ = [[DailyQViewController alloc]init];
        [self.navigationController pushViewController:daylyQ animated:YES];
    }
    if(indexPath.row == 3){
        ReCountViewController * ReCount = [[ReCountViewController alloc]init];
        [self.navigationController pushViewController:ReCount animated:YES];
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

@end
