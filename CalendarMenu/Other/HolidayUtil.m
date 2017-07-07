//
//  HolidayUtil.m
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/23.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "HolidayUtil.h"

@interface HolidayUtil ()

@property (strong, nonatomic) NSDictionary *holidayMap;

@end

@implementation HolidayUtil

DEF_SINGLETON(HolidayUtil)

- (NSDictionary *)holidayMap
{
    if (_holidayMap == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Holiday" ofType:@".plist"];
        _holidayMap = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    return _holidayMap;
}

@end


@implementation NSDate (Holiday)

- (DateType)dateType
{
    NSString *dateString = [self stringWithFormat:@"MMdd"];
    id isHolidayNumber = [[HolidayUtil sharedInstance].holidayMap objectForKey:dateString];
    if (isHolidayNumber && ([self isThisYear])) {
        if ([isHolidayNumber boolValue]) {
            return DateTypeHoliday;
        } else {
            return DateTypeWorkOffday;
        }
    }
    return DateTypeOtherday;
}

- (BOOL)isHoliday
{
    NSString *dateString = [self stringWithFormat:@"MMdd"];
    id isHolidayNumber = [[HolidayUtil sharedInstance].holidayMap objectForKey:dateString];
    return isHolidayNumber ? [isHolidayNumber boolValue] : NO;
}

@end
