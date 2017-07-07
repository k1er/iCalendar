//
//  Config.m
//  iCalendar
//
//  Created by Rudy Yang on 2017/5/26.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "Config.h"

@implementation Config

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.autoStart = YES;
        self.appearInDock = NO;
    }
    return self;
}

@end
