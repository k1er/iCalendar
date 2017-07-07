//
//  TodayMark.m
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/27.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "TodayMark.h"

@implementation TodayMark

- (void)setIsToday:(BOOL)isToday
{
    _isToday = isToday;
    self.needsDisplay = YES;
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    self.needsDisplay = YES;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    CGFloat boderWidth = 0;
    NSRect circeRect = NSInsetRect(self.bounds, self.frame.size.width - 1 - boderWidth, self.frame.size.width - boderWidth - 1);
    NSBezierPath* bezierPath = [NSBezierPath bezierPathWithOvalInRect:circeRect];
   
    if (self.isSelected) {
        [[NSColor redColor] set];
        [bezierPath fill];
    }
    
    if (self.isToday) {
        [[NSColor colorWithRed:68 / 255.0 green:177 / 255.0 blue:248 / 255.0 alpha:1.0] set];
        [bezierPath stroke];
    }
}

@end
