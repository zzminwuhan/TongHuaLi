//
//  STCalendarShowView.h
//  LDCalendarView
//
//  Created by yuyue on 2017/7/11.
//  Copyright © 2017年 lidi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STCalendarShowView : UIView
+ (STCalendarShowView *)showWithFrame:(CGRect)frame StartDate:(NSString*)startDate endDate:(NSString*)endDate selArray:(NSArray*)selArray ;

@end
