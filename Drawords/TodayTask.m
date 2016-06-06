//
//  TodayQuantity.m
//  Drawords
//
//  Created by hjc on 16/6/6.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "TodayTask.h"
#import "GDataXMLNode.h"

@implementation TodayTask

-(NSArray *)todayList{
    if (!_todayList) {
        NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"Words"ofType:@"xml"];
        NSString *xmlString = [NSString stringWithContentsOfFile:xmlPath encoding:NSUTF8StringEncoding error:nil];
        GDataXMLDocument *xmlDoc = [[GDataXMLDocument alloc] initWithXMLString:xmlString options:0 error:nil];
        GDataXMLElement *xmlRoot = [xmlDoc rootElement];
        _todayList = [xmlRoot children];
    }
    return _todayList;
}

@end
