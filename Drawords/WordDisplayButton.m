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
//-(UILabel *)phonogramLabel{
//    if (!_phonogramLabel) {
//        _phonogramLabel = [[UILabel alloc]init];
//    }
//    return _phonogramLabel;
//}
-(void)layoutSubviews
{
    _soundView.frame = CGRectMake(5, 5, self.height-10, self.height-10);
    [self addSubview:_soundView];
    
    _wordLabel.frame = CGRectMake(_soundView.x+10, 5, self.width-_soundView.width, self.height-10);
    _wordLabel.font = [UIFont systemFontOfSize:25];
    _wordLabel.textColor = HJCWORDCOLOR;

//    _wordLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_wordLabel];
    
//    _phonogramLabel.x = CGRectGetMaxX(_wordLabel.frame);
//    _phonogramLabel.y = 5;
//    _phonogramLabel.width  = self.width - _phonogramLabel.x;
//    _phonogramLabel.height = self.height-10;
//    _phonogramLabel.textColor = [UIColor whiteColor];
//    [self addSubview:_phonogramLabel];
}

@end
