//
//  AuthViewController.m
//  TongHuaLi
//
//  Created by 李加建 on 2017/7/11.
//  Copyright © 2017年 incredibleRon. All rights reserved.
//

#import "AuthViewController.h"

#import "AuthTextView.h"

@interface AuthViewController ()

@property (nonatomic ,strong)AuthTextView *school;
@property (nonatomic ,strong)AuthTextView *name;
@property (nonatomic ,strong)AuthTextView *sex;
@property (nonatomic ,strong)AuthTextView *both;
@property (nonatomic ,strong)AuthTextView *banji;
@property (nonatomic ,strong)AuthTextView *teacher;

@end

@implementation AuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNaviBarBtn:@"确认信息"];
    [self initBackBtn];
    
    self.view.backgroundColor = GRAYCOLOR;
    
    [self creatView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)creatView {
    
    CGFloat x = RECTPX(25);
    CGFloat h = RECTPX(85);
    CGFloat y = RECTPX(15);
    
    _school = [[AuthTextView alloc]initWithFrame:CGRectMake(x, 69 + y, SCREEM_WIDTH -2*x, h) title:@"幼儿园名称"];
    
    [self.view addSubview:_school];
    
    _name = [[AuthTextView alloc]initWithFrame:CGRectMake(x, _school.bottom + y, SCREEM_WIDTH -2*x, h) title:@"学生姓名"];
    
    [self.view addSubview:_name];


    _sex = [[AuthTextView alloc]initWithFrame:CGRectMake(x, _name.bottom + y, SCREEM_WIDTH -2*x, h) title:@"性别"];
    
    [self.view addSubview:_sex];

    _both = [[AuthTextView alloc]initWithFrame:CGRectMake(x, _sex.bottom + y, SCREEM_WIDTH -2*x, h) title:@"出生年月"];
    
    [self.view addSubview:_both];
    
    _banji = [[AuthTextView alloc]initWithFrame:CGRectMake(x, _both.bottom + y, SCREEM_WIDTH -2*x, h) title:@"班级"];
    
    [self.view addSubview:_banji];

    _teacher = [[AuthTextView alloc]initWithFrame:CGRectMake(x, _banji.bottom + y, SCREEM_WIDTH -2*x, h) title:@"班主任"];
    
    [self.view addSubview:_teacher];
    
    
    
    CGFloat y2 =  RECTPX(87);
    
    
    CGFloat h2 = RECTPX(81);
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(x, _teacher.bottom + y2+30, SCREEM_WIDTH - 2*x, h2)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = btn.height/16;
    btn.layer.borderColor = HEX7BC531.CGColor;
    btn.layer.borderWidth = 1;
    btn.backgroundColor = HEX7BC531;
    [btn setTitle:@"确认" forState:UIControlStateNormal];
    btn.titleLabel.font = FONT16;
    [btn setTitleColor:HEXFFFFFF forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(regBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
}



- (void)regBtnAction {
    
    
}

@end
