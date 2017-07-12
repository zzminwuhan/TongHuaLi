//
//  RegViewController.m
//  TongHuaLi
//
//  Created by 李加建 on 2017/7/11.
//  Copyright © 2017年 incredibleRon. All rights reserved.
//

#import "RegViewController.h"

#import "INPTextField.h"

#import "AuthViewController.h"

@interface RegViewController ()

@property (nonatomic ,strong)INPTextField *phone;

@property (nonatomic ,strong)INPTextField *password;

@property (nonatomic ,strong)INPTextField *passwordA;

@property (nonatomic ,strong)INPTextField *code;

@end

@implementation RegViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNaviBarBtn:@"注册"];
    [self initBackBtn];
    
    
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
    
    
    CGRect codef = CGRectMake(x, _phone.bottom + x, SCREEM_WIDTH - 2*x, h);
    _code = [[INPTextField alloc]initWithFrame:codef placeholder:@"输入验证码" leftImgName:@"img_code"];
    _code.secureTextEntry = YES;
    [self.view addSubview:_code];
    
    
    CGRect passwordf = CGRectMake(x, _code.bottom + x, SCREEM_WIDTH - 2*x, h);
    _password = [[INPTextField alloc]initWithFrame:passwordf placeholder:@"6~8位密码" leftImgName:@"img_password"];
    _password.secureTextEntry = YES;
    [self.view addSubview:_password];
    
    
    CGRect passwordAf = CGRectMake(x, _password.bottom + x, SCREEM_WIDTH - 2*x, h);
    _passwordA = [[INPTextField alloc]initWithFrame:passwordAf placeholder:@"确认密码" leftImgName:@"img_password"];
    _passwordA.secureTextEntry = YES;
    [self.view addSubview:_passwordA];
    
    CGFloat y2 =  RECTPX(87);
    
    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(x, _passwordA.bottom + (y2 - 30)/2, SCREEM_WIDTH - 2*x, 30)];
    [btn3 setImage:[UIImage imageNamed:@"img_reg"] forState:UIControlStateNormal];
    
    [btn3 setAttributedTitle:[self setTip] forState:UIControlStateNormal];
    btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft ;
    [btn3 setImageEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 0)];
    [btn3 setTitleEdgeInsets:UIEdgeInsetsMake(0, 8, 0, 0)];
    
    [self.view addSubview:btn3];
    
    CGFloat h2 = RECTPX(81);
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(x, _passwordA.bottom + y2 +30, SCREEM_WIDTH - 2*x, h2)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = btn.height/16;
    btn.layer.borderColor = HEX7BC531.CGColor;
    btn.layer.borderWidth = 1;
    btn.backgroundColor = HEX7BC531;
    [btn setTitle:@"立即注册" forState:UIControlStateNormal];
    btn.titleLabel.font = FONT16;
    [btn setTitleColor:HEXFFFFFF forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(regBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)regBtnAction {
    
    AuthViewController *nextVC = [[AuthViewController alloc]init];
    [self.navigationController pushViewController:nextVC animated:YES];
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

@end
