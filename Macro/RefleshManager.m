//
//  RefleshManager.m
//  DongJie
//
//  Created by yuyue on 2017/5/24.
//  Copyright © 2017年 incredibleRon. All rights reserved.
//

#import "RefleshManager.h"

@implementation RefleshManager




+ (void)tableView:(UITableView*)tableView header:(SEL)headerAction footer:(SEL)footerAction {
    
    
//    [tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:headerAction];
//    
//    [tableView addLegendFooterWithRefreshingTarget:self refreshingAction:headerAction];
//    
//    [tableView.footer setTitle:@"123" forState:MJRefreshFooterStateNoMoreData];
//    [tableView.footer noticeNoMoreData];
    
}



+ (void)tableView:(UITableView*)tableView count:(NSInteger)count maxCount:(NSInteger)maxCount {
    
    
    if(count < maxCount){
        [tableView.mj_footer endRefreshingWithNoMoreData];
    }
    else {
        [tableView.mj_footer resetNoMoreData];
    }
    
}



@end
