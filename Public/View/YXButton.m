//
//  YXButton.m
//  iCalendar
//
//  Created by 杨向阳 on 2017/3/14.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "YXButton.h"

@implementation YXButton

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
         ((NSButtonCell *)self.cell).highlightsBy = NSContentsCellMask;
    }
    return self;
}

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        ((NSButtonCell *)self.cell).highlightsBy = NSContentsCellMask;
    }
    return self;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
