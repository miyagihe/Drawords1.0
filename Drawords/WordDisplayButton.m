//
//  WordDisplayButton.m
//  Drawords
//
//  Created by hjc on 16/6/2.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "WordDisplayButton.h"
#import "UIView+Extension.h"
#import "Consistant.h"

@implementation WordDisplayButton

-(UIImageView *)soundView
{
    if (!_soundView) {
        _soundView = [[UIImageView alloc]init];
    }
    return _soundView;
}
-(UILabel *)wordLabel
{
    if (!_wordLabel) {
        _wordLabel = [[UILabel alloc]init];
    }
    return _wordLabel;
}
-(void)layoutSubviews
{
    _soundView.frame = CGRectMake(5, 5, self.height-10, self.height-10);
    [self addSubview:_soundView];
    
    _wordLabel.frame = CGRectMake(_soundView.x+10, 5, self.width-_soundView.width, self.height-10);
    _wordLabel.font = [UIFont systemFontOfSize:25];
    _wordLabel.textColor = HJCWORDCOLOR;
    [self addSubview:_wordLabel];
}

@end
