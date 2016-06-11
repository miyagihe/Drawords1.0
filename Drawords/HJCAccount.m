//
//  HJCAccount.m
//  Drawords
//
//  Created by hjc on 16/6/7.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "HJCAccount.h"
#import "XMLDictionary.h"

@implementation HJCAccount
-(NSMutableArray *)totalDaysArray
{
    if (!_totalDaysArray) {
        _totalDaysArray = [[NSMutableArray alloc]init];
    }
    return _totalDaysArray;
}
-(NSMutableArray *)historyWordsArray
{
    if (!_historyWordsArray) {
        _historyWordsArray = [[NSMutableArray alloc]init];
    }
    return _historyWordsArray;
}
-(NSMutableArray *)todayWordsArray{
    if (!_todayWordsArray) {
        _todayWordsArray = [[NSMutableArray alloc]init];
    }
    _todayWordsArray[0] = @[@1];

    return _todayWordsArray;
}
-(NSMutableArray *)finishedWordsArray
{
//    if(!_finishedWordsArray)
////    {
////        //获取userAccountDict
//        NSArray *UserAccountPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
//        NSString *doucumentsDirectiory = [UserAccountPath objectAtIndex:0];
//        NSString*plistPath =[doucumentsDirectiory stringByAppendingPathComponent:@"UserAccount.plist"];
//        NSDictionary*userAccountDict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
//        
//        //获取上一次的dateString
//        NSString * finishCreateDateString = [userAccountDict valueForKey:@"FinishCreateDate"];
//        
//        //launch的dateString
//        NSDate * launchDate = [NSDate date];
//        NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
//        [dateformatter setDateFormat:@"yyyy-MM-dd"];
//        
//        //比较两个string是否一样
//        NSString * launchDateString=[dateformatter stringFromDate:launchDate];
//    
//        _finishedWordsArray = [NSMutableArray arrayWithCapacity:1000];
//  
//        _finishedWordsArray[0] = @[@1];
    
  
//    
//    
//        //如果不一样就重新创建数组
//       if(![finishCreateDateString isEqualToString:launchDateString])
//       {
//           [_finishedWordsArray removeAllObjects];
//           [userAccountDict setValue:launchDateString forKey:@"FinishCreateDate"];
//           [userAccountDict writeToFile:plistPath atomically:YES];
//       }
////    }
    return _finishedWordsArray;
}
-(NSMutableDictionary*)presentDictionary
{
    if (!_presentDictionary) {
        _presentDictionary = [[NSMutableDictionary alloc]init];
        NSString *presentDictPath = [[NSBundle mainBundle] pathForResource:@"Words" ofType:@"xml"];
        _presentDictionary = [[NSMutableDictionary dictionaryWithXMLFile:presentDictPath] mutableCopy];
    }
    return _presentDictionary;
}
@end
