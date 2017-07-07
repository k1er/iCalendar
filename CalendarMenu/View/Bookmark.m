//
//  Bookmark.m
//  DrawIcon
//
//  Created by 杨向阳 on 2017/2/27.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "Bookmark.h"

@interface Bookmark ()

@end

@implementation Bookmark


#if TARGET_OS_OSX
- (BOOL)isFlipped
{
    return YES;
}
#endif

- (void)setIsHoliday:(BOOL)isHoliday
{
    if (isHoliday != _isHoliday) {
        self.needsDisplay = YES;
    }
    _isHoliday = isHoliday;
}

- (void)drawRect:(CGRect)rect
{
#if TARGET_OS_OSX
    CGContextRef context = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
#else
    CGContextRef context = UIGraphicsGetCurrentContext();
#endif

    if (self.color == nil) {
        self.color = [UIColor colorWithRed:233 / 255.0 green:133 / 255.0 blue:133 / 255.0 alpha:1.0];
    }
    
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    CGContextSetFillColorWithColor(context, CGColorCreateCopyWithAlpha(self.color.CGColor, 0.8));
    CGContextSetLineWidth(context, 1.0);
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    CGPoint points[6];
    points[0] = CGPointMake(0, 0);
    points[1] = CGPointMake(width, 0);
    points[2] = CGPointMake(width, height);
    points[3] = CGPointMake(width / 2, height - width / 2);
    points[4] = CGPointMake(0, height);
    points[5] = CGPointMake(0, 0);
    CGContextAddLines(context, points, 6);
    CGContextDrawPath(context, kCGPathFillStroke);
    NSString *markString = self.isHoliday ? @"休" : @"班";
    [markString drawAtPoint:CGPointMake(0, width / 5) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10],
                                                                               NSForegroundColorAttributeName: [UIColor whiteColor]}];
}

@end
