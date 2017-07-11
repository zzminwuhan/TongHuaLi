//
//  UIView+Utils.m
//  LanJiazai
//
//  Created by yuyue on 16-7-19.
//  Copyright (c) 2016年 incredibleRon. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)



- (void)setTop:(CGFloat)top {
    
    
    
}

- (void)setBottom:(CGFloat)bottom {
    
}


- (void)setLeft:(CGFloat)left {
    
}


- (void)setRight:(CGFloat)right {
    
}

- (void)setWidth:(CGFloat)width {
    
}


- (void)setHeight:(CGFloat)height {
    
}


- (CGFloat)top {
    
    return CGRectGetMinY(self.frame);
}

- (CGFloat)bottom {
    
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)left {
    
    return CGRectGetMinX(self.frame);
}


- (CGFloat)right {
    
    return CGRectGetMaxX(self.frame);
}


- (CGFloat)width {
    
    return CGRectGetWidth(self.frame);
}

- (CGFloat)height {
    
    return CGRectGetHeight(self.frame);
}



- (void)setCornerRadius:(CGFloat)cornerRadius {
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius  = cornerRadius ;
}




- (void)sizeThatFit {
    
    CGSize size = [self sizeThatFits:CGSizeMake(CGRectGetWidth(self.frame), 0)];
    
    self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), size.height);
    
}



@end
