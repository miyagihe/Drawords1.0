//
//  SuggestionViewController.m
//  Drawords
//
//  Created by hjc on 16/6/1.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "SuggestionViewController.h"
#import "Consistant.h"

@interface SuggestionViewController ()
@property(nonatomic,strong)UITextView * textView;

@end

@implementation SuggestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavi];
    self.view.backgroundColor = HJCBACKGROUNDCOLOR;
    
    _textView = [[UITextView alloc]init];
    _textView.frame = CGRectMake(10, self.navigationController.navigationBar.bounds.size.height+20,
                                self.view.bounds.size.width-20,self.view.bounds.size.height/2-100);
    _textView.backgroundColor = HJCMENUCOLOR;
    [self.view addSubview:_textView];
    
    [_textView becomeFirstResponder];
    
    _textView.keyboardType = UIKeyboardTypeNamePhonePad;
    _textView.textColor = HJCWORDCOLOR;
    _textView.font = [UIFont systemFontOfSize:19];
    [_textView setTextAlignment:NSTextAlignmentNatural];
    _textView.alwaysBounceVertical = YES;
    _textView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIButton * sendbtn = [[UIButton alloc]init];
    [sendbtn setTitle:@"发送" forState:UIControlStateNormal];
    [sendbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendbtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    sendbtn.backgroundColor = HJCWORDCOLOR;
    sendbtn.frame = CGRectMake(self.view.bounds.size.width/2-50, self.view.bounds.size.height/2-20, 100, 40);
    [sendbtn addTarget:self action:@selector(sendSuggestion) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:sendbtn];
    
}
-(void)sendSuggestion
{

    NSLog(@"%s,%@",__func__,_textView.text);
    _textView.text = @"";
}
-(void)addGesture
{
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
    
    [self.view addGestureRecognizer:pan];
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
    
}

-(void)hideKeyboard
{
    [_textView resignFirstResponder];
}
-(void)viewWillDisappear:(BOOL)animated
{
    
    [_textView resignFirstResponder];
    _textView = nil;
}
-(void)setUpNavi
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.view.backgroundColor  = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(BckToSettings)];
    self.navigationController.navigationBar.barTintColor = HJCBACKGROUNDCOLOR;
    self.navigationItem.leftBarButtonItem.tintColor = HJCWORDCOLOR;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    
    [self.navigationItem setTitle:@"反馈建议"];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:HJCWORDCOLOR}];

}

-(void)BckToSettings
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
