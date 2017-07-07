//
//  CalendarVIewItem.h
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/25.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CalendarViewItem : NSCollectionViewItem

@property (assign, nonatomic) BOOL isViewMonth;

- (void)setDate:(NSDate *)date;

@end
