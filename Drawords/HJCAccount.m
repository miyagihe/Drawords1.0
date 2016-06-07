//
//  HJCAccount.m
//  Drawords
//
//  Created by hjc on 16/6/7.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "HJCAccount.h"
#import "GDataXMLNode.h"

@implementation HJCAccount
-(NSMutableArray *)totalDaysArray
{
    return _totalDaysArray;
}
-(NSMutableArray *)leartWordsArray
{
    
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"Words"ofType:@"xml"];
    NSString *xmlString = [NSString stringWithContentsOfFile:xmlPath encoding:NSUTF8StringEncoding error:nil];
    GDataXMLDocument *xmlDoc = [[GDataXMLDocument alloc] initWithXMLString:xmlString options:0 error:nil];
    GDataXMLElement *xmlRoot = [xmlDoc rootElement];
    _leartWordsArray = [[xmlRoot children] mutableCopy];
    return _leartWordsArray;
}
-(NSMutableArray *)masterdWordsArray
{
    return _masterdWordsArray;
}
@end
