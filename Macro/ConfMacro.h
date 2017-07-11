//
//  ConfMacro.h
//  MBDemo
//
//  Created by yuyue on 2017/5/5.
//  Copyright © 2017年 incredibleRon. All rights reserved.
//

#ifndef ConfMacro_h
#define ConfMacro_h



//服务器地址


#define HOST @"http://xsg.vx818.com/"

#define HOSTAPIKEY(key) [HOST stringByAppendingString:key]

typedef void (^ActionBlock)();

#define DictStr(dict ,key) [NSString stringWithFormat:@"%@",dict[key]]


// 颜色
#define GRAYCOLOR [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]

#define MAINCOLOR [UIColor colorWithRed:0/255.f green:173/255.f blue:242/255.f alpha:1]


#define HEX333333 [UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1]
#define HEX666666 [UIColor colorWithRed:102/255.f green:102/255.f blue:102/255.f alpha:1]
#define HEXBBBBBB [UIColor colorWithRed:187/255.f green:187/255.f blue:187/255.f alpha:1]
#define HEXFFFFFF [UIColor colorWithRed:255/255.f green:255/255.f blue:255/255.f alpha:1]
#define HEX7BC531 [UIColor colorWithRed:123/255.f green:197/255.f blue:49/255.f alpha:1]

#define HEX887754 [UIColor colorWithRed:136/255.f green:119/255.f blue:84/255.f alpha:1]
#define HEX545454 [UIColor colorWithRed:84/255.f green:84/255.f blue:84/255.f alpha:1]
#define HEX494949 [UIColor colorWithRed:73/255.f green:73/255.f blue:73/255.f alpha:1]
#define HEX646464 [UIColor colorWithRed:100/255.f green:100/255.f blue:100/255.f alpha:1]



#define RECTPX(x) ((x/2.f)*(SCREEM_WIDTH/375.f))


#endif /* ConfMacro_h */
