//
//  StyleModel.h
//  iCalendar
//
//  Created by 杨向阳 on 2017/3/14.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StyleModel : NSObject<NSCoding>

BC_SINGLETON(StyleModel)

@property (assign, nonatomic) CGFloat headerHeight;
@property (assign, nonatomic) CGSize itemSize;
@property (assign, nonatomic) CGFloat itemFontSize;
@property (assign, nonatomic) CGFloat feastFontSize;
@property (assign, nonatomic) CGFloat headerFontSize;


@property (strong, nonatomic) NSColor *titleColor;
@property (strong, nonatomic) NSColor *selectedColor;
@property (strong, nonatomic) NSColor *holidayColor;
@property (strong, nonatomic) NSColor *workdayColor;
@property (strong, nonatomic) NSColor *currentDayColor;
@property (strong, nonatomic) NSColor *feastColor;

@property (strong, nonatomic) NSColor *backgroundColor;

@end
