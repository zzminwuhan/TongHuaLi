//
//  STCalendarView.h
//  LDCalendarView
//
//  Created by yuyue on 2017/4/25.
//  Copyright © 2017年 lidi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STCalendarView : UIView

@property (nonatomic,copy)void (^selDateArray)(NSMutableArray *array);

+ (STCalendarView *)showWithStartDate:(NSString*)startDate endDate:(NSString*)endDate;


- (void)setStartDateWithStr:(NSString*)str ;

- (void)setEndDateWithStr:(NSString*)str ;



@end
