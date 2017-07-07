//
//  CalendarView.h
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/25.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "YXView.h"

@interface CalendarView : YXView

@property (strong, nonatomic) NSDate *currentDate;

@property (strong, nonatomic) NSDate *selectedDate;

@end
