//
//  STCountView.m
//  DongJie
//
//  Created by yuyue on 2017/7/11.
//  Copyright © 2017年 incredibleRon. All rights reserved.
//

#import "STCountView.h"


@interface STCountView ()<UITableViewDelegate,UITableViewDataSource >

@property (strong,nonatomic)UITableView*tableView;
@property (strong,nonatomic)NSArray*tableArr;
@property (nonatomic,strong)NSMutableArray* dataSource;

@property (nonatomic ,strong)UIView *contentView ;

@property (nonatomic ,strong)UILabel *title ;

@property (nonatomic ,strong)NSString *count ;


@property (nonatomic ,assign)NSInteger selCount ;


@end


@implementation STCountView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



+ (STCountView* )showInWindowWithCount:(NSString*)count {
    
    
    STCountView *countView = [[ STCountView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [[UIApplication sharedApplication].keyWindow addSubview:countView];

    
    countView.count = count;
    
    [countView creatView];
    
    return countView;
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
        
//        self.timeArray = [NSMutableArray array];
//        self.dateArray = [NSMutableArray array];
        
        _selCount = -1;
        
    }
    return self;
}





- (void)creatView {
    
    
    _dataSource = [NSMutableArray array];
    
    for(int i=0;i<[_count integerValue];i++){
        [_dataSource addObject:[NSString stringWithFormat:@"%@",@(i+1)]];
    }
    
    
    CGFloat w = self.frame.size.width  ;
    CGFloat h = 460  ;
    CGFloat y = self.frame.size.height - h;
    CGFloat x = 0;
    
    UIView * contentView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [self addSubview:contentView];
    contentView.backgroundColor = [UIColor whiteColor];
    self.contentView = contentView;
    
    _title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, w, 43)];
    _title.backgroundColor = [UIColor whiteColor];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.textColor = [UIColor orangeColor];
    _title.text = @"选择工作时间";
    _title.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_title];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(w/2 - 80, _contentView.height - 47, 160, 40)];
    
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:0/255.f green:175/255.f blue:239/255.f alpha:1];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.contentView addSubview:btn];
    
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    
    [btn addTarget:self action:@selector(btnSelAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *line1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEM_WIDTH, 0.5)];
    line1.backgroundColor = GRAY200;
    [btn addSubview:line1];
    
    UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, SCREEM_WIDTH, 0.5)];
    line2.backgroundColor = GRAY200;
    [_title addSubview:line2];
    
    
    [self initTableView];
    
}


- (void)btnSelAction {
    
    
    if(_selCountStr != nil){
        _selCountStr([NSString stringWithFormat:@"%@",@(_selCount+1)]);
    }
    
    
    [self bgalphaTap];
}





- (void)initTableView  {
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, _contentView.width, _contentView.height - 100)];
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    [_contentView addSubview:_tableView];
    
    if([_tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_tableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
    }
    if([_tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_tableView setLayoutMargins:UIEdgeInsetsMake(0, 15, 0, 0)];
    }
    
    
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.backgroundColor = GRAYCOLOR;
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return _dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.selectionStyle = NO;
    }
    
    if(_dataSource.count <= 0){
        return cell;
    }
    
    NSString * text = _dataSource[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@次",text];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = FONT15;
    
    if(indexPath.row == _selCount){
        cell.textLabel.textColor = MAINCOLOR;
    }
    else {
        cell.textLabel.textColor = GRAY50;

    }
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    return CGRectGetHeight(cell.frame);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    _selCount = indexPath.row;
    
    [self.tableView reloadData];
    
}






@end
