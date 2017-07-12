//
//  SinaSDK.m
//  Third3SDK
//
//  Created by yuyue on 16/9/23.
//  Copyright © 2016年 incredibleRon. All rights reserved.
//

#import "SinaSDK.h"

#import "WeiboSDK.h"

#import "SKShareText.h"

#define kRedirectURI    @"http://www.sina.com"


static SinaSDK * sinaSDK = nil;


@interface SinaSDK ()<WeiboSDKDelegate>

@property (strong, nonatomic) NSString *wbtoken;
@property (strong, nonatomic) NSString *wbCurrentUserID;
@property (strong, nonatomic) NSString *wbRefreshToken;

@end


@implementation SinaSDK




+ (SinaSDK *)shareSinaSDK {
    
    if(sinaSDK == nil){
        
        sinaSDK = [[SinaSDK alloc]init];
    }
    
    return sinaSDK ;
}


- (instancetype)init {
    
    self = [super init];
    
    [WeiboSDK registerApp:WBID];
    [WeiboSDK enableDebugMode:YES];
    
    return self;
    
}





- (void)wbLogin {
    
    
    
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kRedirectURI;
    request.scope = @"all";
    
    request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    
    [WeiboSDK sendRequest:request];
}



- (void)wbShare {
    
    
    WBAuthorizeRequest *authRequest = [WBAuthorizeRequest request];
    authRequest.redirectURI = kRedirectURI;
    authRequest.scope = @"all";
    
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:[self messageToShare] authInfo:authRequest access_token:self.wbtoken];
    request.userInfo = @{@"ShareMessageFrom": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};

    [WeiboSDK sendRequest:request];
    
}



- (WBMessageObject *)messageToShare
{
    
    WBMessageObject *message = [WBMessageObject message];
    WBWebpageObject *webpage = [WBWebpageObject object];
    
    
    webpage.objectID = @"identifier1";
    webpage.title = NSLocalizedString(SHARE_TIT, nil);
    webpage.description = [NSString stringWithFormat:NSLocalizedString(SHARE_TXT, nil), [[NSDate date] timeIntervalSince1970]];
    webpage.thumbnailData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Icon@2x" ofType:@"png"]];
    webpage.webpageUrl = @"http://sina.cn?a=1";
    message.mediaObject = webpage;
    
    return message;
}


-  (void)handleOpenURL:(NSURL *)url {
    
    
    [WeiboSDK handleOpenURL:url delegate:self];
}





#pragma mark

/**
 收到一个来自微博客户端程序的请求
 
 收到微博的请求后，第三方应用应该按照请求类型进行处理，处理完后必须通过 [WeiboSDK sendResponse:] 将结果回传给微博
 @param request 具体的请求对象
 */
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {
    
    
//    NSString * str = [NSString stringWithFormat:@" request == %@  dic= %@ ",request ];
    
//    UIAlertView *alView = [[UIAlertView alloc]initWithTitle:@"" message:str delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"resp", nil];
//    
//    [alView show];
    
    
}

/**
 收到一个来自微博客户端程序的响应
 
 收到微博的响应后，第三方应用可以通过响应类型、响应的数据和 WBBaseResponse.userInfo 中的数据完成自己的功能
 @param response 具体的响应对象
 */


- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
    
    
    if( [response isKindOfClass:[WBAuthorizeResponse class]]){
        
        if(response.statusCode == WeiboSDKResponseStatusCodeSuccess){
            
            self.wbtoken =((WBAuthorizeResponse*)response).accessToken;
            self.wbCurrentUserID =((WBAuthorizeResponse*)response).userID;
            self.wbRefreshToken =((WBAuthorizeResponse*)response).refreshToken;
            
            [self requestUserInfoByToken:self.wbtoken userId:self.wbCurrentUserID];
           
        }
        
        
    }
    
    
    
    if( [response isKindOfClass:[WBSendMessageToWeiboResponse class]]){
        
        if(response.statusCode == WeiboSDKResponseStatusCodeSuccess){
            
            if(_shareSuccess != nil){
                _shareSuccess();
            }
        }
        
    }
    
    
//    NSString * str = [NSString stringWithFormat:@" dict == %@  dic= %@ ",self.wbCurrentUserID ,self.wbtoken];
//    
//    
//    UIAlertView *alView = [[UIAlertView alloc]initWithTitle:@"" message:str delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"resp", nil];
//    
//    [alView show];
}





-(void)requestUserInfoByToken:(NSString *)accessToken userId:(NSString *)userId{
    
    NSString *urlStr = [NSString stringWithFormat:@"http://api.weibo.com/2/users/show.json?access_token=%@&uid=%@",accessToken,userId];
    
    NSURL*url = [NSURL URLWithString:urlStr];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue  mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(data.length>0&&[(NSHTTPURLResponse*)response statusCode]==200)
        {
            
            NSDictionary*dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSString * str = [NSString stringWithFormat:@" dict == %@ ",dict];
            if([dict[@"res"] integerValue]==1)
            {
                
            }
            
            if(_loginSuccess != nil){
                _loginSuccess();
            }
            
            UIAlertView *alView = [[UIAlertView alloc]initWithTitle:@"" message:str delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"resp", nil];
            
            [alView show];
        }
    }];
    
    
    
}


@end
