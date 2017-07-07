//
//  NSString+Localize.h
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/25.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Localize)

- (NSString *)localizedString;

+ (NSString *)localizedWeekDay:(NSInteger)weekDay;

@end
