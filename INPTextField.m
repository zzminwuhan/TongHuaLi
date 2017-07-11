//
//  INPTextField.m
//  TongHuaLi
//
//  Created by 李加建 on 2017/7/11.
//  Copyright © 2017年 incredibleRon. All rights reserved.
//

#import "INPTextField.h"

@implementation INPTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame  placeholder:(NSString*)placeholder leftImgName:(NSString*)imgName {
    
    self = [self initWithFrame:frame];
    
    [self setValue:HEXBBBBBB forKeyPath:@"_placeholderLabel.textColor"];
    
    self.font = FONT16;
    
    self.placeholder = placeholder;
    
    [self creatImageWithName:imgName];
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.height/16;
    self.layer.borderColor = HEX7BC531.CGColor;
    self.layer.borderWidth = 1;
    
    return self;
}



- (void)creatImageWithName:(NSString*)imgName {
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.height, self.height)];
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    btn.userInteractionEnabled = NO;
    self.leftView = btn;
    self.leftViewMode = UITextFieldViewModeAlways;
}




@end
