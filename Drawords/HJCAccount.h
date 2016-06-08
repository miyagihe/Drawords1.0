//
//  HJCAccount.h
//  Drawords
//
//  Created by hjc on 16/6/7.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJCAccount : NSObject
@property(nonatomic,strong)NSMutableArray * totalDaysArray;
@property(nonatomic,strong)NSMutableArray * historyWordsArray;
@property(nonatomic,strong)NSMutableArray * todayWordsArray;
@property(nonatomic,strong)NSMutableArray * finishedWordsArray;
@property(nonatomic,strong)NSMutableDictionary * presentDictionary;
@property(nonatomic,strong)NSString * presentVName;
@end
