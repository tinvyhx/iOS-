//
//  SecViewController.m
//  Demo
//
//  Created by 谭魏 on 15/9/7.
//  Copyright (c) 2015年 tv. All rights reserved.
//

#import "SecViewController.h"
#import "UIView+FindFirstResponder.h"

@interface SecViewController ()
{
    UIView *first;
}
@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeFrame:) name:UIKeyboardDidShowNotification object:nil];
}

-(CGRect)getFirstFrame{
    first=[self.view findFirstResponder];
    if (first!=nil) {
        return first.frame;
    }else
        return CGRectZero;
}


-(void)changeFrame:(NSNotification *)notif{
    CGRect rect = [[notif.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat y = rect.origin.y;
    
    CGRect rec=[self getFirstFrame];
    rec=[first.superview convertRect:rec toView:self.view];
    if (rec.size.height+rec.origin.y>y) {
        self.view.center=CGPointMake(160, 240-(rec.size.height+rec.origin.y-y));
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
