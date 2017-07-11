//
//  TDActionSheet.h
//  DongJie
//
//  Created by yuyue on 2017/5/18.
//  Copyright © 2017年 incredibleRon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ClickedButtonAtIndex)(NSInteger buttonIndex);

@interface TDActionSheet : NSObject


- (void)showInView:(UIView*)view  block:(ClickedButtonAtIndex) actionClick   ;

@end
