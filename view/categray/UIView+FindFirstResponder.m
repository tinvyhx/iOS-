//
//  UIView+FindFirstResponder.m
//  Demo
//
//  Created by 谭魏 on 15/9/7.
//  Copyright (c) 2015年 tv. All rights reserved.
//

#import "UIView+FindFirstResponder.h"

@implementation UIView (FindFirstResponder)

-(UIView *)findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        id responder = [subView findFirstResponder];
        if (responder)
            return responder;
        
    }
    return nil;
}
@end
