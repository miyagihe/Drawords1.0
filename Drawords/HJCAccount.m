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
    return _todayWordsArray;
}
-(NSMutableArray *)finishedWordsArray
{
    if(!_finishedWordsArray)
    {
        _finishedWordsArray = [[NSMutableArray alloc]init];
    }
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
