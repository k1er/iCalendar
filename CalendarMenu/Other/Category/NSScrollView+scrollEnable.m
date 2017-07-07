//
//  NSScrollView+scrollEnable.m
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/27.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "NSScrollView+scrollEnable.h"
#import <objc/runtime.h>

static NSString *kScrollEnable = @"scrollEnable";

@implementation NSScrollView (scrollEnable)


- (void)scrollWheel:(NSEvent *)event
{
    if (self.scrollEnable) {
        [super scrollWheel:event];
    }
}

- (void)setScrollEnable:(BOOL)scrollEnable
{
    [self willChangeValueForKey:kScrollEnable];
    objc_setAssociatedObject(self, (__bridge const void *)(kScrollEnable), @(scrollEnable), OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:kScrollEnable];
}

- (BOOL)scrollEnable
{
    return [objc_getAssociatedObject(self, (__bridge const void *)(kScrollEnable)) boolValue];
}

@end
