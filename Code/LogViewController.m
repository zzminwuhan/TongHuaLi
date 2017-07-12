//
//  LogViewController.m
//  TongHuaLi
//
//  Created by 李加建 on 2017/7/11.
//  Copyright © 2017年 incredibleRon. All rights reserved.
//

#import "LogViewController.h"

#import "INPTextField.h"

#import "RegViewController.h"
#import "PWDViewController.h"

@interface LogViewController ()

@property (nonatomic ,strong)INPTextField *phone;

@property (nonatomic ,strong)INPTextField *password;


@end

@implementation LogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNaviBarBtn:@"登录"];
    
    
    [self creatView];
    
    
    [self creatBottom];
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
    
    
    
    
    UILabel *logo = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEM_HEIGHT *(266/1334.f), SCREEM_WIDTH, 70)];
    logo.textColor = HEX7BC531;
    logo.text = @"logo";
    logo.font = FONT(64);
    logo.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:logo];
    
    
    CGFloat x = RECTPX(37);
    CGFloat y = 64 + SCREEM_HEIGHT *(358/1334.f);
    CGFloat h = RECTPX(95);
    
    CGRect phonef = CGRectMake(x, y, SCREEM_WIDTH - 2*x, h);
    _phone = [[INPTextField alloc]initWithFrame:phonef placeholder:@"11位手机号码" leftImgName:@"img_phone"];
    
    
    [self.view addSubview:_phone];
    
    CGRect passwordf = CGRectMake(x, _phone.bottom + x, SCREEM_WIDTH - 2*x, h);
    _password = [[INPTextField alloc]initWithFrame:passwordf placeholder:@"6~8位密码" leftImgName:@"img_password"];
    _password.secureTextEntry = YES;
    [self.view addSubview:_password];
    
    
    CGFloat h2 = RECTPX(81);
    
    CGFloat y2 =  RECTPX(87);
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(x, _password.bottom + y2, SCREEM_WIDTH - 2*x, h2)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = btn.height/16;
    btn.layer.borderColor = HEX7BC531.CGColor;
    btn.layer.borderWidth = 1;
    btn.backgroundColor = HEX7BC531;
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    btn.titleLabel.font = FONT16;
    [btn setTitleColor:HEXFFFFFF forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(x, btn.bottom + RECTPX(22), SCREEM_WIDTH - 2*x, h2)];
    btn2.layer.masksToBounds = YES;
    btn2.layer.cornerRadius = btn2.height/16;
    btn2.layer.borderColor = HEX7BC531.CGColor;
    btn2.layer.borderWidth = 1;
    btn2.backgroundColor = HEXFFFFFF;
    [btn2 setTitle:@"游客登录" forState:UIControlStateNormal];
    btn2.titleLabel.font = FONT16;
    [btn2 setTitleColor:HEX7BC531 forState:UIControlStateNormal];
    
    [self.view addSubview:btn2];
    
    
    
    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(x, _password.bottom + (y2 - 30)/2, SCREEM_WIDTH - 2*x, 30)];
    [btn3 setImage:[UIImage imageNamed:@"img_reg"] forState:UIControlStateNormal];
    
    [btn3 setAttributedTitle:[self setTip] forState:UIControlStateNormal];
    btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft ;
    [btn3 setImageEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 0)];
    [btn3 setTitleEdgeInsets:UIEdgeInsetsMake(0, 8, 0, 0)];
    
    [self.view addSubview:btn3];
    
    
    
    UIButton *btn4 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEM_WIDTH/2 - 60, btn2.bottom , 60, 30)];
    
    [btn4 setTitle:@"忘记密码?" forState:UIControlStateNormal];
    btn4.titleLabel.font = FONT(11);
    [btn4 setTitleColor:HEX7BC531 forState:UIControlStateNormal];
    [self.view addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEM_WIDTH/2 , btn2.bottom , 60, 30)];
    
    [btn5 setTitle:@"立即注册" forState:UIControlStateNormal];
    btn5.titleLabel.font = FONT(11);
    [btn5 setTitleColor:HEX7BC531 forState:UIControlStateNormal];
    [self.view addSubview:btn5];
    
    
    UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEM_WIDTH/2-0.5, btn2.bottom+10, 1, 10)];
    line2.backgroundColor = HEX7BC531;
    [self.view addSubview:line2];
    
    
    [btn5 addTarget:self action:@selector(regBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [btn4 addTarget:self action:@selector(passwordBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [btn2 addTarget:self action:@selector(youkeAction) forControlEvents:UIControlEventTouchUpInside];
    
    [btn addTarget:self action:@selector(logBtnAction) forControlEvents:UIControlEventTouchUpInside];
}




- (void)regBtnAction {
    
    RegViewController *nextVC = [[RegViewController alloc]init];
    [self.navigationController pushViewController:nextVC animated:YES];
}


- (void)passwordBtnAction {
    
    PWDViewController *nextVC = [[PWDViewController alloc]init];
    [self.navigationController pushViewController:nextVC animated:YES];
}


- (void)logBtnAction {
    
    
}


- (void)youkeAction {
    
    
}



- (NSAttributedString *)setTip {
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]init];
    
    
    NSDictionary * attributes1 = @{NSFontAttributeName:FONT10,NSForegroundColorAttributeName:HEX333333};
    NSDictionary * attributes2 = @{NSFontAttributeName:FONT10,NSForegroundColorAttributeName:HEX7BC531};
    
    NSAttributedString *attr1 = [[NSAttributedString alloc]initWithString:@"我同意" attributes:attributes1];
    NSAttributedString *attr2 = [[NSAttributedString alloc]initWithString:@"《童话里注册协议》" attributes:attributes2];
    
    
    [attrStr appendAttributedString:attr1];
    [attrStr appendAttributedString:attr2];
    
    return attrStr;
}



- (void)creatBottom {
    
    CGFloat x = RECTPX(90);
    CGFloat y = SCREEM_HEIGHT * (1157/1334.f);
    
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(x, y, SCREEM_WIDTH - 2*x, 1)];
    line.backgroundColor = HEXBBBBBB;
    [self.view addSubview:line];
    
    
    UILabel * tip = [[UILabel alloc]initWithFrame:CGRectMake(SCREEM_WIDTH/2 - 60, y-10, 120, 20)];
    tip.font = FONT12;
    tip.text = @"使用其他账号登录";
    tip.textColor = HEX887754;
    tip.textAlignment = NSTextAlignmentCenter;
    tip.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tip];
    
    NSArray *array = @[@"btn_log_01",@"btn_log_02",@"btn_log_03"];
    
    CGFloat y2 = y + (SCREEM_HEIGHT - y - 10)/2 - 11;
    CGFloat w = (SCREEM_WIDTH - RECTPX(90)*2-44*3)/2;
    for(int i=0;i<array.count;i++){
        
        CGRect btnf = CGRectMake(w + (RECTPX(90) + 44)*i, y2, 44, 44);
        UIButton *btn = [[UIButton alloc]initWithFrame:btnf];
        
        
        [btn setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
    }
}


- (void)btnAction:(UIButton*)btn {
    
    
}




@end
