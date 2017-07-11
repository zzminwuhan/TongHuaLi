//
//  AuthTextView.h
//  TongHuaLi
//
//  Created by 李加建 on 2017/7/11.
//  Copyright © 2017年 incredibleRon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthTextView : UIView

@property (nonatomic ,strong)UILabel *title;
@property (nonatomic ,strong)UILabel *detail;

@property (nonatomic ,strong)UITextField *text;



- (instancetype)initWithFrame:(CGRect)frame  title:(NSString*)title ;

@end
