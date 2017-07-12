//
//  AuthTextView.m
//  TongHuaLi
//
//  Created by 李加建 on 2017/7/11.
//  Copyright © 2017年 incredibleRon. All rights reserved.
//

#import "AuthTextView.h"

@implementation AuthTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (instancetype)initWithFrame:(CGRect)frame  title:(NSString*)title {
    
    self = [self initWithFrame:frame];

    self.title.text = title;
    
    return self;
}




- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    CGFloat x = RECTPX(21);
    
    _title = [[UILabel alloc]initWithFrame:CGRectMake(x, 0, self.width - 2*x, self.height)];
    _title.font = FONT15;
    _title.textColor = HEX646464;
    [self addSubview:_title];
    
    _detail = [[UILabel alloc]initWithFrame:CGRectMake(x, 0, self.width - 2*x, self.height)];
    _detail.font = FONT15;
    _title.textColor = HEX494949;
    [self addSubview:_detail];
    _detail.textAlignment = NSTextAlignmentRight;
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.height/16;
    self.layer.borderColor = HEXBBBBBB.CGColor;
    self.layer.borderWidth = 1;
    
    self.backgroundColor = [UIColor whiteColor];
    
    return self;
}


@end
