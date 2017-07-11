//
//  UserManager.m
//  DemoBaseVC
//
//  Created by yuyue on 15-11-10.
//  Copyright (c) 2015年 incredibleRon. All rights reserved.
//

#import "UserManager.h"




static UserManager *user = nil;


@implementation UserManager



+ (UserManager *)shareInstance {
    
    static dispatch_once_t onceToken ;
    
    dispatch_once(&onceToken, ^{
        user = [[super allocWithZone:NULL] init] ;
 
        NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
        
        if(token == nil){
            token = @"";
        }
        user.token = token;
        
    }) ;
    return user ;
    
}



+ (id) allocWithZone:(struct _NSZone *)zone {
    return [UserManager shareInstance] ;
}

- (id) copyWithZone:(struct _NSZone *)zone
{
    return [UserManager shareInstance] ;
}




+ (void)loginWithDict:(NSDictionary*)dict {
    
        
    [[NSUserDefaults standardUserDefaults] setObject:dict forKey:@"userinfo"];
    
    UserManager *user = [UserManager shareInstance];
    

    user.nickname = DictStr(dict, @"nickname");
    user.favicon = DictStr(dict, @"favicon");
    user.mail = DictStr(dict, @"mail");
    user.sex = DictStr(dict, @"sex");
    
}



+ (void)quitAction {
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userinfo"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"token"];

}



+ (BOOL)isLogin {
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];

    if(token == nil){
        
        return NO;
    }
    
    return YES;
}



// 登录
+ (void)loginWithToken:(NSDictionary *)dict {
    
    NSString *token = DictStr(dict, @"token");
    
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"token"];

    UserManager *user = [UserManager shareInstance];

    user.token = token;
}

// 获取登录token
+ (NSString*)tokenID {
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    
    UserManager *user = [UserManager shareInstance];
    
    if(token == nil){
        token = @"";
    }
    user.token = token;
    
    
    
    return  token;
}






+ (BOOL)loginManagerWithVC:(UIViewController*)vc {
    
  
    
    
    
    return YES;
}


@end
