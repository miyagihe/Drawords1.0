//
//  HomeViewController.m
//  Drawords
//
//  Created by hjc on 16/6/1.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "HomeViewController.h"
#import "GeneralSettingsViewController.h"
#import "Consistant.h"
#import "RESideMenu.h"
#import "UIView+Extension.h"
#import "StudyModeViewController.h"
#import "HJCButton.h"
#import "XMLDictionary.h"
@interface HomeViewController ()

@property(nonatomic,strong)UIButton * historyBtn;
@property(nonatomic,strong)UIButton * TodayBtn;
@property(nonatomic,strong)UIButton * finishedBtn;
@property(nonatomic,strong)NSMutableArray * presentVocalbulary;
@property(nonatomic,strong)UIButton * totalDaysBtn;
@property(nonatomic,strong)NSString *  currentDateString;
@property(nonatomic,strong)UIButton * goBtn;
@property(nonatomic,strong)NSMutableArray*unFinishedArray;
@property(nonatomic,strong)NSMutableArray*unfinishedVocabularyArray;

@end

@implementation HomeViewController

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavi];
    [self setUpUpContentView];
    [self writeUserAccountPlistToSandBox];
    NSLog(@"%@",NSHomeDirectory());
}
-(void)viewWillAppear:(BOOL)animated
{
    [self loadData];
    [self loadDisplay];
}
-(void)writeUserAccountPlistToSandBox
{
    NSArray *storeFilePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [storeFilePath objectAtIndex:0];
    NSString *plistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"UserAccount.plist"];
    NSFileManager *file = [NSFileManager defaultManager];
    if ([file fileExistsAtPath:plistPath])
    {
        NSLog(@"exists");
    }
    else //若沙盒中没有
    {
        NSError *error;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"UserAccount" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath:plistPath error:&error];
    }
}
-(void)loadData
{
    NSLog(@"%s",__func__);
    NSArray *UserAccountPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [UserAccountPath objectAtIndex:0];
    NSString*plistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"UserAccount.plist"];
    NSDictionary*userAccountDict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    
    NSInteger DailyTaskCount = [[userAccountDict valueForKey:@"DailyTaskCount"] intValue];
    NSString*unfinishedPlistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"Unfinished.plist"];
    _unFinishedArray = [NSMutableArray arrayWithContentsOfFile:unfinishedPlistPath];
    
    NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:@"Words" ofType:@"xml"];
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLFile:xmlFilePath];
    if (!_unfinishedVocabularyArray) {
        _unfinishedVocabularyArray = [xmlDoc objectForKey:@"RECORD"];
        NSString* unfinishedVocabularyArrayPath=[doucumentsDirectiory stringByAppendingPathComponent:@"UnfinishedVocabulary.plist"];
        [_unfinishedVocabularyArray writeToFile:unfinishedVocabularyArrayPath atomically:YES];
    }
    else
    {
        NSString* unfinishedVocabularyArrayPath=[doucumentsDirectiory stringByAppendingPathComponent:@"UnfinishedVocabulary.plist"];
        _unfinishedVocabularyArray = [NSMutableArray arrayWithContentsOfFile:unfinishedVocabularyArrayPath];
    }
    //获取上一次的dateString
    NSString * finishCreateDateString = [userAccountDict valueForKey:@"FinishCreateDate"];
    
    //launch的dateString
    NSDate * launchDate = [NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    
    //比较两个string是否一样
    NSString * launchDateString=[dateformatter stringFromDate:launchDate];
    NSLog(@"%@",launchDateString);
    
    if (!_unFinishedArray)
    {
        _unFinishedArray = [[NSMutableArray alloc]init];
        NSRange range = NSMakeRange(0, DailyTaskCount);
        _unFinishedArray = [[_unfinishedVocabularyArray subarrayWithRange:range] mutableCopy];
        NSString*unfinishedPlistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"Unfinished.plist"];
        [userAccountDict setValue:launchDateString forKey:@"FinishCreateDate"];
        [userAccountDict writeToFile:plistPath atomically:YES];
        [_unFinishedArray writeToFile:unfinishedPlistPath atomically:YES];
    }
    else
    {
        if (![launchDateString isEqualToString:finishCreateDateString])
        {
            NSRange range = NSMakeRange(0, DailyTaskCount);
            _unFinishedArray = [[_unfinishedVocabularyArray subarrayWithRange:range] mutableCopy];
            NSString*unfinishedPlistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"Unfinished.plist"];
            [userAccountDict setValue:launchDateString forKey:@"FinishCreateDate"];
            [userAccountDict writeToFile:plistPath atomically:YES];
            [_unFinishedArray writeToFile:unfinishedPlistPath atomically:YES];
        }
        else
        {
            NSString*unfinishedPlistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"Unfinished.plist"];
            _unFinishedArray = [NSMutableArray arrayWithContentsOfFile:unfinishedPlistPath];
        }
    }
}
-(void)loadDisplay
{
    NSLog(@"%s",__func__);
    NSArray *UserAccountPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [UserAccountPath objectAtIndex:0];
    NSString*plistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"UserAccount.plist"];
    NSDictionary*userAccountDict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    NSInteger DailyTaskCount = [[userAccountDict valueForKey:@"DailyTaskCount"] intValue];
    NSString*unfinishedPlistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"Unfinished.plist"];
    _unFinishedArray = [NSMutableArray arrayWithContentsOfFile:unfinishedPlistPath];
    
    [_totalDaysBtn setTitle:[NSString stringWithFormat:@"%@",[userAccountDict valueForKey:@"TotalDays"]] forState:UIControlStateNormal];
    [_finishedBtn setTitle:[NSString stringWithFormat:@"%lu",DailyTaskCount-_unFinishedArray.count] forState:UIControlStateNormal];
    NSLog(@"%lu",DailyTaskCount-_unFinishedArray.count);
    [_TodayBtn setTitle:[NSString stringWithFormat:@"%@",[userAccountDict valueForKey:@"DailyTaskCount"]] forState:UIControlStateNormal];
    [_historyBtn setTitle:[NSString stringWithFormat:@"%@",[userAccountDict valueForKey:@"TotalDays"]] forState:UIControlStateNormal];
    if(_unFinishedArray.count == 0){
        _goBtn.enabled = NO;
        [_goBtn setTitle:@"完成" forState:UIControlStateNormal];
    }
}
-(void)setUpUpContentView
{
    //上容器
    UIView * upContainerView = [[UIView alloc]init];
    upContainerView.backgroundColor = HJCMENUCOLOR;
    upContainerView.frame = CGRectMake(10,self.navigationController.navigationBar.bounds.size.height-30, self.view.bounds.size.width-20, 150);
    upContainerView.layer.cornerRadius = 5;
    [self.view addSubview:upContainerView];
    //分割线
    UIView * divider = [[UIView alloc]init];
    divider.frame = CGRectMake(upContainerView.width/2-20, 10, 2, upContainerView.height-20);
    divider.backgroundColor = HJCWORDCOLOR;
    [upContainerView addSubview:divider];
    //历史天数
    _totalDaysBtn = [[UIButton alloc]init];
    [_totalDaysBtn setTitle:@"12341" forState:UIControlStateNormal];
    _totalDaysBtn.titleLabel.font = [ UIFont systemFontOfSize:32];
    _totalDaysBtn.frame = CGRectMake(_totalDaysBtn.x, 30,100, 50);
    _totalDaysBtn.x=divider.x/2-_totalDaysBtn.width/2;
    [_totalDaysBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [upContainerView addSubview:_totalDaysBtn];
    
    UILabel * totalDaysWord = [[UILabel alloc]init];
    totalDaysWord.textAlignment = NSTextAlignmentCenter;
    totalDaysWord.text = @"学习天数";
    totalDaysWord.textColor = HJCWORDCOLOR;
    totalDaysWord.frame = CGRectMake(_totalDaysBtn.x, _totalDaysBtn.y+_totalDaysBtn.height, 100, 30);
    [upContainerView addSubview:totalDaysWord];
    
    //正在学习的单词书
    UIButton * presentVBtn = [[UIButton alloc]init];
    [presentVBtn setTitle:@"正在学习单词书" forState:UIControlStateNormal];
    presentVBtn.y = _totalDaysBtn.y;
    presentVBtn.width = upContainerView.width-CGRectGetMaxX(divider.frame)-20;
    presentVBtn.height = 40;
    presentVBtn.x= CGRectGetMaxX(divider.frame)+(upContainerView.width-CGRectGetMaxX(divider.frame))/2-presentVBtn.width/2;
    [upContainerView addSubview:presentVBtn];

    UIButton * presentVDesBtn = [[UIButton alloc]init];
    [presentVDesBtn setTitle:@"德语基础词汇" forState:UIControlStateNormal];
    [presentVDesBtn setTitleColor:HJCWORDCOLOR forState:UIControlStateNormal];
    presentVDesBtn.y = _totalDaysBtn.y+40;
    presentVDesBtn.width = upContainerView.width-CGRectGetMaxX(divider.frame)-20;
    presentVDesBtn.height = 40;
    presentVDesBtn.x= CGRectGetMaxX(divider.frame)+(upContainerView.width-CGRectGetMaxX(divider.frame))/2-presentVBtn.width/2;
    [upContainerView addSubview:presentVDesBtn];
    
    UIView * downContainerView = [[UIView alloc]init];
    downContainerView.frame = CGRectMake(upContainerView.x, CGRectGetMaxY(upContainerView.frame)+30, upContainerView.width, upContainerView.height);
    downContainerView.backgroundColor = upContainerView.backgroundColor;
    downContainerView.layer.cornerRadius = 5;
    [self.view addSubview:downContainerView];
    
    //历史学习数
    _historyBtn = [[UIButton alloc]init];
    [_historyBtn setTitle:@"999" forState:UIControlStateNormal];
    _historyBtn.titleLabel.font = [ UIFont systemFontOfSize:32 weight:5];
    _historyBtn.frame = CGRectMake(30, 30,80, 50);
    _historyBtn.layer.cornerRadius = 5;
    [_historyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downContainerView addSubview:_historyBtn];
    
    UILabel * historyBtnWords = [[UILabel alloc]init];
    historyBtnWords.textAlignment = NSTextAlignmentCenter;
    historyBtnWords.text = @"历史学习";
    historyBtnWords.textColor = HJCWORDCOLOR;
    historyBtnWords.frame = CGRectMake(_historyBtn.x, _historyBtn.y+_historyBtn.height, 80, 30);
    [downContainerView addSubview:historyBtnWords];
    
    //今日任务
    _TodayBtn = [[UIButton alloc]init];
    [_TodayBtn setTitle:@"100" forState:UIControlStateNormal];
    _TodayBtn.titleLabel.font = [ UIFont systemFontOfSize:32 weight:5];
    _TodayBtn.frame = CGRectMake(upContainerView.width*0.5-40, 30,80, 50);
    _TodayBtn.layer.cornerRadius = 5;
    [_TodayBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downContainerView addSubview:_TodayBtn];
    
    UILabel * TodayBtnWords = [[UILabel alloc]init];
    TodayBtnWords.textAlignment = NSTextAlignmentCenter;
    TodayBtnWords.text = @"今日计划";
    TodayBtnWords.textColor = HJCWORDCOLOR;
    TodayBtnWords.frame = CGRectMake(_TodayBtn.x, _TodayBtn.y+_TodayBtn.height, 80, 30);
    [downContainerView addSubview:TodayBtnWords];
    
    //今日完成数
    _finishedBtn = [[UIButton alloc]init];
    [_finishedBtn setTitle:@"100" forState:UIControlStateNormal];
    _finishedBtn.titleLabel.font = [ UIFont systemFontOfSize:32 weight:5];
    [_finishedBtn setTitleColor:HJCWORDCOLOR forState:UIControlStateNormal];
    _finishedBtn.frame = CGRectMake(downContainerView.width-30-80, 30,80, 50);
    _finishedBtn.layer.cornerRadius = 5;
    [downContainerView addSubview:_finishedBtn];
    
    UILabel * finishedBtnWords = [[UILabel alloc]init];
    finishedBtnWords.textAlignment = NSTextAlignmentCenter;
    finishedBtnWords.text = @"今日完成";
    finishedBtnWords.textColor = HJCWORDCOLOR;
    finishedBtnWords.frame = CGRectMake(_finishedBtn.x, _finishedBtn.y+_finishedBtn.height, 80, 30);
    [downContainerView addSubview:finishedBtnWords];
    
    //GO
    _goBtn = [[UIButton alloc]init];
    _goBtn.backgroundColor = HJCWORDCOLOR;
    _goBtn.frame = CGRectMake(self.view.width/2-40,(CGRectGetMaxY(downContainerView.frame)+(self.view.height-CGRectGetMaxY(downContainerView.frame))/2)-80, 80, 80);
    _goBtn.layer.cornerRadius = 40;
    [_goBtn setTitle:@"GO" forState:UIControlStateNormal];
    [_goBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_goBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    _goBtn.titleLabel.font = [UIFont systemFontOfSize:30];
    [_goBtn addTarget:self action:@selector(goToStudy) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_goBtn];
    
}
-(void)goToStudy
{
    StudyModeViewController  * studyMode = [[StudyModeViewController alloc]init];
    [self.navigationController pushViewController:studyMode animated:YES];
}
-(void)setUpNavi
{
    self.view.backgroundColor = HJCBACKGROUNDCOLOR;
    [self.navigationItem setTitle:@"今日计划"];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:HJCWORDCOLOR}];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(moveToSettings)];
    UIBarButtonItem * leftBarBtn = self.navigationItem.leftBarButtonItem;
    leftBarBtn.tintColor = HJCWORDCOLOR;
}
-(void)moveToSettings
{
    [self.sideMenuViewController presentLeftMenuViewController];
}
@end
