//
//  UserManager.h
//  DemoBaseVC
//
//  Created by yuyue on 15-11-10.
//  Copyright (c) 2015年 incredibleRon. All rights reserved.
//

#import <Foundation/Foundation.h>





@interface UserManager : NSObject


@property (nonatomic ,strong)NSString * uid;
@property (nonatomic ,strong)NSString * token;
@property (nonatomic ,strong)NSString * is_auth;
@property (nonatomic ,strong)NSString * name;
@property (nonatomic ,strong)NSString * nickname;
@property (nonatomic ,strong)NSString * favicon;
@property (nonatomic ,strong)NSString * mail;
@property (nonatomic ,strong)NSString * sex;




+ (UserManager *)shareInstance ;

+ (void)loginWithToken:(NSDictionary *)dict ;
+ (NSString*)tokenID ;

+ (void)loginWithDict:(NSDictionary*)dict ;

+ (void)quitAction ;

+ (BOOL)isLogin ;



+ (BOOL)loginManagerWithVC:(UIViewController*)vc ;


@end
