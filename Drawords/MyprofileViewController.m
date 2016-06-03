//
//  MyprofileViewController.m
//  Drawords
//
//  Created by hjc on 16/6/2.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "MyprofileViewController.h"
#import "Consistant.h"
#import "UIView+Extension.h"

@interface MyprofileViewController ()
@property(nonatomic,strong)UIButton*daysBtn;
@property(nonatomic,strong)UIButton * lanBtn;
@property(nonatomic,strong)UIButton  * bookBtn;
@property(nonatomic,strong)UIButton * nameBtn;


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
    UIButton * iconBtn = [[UIButton alloc]init];
    iconBtn.y = self.view.width/3.5;
    iconBtn.width = self.view.width/3.5;
    iconBtn.height = self.view.width/3.5;
    iconBtn.x= self.view.width/2-iconBtn.width/2;
    [iconBtn addTarget:self action:@selector(changeIconView) forControlEvents:UIControlEventTouchUpInside];
    [iconBtn setImage:[UIImage imageNamed:@"avatar_default_big"] forState:UIControlStateNormal];
    [self.view addSubview:iconBtn];
    
    _nameBtn = [[UIButton alloc]init];
    _nameBtn.y = iconBtn.y+iconBtn.height+10;
    _nameBtn.width = self.view.width;
    _nameBtn.height = 30;
    _nameBtn.x = 0;
    [_nameBtn setTitle:@"MIYAGIHE" forState:UIControlStateNormal];
    _nameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_nameBtn setTitleColor:HJCWORDCOLOR forState:UIControlStateNormal];
    [_nameBtn addTarget:self action:@selector(changeName) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nameBtn];
    
    
    UITableView * menuTableView = [[UITableView alloc]init];
    menuTableView.frame = CGRectMake(20, self.view.height-300, self.view.width-40, 180);
    menuTableView.separatorColor = HJCBACKGROUNDCOLOR;
    menuTableView.delegate = self;
    menuTableView.dataSource = self;
    menuTableView.scrollEnabled = NO;
    menuTableView.userInteractionEnabled = NO;
    [self.view addSubview:menuTableView];
}

-(void)changeName
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:@"请输入新昵称"  preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入新昵称";
        textField.textColor = HJCBACKGROUNDCOLOR;
        textField.keyboardAppearance = UIKeyboardAppearanceDark;
        textField.keyboardType = UIKeyboardTypeNamePhonePad;
    }];
    UIAlertAction * confirmBtn = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction * cancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
   
    [alert addAction:confirmBtn];
    [alert addAction:cancelBtn];
    [self presentViewController:alert animated:YES completion:nil];
    
}
-(void)changeIconView
{
    UIAlertController * action = [UIAlertController alertControllerWithTitle:nil message:@"请选择头像获取方式"  preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction * captureBtn = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction * chooseBtn = [UIAlertAction actionWithTitle:@"从相册选取头像" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction * cancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }];

    
    [action addAction:captureBtn];
    [action addAction:chooseBtn];
    [action addAction:cancelBtn];
    [self presentViewController:action animated:YES completion:nil];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    _daysBtn = [[UIButton alloc]init];
    _lanBtn = [[UIButton alloc]init];
    _bookBtn = [[UIButton alloc]init];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"已使用天数";
            cell.textLabel.textColor = HJCMENUCOLOR;
            cell.backgroundColor = HJCWORDCOLOR;
            [_daysBtn setTitle:@"1234天" forState:UIControlStateNormal];
            _daysBtn.frame = CGRectMake(0, 0, 100, 40);
            cell.accessoryView = _daysBtn;
            break;
        case 1:
            cell.textLabel.text = @"正在学习的语种";
            cell.textLabel.textColor = HJCMENUCOLOR;
            cell.backgroundColor = HJCWORDCOLOR;
            [_lanBtn setTitle:@"德语" forState:UIControlStateNormal];
            _lanBtn.frame = CGRectMake(0, 0, 100, 40);
            cell.accessoryView = _lanBtn;
            break;
        case 2:
            cell.textLabel.text = @"正在学习的单词书";
            cell.textLabel.textColor = HJCMENUCOLOR;
            cell.backgroundColor = HJCWORDCOLOR;
            [_bookBtn setTitle:@"德语A1词汇" forState:UIControlStateNormal];
            _bookBtn.frame = CGRectMake(0, 0, 100, 40);
            cell.accessoryView = _bookBtn;
            break;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(void)BckToSettings
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
