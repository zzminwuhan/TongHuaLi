//
//  SinaSDK.h
//  Third3SDK
//
//  Created by yuyue on 16/9/23.
//  Copyright © 2016年 incredibleRon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SinaSDK : NSObject

@property (nonatomic,strong)void (^loginSuccess)();

@property (nonatomic,strong)void (^loginFail)();

@property (nonatomic,strong)void (^shareSuccess)();



/**
 * 微博 单例
 
 @ return 单例
 */
+ (SinaSDK *)shareSinaSDK ;

/**
 *处理微博 通过URL启动第三方应用时传递的数据
 
 *需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用
 @param url 启动第三方应用的URL
 
 */
- (void)handleOpenURL:(NSURL *)url ;

/**
 * 微博 分享
 
 */
- (void)wbShare ;

/**
 * 微博 登录
 
 */
- (void)wbLogin ;

@end
