//
//  YXView.m
//  iCalendar
//
//  Created by 杨向阳 on 2017/2/22.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "YXView.h"

@implementation YXView

- (BOOL)wantsUpdateLayer
{
    //View的drawrect方法不再调用
    return YES;
    
//    self.canDrawSubviewsIntoLayer = YES;
//    self.layerContentsRedrawPolicy = NSViewLayerContentsRedrawOnSetNeedsDisplay;
//    [self setNeedsDisplay:YES];
}

- (BOOL)canDrawSubviewsIntoLayer
{
    return YES;
}

- (BOOL)isFlipped
{
    return YES;
}

- (void)updateLayer
{
    self.layer.backgroundColor = self.backgroundColor.CGColor;
}

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
    [self setNeedsDisplay:YES];
}

@end
