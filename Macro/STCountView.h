//
//  STCountView.h
//  DongJie
//
//  Created by yuyue on 2017/7/11.
//  Copyright © 2017年 incredibleRon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STCountView : UIView


@property (nonatomic,copy)void (^selCountStr)(NSString *str);


+ (STCountView* )showInWindowWithCount:(NSString*)count ;

@end
