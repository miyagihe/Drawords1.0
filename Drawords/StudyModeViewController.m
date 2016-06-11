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
#import "HomeViewController.h"
#import "XMLDictionary.h"
@interface StudyModeViewController ()

@property(nonatomic,strong)UIButton * tooEasyBtn;
@property(nonatomic,strong)UIButton * forgetBtn;
@property(nonatomic,strong)UIButton * rememberBtn;
@property(nonatomic,strong)UIButton * nextBtn;
@property(nonatomic,strong)WordDisplayButton * wordDisplay;
@property(nonatomic,strong)UILabel * reminderDisplay;
@property(nonatomic,strong)UILabel * interpretationLabel;
@property(nonatomic,assign)int listNo;
@property(nonatomic,strong)NSMutableArray * unFinishedArray;
@property(nonatomic,strong)UIView * progressView;
@property(nonatomic,assign)NSInteger DailyTaskCount;
@property(nonatomic,strong)NSMutableArray * testArray;
@property(nonatomic,strong)HomeViewController * home;
@property(nonatomic,strong)NSMutableArray * unfinishedVocabularyArray;
@end


@implementation StudyModeViewController

-(void)viewWillAppear:(BOOL)animated
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setProgressView];
    [self setUpNavi];
    [self createButtons];
    [self createWordDisplay];
    [self loadWordDisplay];
    [self createDisPlays];
}
-(void)loadData
{
    NSArray *UserAccountPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [UserAccountPath objectAtIndex:0];
    NSString*unfinishedPlistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"Unfinished.plist"];
    _unFinishedArray = [NSMutableArray arrayWithContentsOfFile:unfinishedPlistPath];
    
    NSString* unfinishedVocabularyArrayPath=[doucumentsDirectiory stringByAppendingPathComponent:@"UnfinishedVocabulary.plist"];
    _unfinishedVocabularyArray = [NSMutableArray arrayWithContentsOfFile:unfinishedVocabularyArrayPath];
    NSLog(@"%lu",(unsigned long)_unfinishedVocabularyArray.count);
//    NSLog(@"%@",_unFinishedArray);
}
-(void)setProgressView{
    _progressView = [[UIView alloc]init];
    _progressView.frame = CGRectMake(10, 10, self.view.width-20, 5);
    _progressView.backgroundColor = HJCMENUCOLOR;
    [self.view addSubview:_progressView];
}
-(void)createWordDisplay
{
    _wordDisplay = [[WordDisplayButton alloc]init];
    _wordDisplay.frame = CGRectMake(_progressView.x, _progressView.y+15, _progressView.width, 40);
    _wordDisplay.backgroundColor = HJCMENUCOLOR;
    _wordDisplay.soundView.image = [UIImage imageNamed:@"d_haha"];
    _wordDisplay.wordLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_wordDisplay];
}
-(void)loadWordDisplay
{
    _wordDisplay.wordLabel.text = [_unFinishedArray[_listNo] valueForKey:@"DeWord"];
    [self showButtons];
}
-(void)createDisPlays
{
    _reminderDisplay = [[UILabel alloc]init];
    _reminderDisplay.frame = CGRectMake(_wordDisplay.x, _wordDisplay.y+15+_wordDisplay.height, _wordDisplay.width, 40);
    _reminderDisplay.backgroundColor = HJCMENUCOLOR;
    _reminderDisplay.textAlignment = NSTextAlignmentCenter;
    _reminderDisplay.textColor = HJCWORDCOLOR;
    [self.view addSubview:_reminderDisplay];
    _reminderDisplay.hidden = YES;

    _interpretationLabel = [[UILabel alloc]init];
    _interpretationLabel.frame= CGRectMake(_reminderDisplay.x, _reminderDisplay.y+15+_reminderDisplay.height, _reminderDisplay.width, 100);
    _interpretationLabel.backgroundColor = HJCMENUCOLOR;
    _interpretationLabel.textColor = HJCWORDCOLOR;
    _interpretationLabel.textAlignment= NSTextAlignmentCenter;
    [self.view addSubview:_interpretationLabel];
    _interpretationLabel.hidden = YES;
}
-(void)showDisPlays
{
    _reminderDisplay.text = [NSString stringWithFormat:@"中文直译:%@",[_unFinishedArray[_listNo] valueForKey:@"CnWord"]];
    _interpretationLabel.numberOfLines = 0;
    _interpretationLabel.text = [NSString stringWithFormat:@"%@",[[_unFinishedArray[_listNo] valueForKey:@"Interpretation"]
                                                                  stringByReplacingOccurrencesOfString:@"\\n" withString:@" \r\n" ]];
    _reminderDisplay.hidden = NO;
    _interpretationLabel.hidden = NO;

}
-(void)createButtons
{
    _tooEasyBtn = [[UIButton alloc]init];
    _tooEasyBtn.frame = CGRectMake(_progressView.x, self.view.height-250, _progressView.width, 40);
    _tooEasyBtn.backgroundColor = [UIColor colorWithRed:153.0/255 green:77.0/255 blue:82.0/255 alpha:1];
    [_tooEasyBtn setTitle:@"很熟悉，不再学习" forState:UIControlStateNormal];
    [self.view addSubview:_tooEasyBtn];
    _tooEasyBtn.hidden = YES;
    
    _rememberBtn = [[UIButton alloc]init];
    _rememberBtn.frame = CGRectMake(_progressView.x, CGRectGetMaxY(_tooEasyBtn.frame)+5, _progressView.width, 40);
    _rememberBtn.backgroundColor = HJCWORDCOLOR;
    [_rememberBtn setTitle:@"记得" forState:UIControlStateNormal];
        [_rememberBtn addTarget:self action:@selector(showNextOne) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_rememberBtn];
    _rememberBtn.hidden = YES;
    
    _nextBtn = [[UIButton alloc]init];
    _nextBtn.frame = CGRectMake(_progressView.x, CGRectGetMaxY(_tooEasyBtn.frame)+5, _progressView.width, 40);
    _nextBtn.backgroundColor = [UIColor greenColor];
    [_nextBtn setTitle:@"下一个" forState:UIControlStateNormal];
    [_nextBtn addTarget:self action:@selector(contiueNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextBtn];
    _nextBtn.hidden = YES;

    
    _forgetBtn = [[UIButton alloc]init];
    _forgetBtn.frame = CGRectMake(_progressView.x, CGRectGetMaxY(_rememberBtn.frame)+5, _progressView.width,
                                  40);
    _forgetBtn.backgroundColor = [UIColor colorWithRed:230.0/255 green:180.0/255 blue:80.0/255 alpha:1];
    [_forgetBtn setTitle:@"忘记了" forState:UIControlStateNormal];
    
    [_forgetBtn addTarget:self action:@selector(showReminder) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_forgetBtn];
    _forgetBtn.hidden = YES;
   
}
-(void)showButtons
{
    _tooEasyBtn.hidden = NO;
    _rememberBtn.hidden = NO;
    _nextBtn.hidden = YES;
    _forgetBtn.hidden = NO;
}
-(void)showNextOne
{
    NSLog(@"%s",__func__);
    _listNo =arc4random() % _unFinishedArray.count;
    
    if ( _unFinishedArray.count-1 == 0)
    {
        NSLog(@"%@",[_unFinishedArray[_listNo] valueForKey:@"Id"]);
        FinishViewController * finishView = [[FinishViewController alloc]init];
        [self.navigationController pushViewController:finishView animated:YES];
    }
    else
    {
        [self loadWordDisplay];
        [self showButtons];
        _interpretationLabel.hidden = YES;
        _reminderDisplay.hidden = YES;
        _rememberBtn.hidden = NO;
        _forgetBtn.hidden = NO;
        _tooEasyBtn.hidden = NO;
    }
    NSArray *UserAccountPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [UserAccountPath objectAtIndex:0];
    NSString*unfinishedPlistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"Unfinished.plist"];
    _unFinishedArray = [NSMutableArray arrayWithContentsOfFile:unfinishedPlistPath];
    [_unFinishedArray removeObject:_unFinishedArray[_listNo]];
    [_unFinishedArray writeToFile:unfinishedPlistPath atomically:YES];
    
    NSString* unfinishedVocabularyArrayPath=[doucumentsDirectiory stringByAppendingPathComponent:@"UnfinishedVocabulary.plist"];
    _unfinishedVocabularyArray = [NSMutableArray arrayWithContentsOfFile:unfinishedVocabularyArrayPath];

    [_unfinishedVocabularyArray removeObject:_unFinishedArray[_listNo]];
    [_unfinishedVocabularyArray writeToFile:unfinishedVocabularyArrayPath atomically:YES];
    
    NSLog(@"今日剩余%lu个，NO IS %d,总表还剩%lu个",(unsigned long)_unFinishedArray.count,_listNo,_unfinishedVocabularyArray.count);
}
-(void)showReminder
{
    _rememberBtn.hidden = NO;
    self.navigationItem.title = @"提醒模式";
    _nextBtn.hidden = NO;
    [_nextBtn addTarget:self action:@selector(contiueNext) forControlEvents:UIControlEventTouchUpInside];
    _tooEasyBtn.hidden = YES;
    _forgetBtn.hidden = YES;
    [self showDisPlays];
}
-(void)contiueNext
{
    NSLog(@"%s",__func__);
     _listNo =arc4random() % _unFinishedArray.count;

    if (_unFinishedArray.count-1 == 0)
    {
        NSLog(@"%@",[_unFinishedArray[_listNo] valueForKey:@"Id"]);
        FinishViewController * finishView = [[FinishViewController alloc]init];
        [self.navigationController pushViewController:finishView animated:YES];
    }
    else
    {
        [self loadWordDisplay];
        [self showButtons];
        _interpretationLabel.hidden = YES;
        _reminderDisplay.hidden = YES;
    }
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
