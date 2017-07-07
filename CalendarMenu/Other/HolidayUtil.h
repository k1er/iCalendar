//
//  HolidayUtil.h
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/23.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HolidayUtil : NSObject

BC_SINGLETON(HolidayUtil)

@property (strong, nonatomic, readonly) NSDictionary *holidayMap;


@end


typedef NS_ENUM(NSInteger, DateType) {
    DateTypeHoliday = 0,
    DateTypeWorkOffday,
    DateTypeOtherday,
};

@interface NSDate (holiday)

- (DateType)dateType;

- (BOOL)isHoliday;

@end
