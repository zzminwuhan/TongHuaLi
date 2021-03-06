//
//  BaseViewController.m
//  MBDemo
//
//  Created by yuyue on 2017/4/26.
//  Copyright © 2017年 incredibleRon. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma detail 设置偏移量
    self.edgesForExtendedLayout = UIRectEdgeNone ;
    
    self.navigationController.navigationBarHidden = YES;
    
    [self reset];
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


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}



- (void)reset {
    
    
    _naviBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEM_WIDTH, 64)];
    _naviBar.backgroundColor = HEX7BC531;
    [self.view addSubview:_naviBar];
    
    
    _naviTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, SCREEM_WIDTH, 44)];
    _naviTitle.textColor = HEXFFFFFF;
    _naviTitle.font = FONT(19);
    _naviTitle.textAlignment = NSTextAlignmentCenter;
    [_naviBar addSubview:_naviTitle];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}



- (void)initBackBtn {
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 44, 44)];
    
    [btn setImage:[UIImage imageNamed:@"btn_back_w"] forState:UIControlStateNormal];
    
    [_naviBar addSubview:btn];
    
    [btn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)backBtnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}






- (void)initTitle:(NSString*)title {
    
    [self setTitleViewWithCustomView:[self titleLabelWithTitle:title]];

}


- (void)initNaviBarBtn:(NSString*)title {
    
//    [self setLeftBarWithCustomView:[self barBtnWithSEL:@selector(naviBtn)]];
//
//    [self setTitleViewWithCustomView:[self titleLabelWithTitle:title]];
    
    _naviTitle.text = title;
    
}

- (void)initPresentBarBtn:(NSString*)title {
    
    [self setLeftBarWithCustomView:[self barBtnWithSEL:@selector(presentBtn)]];
    
    [self setTitleViewWithCustomView:[self titleLabelWithTitle:title]];
}


- (UIButton*)barBtnWithSEL:(SEL)action {
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    UIImage *image = [UIImage imageNamed:@"btn_back_w"];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateHighlighted];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (UILabel *)titleLabelWithTitle:(NSString*)title {
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 160, 30)];
    label.font = [UIFont systemFontOfSize:18];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    label.textColor = [UIColor whiteColor];
    
    return label;
}


- (void)presentBtn {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)naviBtn {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



- (void)setLeftBarWithCustomView:(UIView *)customView {
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:customView];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    barButtonItem.width = -16;
    
    self.navigationItem.leftBarButtonItems = @[barButtonItem, buttonItem];
}



- (void)setTitleViewWithCustomView:(UIView *)customView {
    
    self.navigationItem.titleView = customView;
}



- (void)setRightBarWithCustomView:(UIView *)customView  {
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:customView];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    barButtonItem.width = -16;
    
    self.navigationItem.rightBarButtonItems = @[barButtonItem, buttonItem];
}






@end
