//
//  STCalendarView.m
//  LDCalendarView
//
//  Created by yuyue on 2017/4/25.
//  Copyright © 2017年 lidi. All rights reserved.
//

#import "STCalendarView.h"

#import "NSDate+STCalendar.h"

//行 列 每小格宽度 格子总数
static const NSInteger kRow = 7;
//static const NSInteger kCol = 7;




@interface STCalendarView ()

@property (nonatomic ,strong)UIView *contentView ;
@property (nonatomic ,strong)UILabel *title ;
@property (nonatomic ,strong)UILabel *dateTitle ;

@property (nonatomic ,strong)UIView *dateView ;

@property (nonatomic, assign)NSInteger month;
@property (nonatomic, assign)NSInteger year;


@property (nonatomic,strong)NSDate *startDate;
@property (nonatomic,strong)NSDate *endDate;

@property (nonatomic,strong)NSMutableArray *timeArray;
@property (nonatomic,strong)NSMutableArray *dateArray;

@end


@implementation STCalendarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



+ (STCalendarView *)showWithStartDate:(NSString*)startDate endDate:(NSString*)endDate {
    
    STCalendarView *calendarView = [[STCalendarView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [[UIApplication sharedApplication].keyWindow addSubview:calendarView];
    
    [calendarView setStartDateWithStr:startDate];
    [calendarView setEndDateWithStr:endDate];
    
    
    [calendarView creatView];
    
    return calendarView;
}



- (void)bgalphaTap {
    
    [self removeFromSuperview];
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *bgAlphaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        bgAlphaView.alpha = 0.5;
        bgAlphaView.backgroundColor = [UIColor blackColor];
        [self addSubview:bgAlphaView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bgalphaTap)];
        
        [bgAlphaView addGestureRecognizer:tap];
        
        self.timeArray = [NSMutableArray array];
        self.dateArray = [NSMutableArray array];

    }
    return self;
}




- (void)creatView {
    
    CGFloat w = self.frame.size.width  ;
    CGFloat h = 460  ;
    CGFloat y = self.frame.size.height - h;
    CGFloat x = 0;
    
    UIView * contentView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [self addSubview:contentView];
    contentView.backgroundColor = [UIColor whiteColor];
    self.contentView = contentView;
    
    _title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, w, 40)];
    _title.backgroundColor = [UIColor whiteColor];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.textColor = [UIColor orangeColor];
    _title.text = @"选择工作时间";
    _title.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_title];
    
    
    _dateTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_title.frame), w, 44)];
    _dateTitle.backgroundColor = [UIColor whiteColor];
    _dateTitle.textAlignment = NSTextAlignmentCenter;
    _dateTitle.textColor = [UIColor blackColor];
    _dateTitle.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_dateTitle];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, w, 0.5)];
    line.backgroundColor = [UIColor colorWithRed:200/255.f green:200/255.f blue:200/255.f alpha:1];
    [self.contentView addSubview:line];
    
    
    UIButton *left = [[UIButton alloc]initWithFrame:CGRectMake(60, CGRectGetMinY(_dateTitle.frame), 44, 44)];
    [left setImage:[UIImage imageNamed:@"com_arrows_right"] forState:UIControlStateNormal];
    [self.contentView addSubview:left];
    left.transform = CGAffineTransformMakeRotation(M_PI);
    
    [left addTarget:self action:@selector(leftSwitch) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *right = [[UIButton alloc]initWithFrame:CGRectMake(w - 60 - 44, CGRectGetMinY(_dateTitle.frame), 44, 44)];
    [right setImage:[UIImage imageNamed:@"com_arrows_right"] forState:UIControlStateNormal];
    [self.contentView addSubview:right];
    [right addTarget:self action:@selector(rightSwitch) forControlEvents:UIControlEventTouchUpInside];
    
    
    _dateView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_dateTitle.frame), w, 44*7)];
    _dateView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_dateView];
    
    _dateView.backgroundColor = [UIColor colorWithRed:248/255.f green:247/255.f blue:255/255.f alpha:1];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(w/2 - 80, CGRectGetMaxY(_dateView.frame)+10, 160, 40)];
    
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:0/255.f green:175/255.f blue:239/255.f alpha:1];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.contentView addSubview:btn];
    
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    
    [btn addTarget:self action:@selector(btnSelAction) forControlEvents:UIControlEventTouchUpInside];
    
    
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


- (void)leftSwitch{
    //左
    if (self.month > 1) {
        self.month = self.month - 1;
    }else {
        self.month = 12;
        self.year = self.year - 1;
    }
    

    
 
    [self showDataView];
}

- (void)rightSwitch {
    
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
    
    CGFloat wid = self.contentView.frame.size.width / kRow ;
    
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
            
            [btn addTarget:self action:@selector(dateSelectAction:) forControlEvents:UIControlEventTouchUpInside];
            
            
            UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake((wid-30)/2, (hei-30)/2, 30, 30)];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:15];
            label.tag = 3333;
            [btn addSubview:label];
            label.layer.masksToBounds = YES;
            label.layer.cornerRadius = 15;
            
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
         
        
            label.backgroundColor = NOR_COLOR;
            label.textColor = [UIColor lightGrayColor];
            btn.selected = NO;
            
        }
    }
    
    
}

- (void)dateSelectAction:(UIButton*)btn {
    
    //字符串转换为日期
//    //实例化一个NSDateFormatter对象
//    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
//    //设定时间格式,这里可以设置成自己需要的格式
//    [dateFormat setDateFormat:@"yyyy-MM-dd"];
//    NSDate *firstDay =[dateFormat dateFromString:[NSString stringWithFormat:@"%@-%@-%@",@(self.year),@(self.month),@(1)]];
//    
//    NSInteger startDayIndex = [NSDate acquireWeekDayFromDate:firstDay] - 1;

    NSInteger i = btn.tag - 440000;
    
    NSDate *nextDate = _dateArray[i]; //[firstDay nextDateWithDay:i-startDayIndex];
    
    BOOL isIn = [nextDate isInStartDate:_startDate endDate:_endDate];
    
    UILabel *label = (UILabel*)[btn viewWithTag:3333];


    if(isIn){
        
        
        if(btn.selected == NO){
            
            [_timeArray addObject:nextDate];
            btn.selected = YES;
            label.backgroundColor = SEL_COLOR;
            label.textColor = [UIColor whiteColor];

        }
        else {
            
            btn.selected = NO;
            label.backgroundColor = NOR_COLOR;
            label.textColor = [UIColor blackColor];

            [self removeDate:nextDate];
        }
        
        
        
        NSString *dateStr = [nextDate acquireDateString];
        
        NSLog(@"datestr = %@",dateStr);

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



- (void)btnSelAction {
    
    
    if(_selDateArray != nil){
        _selDateArray(_timeArray);
    }
    
    
    [self bgalphaTap];
}




@end
