
//
//  NSObject+Ext.m
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/25.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "NSObject+Ext.h"

@implementation NSObject (Ext)

+ (NSString *)className
{
    return [NSString stringWithUTF8String:object_getClassName(self)];
}

@end
