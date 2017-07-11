//
//  STCalendarShowView.m
//  LDCalendarView
//
//  Created by yuyue on 2017/7/11.
//  Copyright © 2017年 lidi. All rights reserved.
//

#import "STCalendarShowView.h"

#import "NSDate+STCalendar.h"

//行 列 每小格宽度 格子总数
static const NSInteger kRow = 7;


@interface STCalendarShowView ()

@property (nonatomic ,strong)UILabel *dateTitle ;

@property (nonatomic ,strong)UIView *dateView ;

@property (nonatomic, assign)NSInteger month;
@property (nonatomic, assign)NSInteger year;


@property (nonatomic,strong)NSDate *startDate;
@property (nonatomic,strong)NSDate *endDate;

@property (nonatomic,strong)NSMutableArray *timeArray;
@property (nonatomic,strong)NSMutableArray *dateArray;


@end

@implementation STCalendarShowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (STCalendarShowView *)showWithFrame:(CGRect)frame StartDate:(NSString*)startDate endDate:(NSString*)endDate selArray:(NSArray*)selArray {
    
    STCalendarShowView *calendarView = [[STCalendarShowView alloc]initWithFrame:frame];
//    [[UIApplication sharedApplication].keyWindow addSubview:calendarView];
    
    [calendarView setStartDateWithStr:startDate];
    [calendarView setEndDateWithStr:endDate];
    
    for(int i=0;i<selArray.count;i++){
        
        [calendarView.timeArray addObject:[NSDate acquireDateWithStr:selArray[i]]];
    }

    
    [calendarView creatView];
    
    
    return calendarView;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor redColor];
    
    self.timeArray = [NSMutableArray array];
    self.dateArray = [NSMutableArray array];
    
    return self;
}



- (void)creatView {
    
    CGFloat w = self.frame.size.width  ;
    
    
    _dateTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, w, 40)];
    _dateTitle.backgroundColor = [UIColor colorWithRed:0 green:175/255.f blue:239/255.f alpha:1];
    _dateTitle.textAlignment = NSTextAlignmentCenter;
    _dateTitle.textColor = [UIColor whiteColor];
    _dateTitle.font = [UIFont systemFontOfSize:16];
    [self addSubview:_dateTitle];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, 50, 40)];
    btn.backgroundColor = [UIColor whiteColor];
    [self addSubview:btn];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(w - 60, 0, 50, 40)];
    btn2.backgroundColor = [UIColor whiteColor];
    [self addSubview:btn2];
    [btn2 addTarget:self action:@selector(btnAction2) forControlEvents:UIControlEventTouchUpInside];
    
    _dateView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, w, 44*7)];
    _dateView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_dateView];
    
    [self setToday];
    
    [self showDataView];
}



- (void)setToday {
    
    NSDate *currentDate = [NSDate date];
    NSInteger tYear = currentDate.year;
    NSInteger tMonth = currentDate.month;
    //    NSInteger tDay = currentDate.day;
    self.year = tYear;
    self.month = tMonth;
    
    
}


- (void)btnAction {
    
    //左
    if (self.month > 1) {
        self.month = self.month - 1;
    }else {
        self.month = 12;
        self.year = self.year - 1;
    }

    
    [self showDataView];
}


- (void)btnAction2 {
 
    if (self.month < 12) {
        self.month = self.month + 1;
    }else {
        self.month = 1;
        self.year = self.year + 1;
    }
    
    [self showDataView];
}



- (void)showDataView {
    
    _dateTitle.text = [NSString stringWithFormat:@"%@年 %@月",@(self.year),@(self.month)];
    
    NSArray *tmparr = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    
    CGFloat wid = self.frame.size.width / kRow ;
    
    CGFloat hei = 44;
    
    for(int i=0;i<tmparr.count;i++){
        
        UILabel *label = (UILabel*)[_dateView viewWithTag:330000+i];
        
        if(label == nil){
            
            label = [[UILabel alloc]initWithFrame:CGRectMake(wid*i, 0, wid, hei)];
            label.tag = 330000+i;
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:15];
            label.textColor = [UIColor blackColor];
            [_dateView addSubview:label];
        }
        
        label.text = tmparr[i];
    }
    
    //字符串转换为日期
    //实例化一个NSDateFormatter对象
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *firstDay =[dateFormat dateFromString:[NSString stringWithFormat:@"%@-%@-%@",@(self.year),@(self.month),@(1)]];
    
    NSInteger startDayIndex = [NSDate acquireWeekDayFromDate:firstDay] - 1;
    
    [_dateArray removeAllObjects];
    
    for(int i=0;i<42;i++){
        
        UIButton *btn = (UIButton*)[_dateView viewWithTag:440000+i];
        
        int j = i/kRow+1;
        
        if(btn == nil){
            
            btn = [[UIButton alloc]initWithFrame:CGRectMake(wid*(i%kRow), hei*j, wid, hei)];
            btn.tag = 440000+i;
            
            [_dateView addSubview:btn];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            
//            [btn addTarget:self action:@selector(dateSelectAction:) forControlEvents:UIControlEventTouchUpInside];
            
            
            UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, wid, hei)];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:15];
            label.tag = 3333;
            [btn addSubview:label];
//            label.layer.masksToBounds = YES;
//            label.layer.cornerRadius = 15;
            
        }
        btn.selected = NO;
        
        
        NSDate *nextDate = [firstDay nextDateWithDay:i-startDayIndex];
        
        BOOL isIn = [nextDate isInStartDate:_startDate endDate:_endDate];
        
        [_dateArray addObject:nextDate];
        
        UILabel *label = (UILabel*)[btn viewWithTag:3333];
        label.text = [NSString stringWithFormat:@"%@",@(nextDate.day)];
        
        if(isIn){
            
            
            BOOL isSel = [self isSelDate:nextDate];
            if(isSel == YES){
                label.backgroundColor = SEL_COLOR;
                btn.selected = YES;
                label.textColor = [UIColor whiteColor];
                
            }
            else {
                label.backgroundColor = NOR_COLOR;
                btn.selected = NO;
                label.textColor = [UIColor blackColor];
                
            }
            
        }
        else {
            
            
            label.backgroundColor = [UIColor whiteColor];
            label.textColor = [UIColor lightGrayColor];
            btn.selected = NO;
            
        }
    }

}



- (void)removeDate:(NSDate*)date {
    
    
    for(int i=0;i<_timeArray.count;i++){
        
        NSDate *dd = _timeArray[i];
        
        NSTimeInterval  T1 = [dd timeIntervalSinceDate:date];
        
        if(T1 == 0){
            
            [_timeArray removeObject:dd];
        }
    }
    
}


- (BOOL)isSelDate:(NSDate*)date {
    
    BOOL isSel = NO;
    
    for(int i=0;i<_timeArray.count;i++){
        
        NSDate *dd = _timeArray[i];
        
        NSTimeInterval  T1 = [dd timeIntervalSinceDate:date];
        
        if(T1 == 0){
            
            isSel = YES;
        }
    }
    
    return isSel;
}





- (void)setStartDateWithStr:(NSString*)str {
    
    _startDate = [NSDate acquireDateWithStr:str];
}


- (void)setEndDateWithStr:(NSString*)str {
    
    _endDate = [NSDate acquireDateWithStr:str];
}



@end
