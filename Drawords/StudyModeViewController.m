//
//  StudyModeViewController.m
//  Drawords
//
//  Created by hjc on 16/6/2.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "StudyModeViewController.h"
#import "Consistant.h"
#import "UIView+Extension.h"
#import "WordDisplayButton.h"
#import "FinishViewController.h"
#import "GDataXMLNode.h"
#import "HomeViewController.h"
@interface StudyModeViewController ()
@property(nonatomic,strong)UIButton * tooEasyBtn;
@property(nonatomic,strong)UIButton * forgetBtn;
@property(nonatomic,strong)UIButton * rememberBtn;
@property(nonatomic,strong)WordDisplayButton * wordDisplay;
@property(nonatomic,strong)HomeViewController * homeView;
@property(nonatomic,strong)UILabel * reminderDisplay;
@property(nonatomic,assign)int listNo;
@property(nonatomic,strong)NSArray* listArray;
@property(nonatomic,strong)UILabel * interpretationLabel;



@end

@implementation StudyModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HJCBACKGROUNDCOLOR;
    [self setUpNavi];
    [self setUpInterFace];
    _listNo = 0;
    [self loadInitialView];
    
}
-(void)loadInitialView
{
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"Words"ofType:@"xml"];
    NSString *xmlString = [NSString stringWithContentsOfFile:xmlPath encoding:NSUTF8StringEncoding error:nil];
    GDataXMLDocument *xmlDoc = [[GDataXMLDocument alloc] initWithXMLString:xmlString options:0 error:nil];
    GDataXMLElement *xmlRoot = [xmlDoc rootElement];
    _listArray = [xmlRoot children];
    GDataXMLElement * element = _listArray[_listNo];
    NSArray * DeWordarray = [element elementsForName:@"DeWord"];
    GDataXMLElement * subelement = DeWordarray[0];
    _wordDisplay.wordLabel.text = subelement.stringValue;
    
    NSArray * CnWordarray = [element elementsForName:@"CnWord"];
    GDataXMLElement * Cnsubelement = CnWordarray[0];
    _reminderDisplay.text = [NSString stringWithFormat:@"中文直译:%@",Cnsubelement.stringValue];
    _reminderDisplay.hidden = YES;
    
    NSArray * InWordarray = [element elementsForName:@"Interpretation"];
    GDataXMLElement * Insubelement = InWordarray[0];
    _interpretationLabel.text = [NSString stringWithFormat:@"%@",[Insubelement.stringValue stringByReplacingOccurrencesOfString:@"\\n" withString:@" \r\n" ]];
    _interpretationLabel.hidden = YES;
    _interpretationLabel.numberOfLines = 0;

    

}
-(void)setUpInterFace
{
    UIView * progressView = [[UIView alloc]init];
    progressView.frame = CGRectMake(10, 10, self.view.width-20, 5);
    progressView.backgroundColor = HJCMENUCOLOR;
    [self.view addSubview:progressView];
    
    _wordDisplay = [[WordDisplayButton alloc]init];
    _wordDisplay.frame = CGRectMake(progressView.x, progressView.y+15, progressView.width, 40);
    _wordDisplay.backgroundColor = HJCMENUCOLOR;
    _wordDisplay.soundView.image = [UIImage imageNamed:@"d_haha"];
    _wordDisplay.wordLabel.text = @"hehehe";
    [self.view addSubview:_wordDisplay];
    
    _reminderDisplay = [[UILabel alloc]init];
    _reminderDisplay.frame = CGRectMake(_wordDisplay.x, _wordDisplay.y+15+_wordDisplay.height, _wordDisplay.width, 40);
    _reminderDisplay.backgroundColor = HJCMENUCOLOR;
    _reminderDisplay.textAlignment = NSTextAlignmentCenter;
    _reminderDisplay.textColor = HJCWORDCOLOR;
    [self.view addSubview:_reminderDisplay];
    
    _interpretationLabel = [[UILabel alloc]init];
    _interpretationLabel.frame= CGRectMake(_reminderDisplay.x, _reminderDisplay.y+15+_reminderDisplay.height, _reminderDisplay.width, 80);
    _interpretationLabel.backgroundColor = HJCMENUCOLOR;
    
    _interpretationLabel.textColor = HJCWORDCOLOR;
    [self.view addSubview:_interpretationLabel];
    
    
    
    _tooEasyBtn = [[UIButton alloc]init];
    _tooEasyBtn.frame = CGRectMake(progressView.x, self.view.height-250, progressView.width, 40);
    _tooEasyBtn.backgroundColor = [UIColor colorWithRed:153.0/255 green:77.0/255 blue:82.0/255 alpha:1];
    [_tooEasyBtn setTitle:@"很熟悉，不再学习" forState:UIControlStateNormal];
    [self.view addSubview:_tooEasyBtn];
    
    _rememberBtn = [[UIButton alloc]init];
    _rememberBtn.frame = CGRectMake(progressView.x, CGRectGetMaxY(_tooEasyBtn.frame)+5, progressView.width, 40);
    _rememberBtn.backgroundColor = HJCWORDCOLOR;
    [_rememberBtn setTitle:@"记得" forState:UIControlStateNormal];
    [_rememberBtn addTarget:self action:@selector(showFinishView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_rememberBtn];
    
    _forgetBtn = [[UIButton alloc]init];
    _forgetBtn.frame = CGRectMake(progressView.x, CGRectGetMaxY(_rememberBtn.frame)+5, progressView.width,
                                 40);
    _forgetBtn.backgroundColor = [UIColor colorWithRed:230.0/255 green:180.0/255 blue:80.0/255 alpha:1];
    [_forgetBtn setTitle:@"忘记了" forState:UIControlStateNormal];
    [_forgetBtn addTarget:self action:@selector(showReminder) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_forgetBtn];
    
   
}
-(void)showFinishView
{
    FinishViewController * finishView = [[FinishViewController alloc]init];
    [self.navigationController pushViewController:finishView animated:YES];
}
-(void)showReminder
{
    self.navigationItem.title = @"提醒模式";
    _tooEasyBtn.frame = _rememberBtn.frame;
    _forgetBtn.frame = _rememberBtn.frame;
    [_rememberBtn setTitle:@"下一个" forState:UIControlStateNormal];
    _tooEasyBtn.hidden = YES;
    _forgetBtn.hidden = YES;
    _reminderDisplay.hidden = NO;
    _interpretationLabel.hidden = NO;
    
}
-(void)setUpNavi
{
    self.view.backgroundColor = HJCBACKGROUNDCOLOR;
    [self.navigationItem setTitle:@"测试模式"];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:HJCWORDCOLOR}];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = HJCBACKGROUNDCOLOR;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:23.0/255 green:44.0/255 blue:60.0/255 alpha:0.7];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tabbar_home_selected"] style:UIBarButtonItemStylePlain target:self action:@selector(moveToTodayPlan)];
    UIBarButtonItem * leftBarBtn = self.navigationItem.leftBarButtonItem;
    leftBarBtn.tintColor = HJCWORDCOLOR;
}
-(void)moveToTodayPlan
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
