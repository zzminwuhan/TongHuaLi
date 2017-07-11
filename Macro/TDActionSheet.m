//
//  TDActionSheet.m
//  DongJie
//
//  Created by yuyue on 2017/5/18.
//  Copyright © 2017年 incredibleRon. All rights reserved.
//

#import "TDActionSheet.h"


@interface TDActionSheet ()<UIActionSheetDelegate>

@property (nonatomic ,copy) ClickedButtonAtIndex actionClick;

@end


@implementation TDActionSheet





- (void)showInView:(UIView*)view  block:(ClickedButtonAtIndex) actionClick {
    
    
//    TDActionSheet * actionSheet = [[TDActionSheet alloc]init];
    self.actionClick = actionClick;
    
    UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相册",@"相机", nil];
    
    
    [action showInView:view];
}



- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(_actionClick != nil){
        _actionClick(buttonIndex);
    }
    
}




@end
