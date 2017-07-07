//
//  NSString+Localize.m
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/25.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "NSString+Localize.h"

@implementation NSString (Localize)

- (NSString *)localizedString {
    return NSLocalizedStringFromTableInBundle(self, @"Localize", [NSBundle mainBundle], @"Localize");
}

+ (NSString *)localizedWeekDay:(NSInteger)weekDay {
    NSString *weekDayString = @"Monday";
    switch (weekDay) {
        case 1:
            weekDayString = @"Monday";
            break;
        case 2:
            weekDayString = @"Tuesday";
            break;
        case 3:
            weekDayString = @"Wednesday";
            break;
        case 4:
            weekDayString = @"Thursday";
            break;
        case 5:
            weekDayString = @"Friday";
            break;
        case 6:
            weekDayString = @"Saturday";
            break;
        case 0:
            weekDayString = @"Sunday";
            break;
    }
//    NSAssert(weekDay < 7, @"weekDay must less than 7");
    return weekDayString.localizedString;
}

@end
