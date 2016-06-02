//
//  HJCButton.m
//  Drawords
//
//  Created by hjc on 16/6/2.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "HJCButton.h"
#import "UIView+Extension.h"

@implementation HJCButton

-(UILabel *)quantity
{
    if (!_quantity) {
        _quantity = [[UILabel alloc]init];
    }
    return _quantity;
}
-(UILabel *)Qdescription
{
    if (!_Qdescription) {
        _Qdescription = [[UILabel alloc]init];
    }
    return _Qdescription;
}

-(void)layoutSubviews
{
    _quantity.frame= CGRectMake(0, 0, self.width*0.4, self.height);
    [self addSubview:_quantity];
    
    _Qdescription.frame = CGRectMake(_quantity.width, 0, self.width-_quantity.width, self.height);
    [self addSubview:_Qdescription];
}
@end
