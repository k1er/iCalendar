//
//  StyleModel.m
//  iCalendar
//
//  Created by 杨向阳 on 2017/3/14.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "StyleModel.h"

#define kHeaderHeight @"headerHeight"
#define kItemSize @"itemSize"
#define kItemFontSize @"itemFontSize"
#define kHeaderFontSize @"headerFontSize"
#define kSelectedColor @"selectedColor"
#define kHolidayColor @"holidayColor"
#define kWorkdayColor @"workdayColor"
#define kCurrentDayColor @"currentDayColor"
#define kFeastColor @"feastColor"
#define kTitleColor @"titleColor"

@implementation StyleModel

DEF_SINGLETON(StyleModel)

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _headerHeight = [aDecoder decodeDoubleForKey:kHeaderHeight];
        ;
        _headerFontSize = [aDecoder decodeDoubleForKey:kHeaderFontSize]
        ;
        _itemFontSize = [aDecoder decodeDoubleForKey:kItemFontSize]
        ;
        _itemSize = [[aDecoder decodeObjectForKey:kItemSize] sizeValue];
        
        _selectedColor = [NSColor colorWithHexString:[aDecoder decodeObjectForKey:kSelectedColor]];
        _holidayColor = [NSColor colorWithHexString:[aDecoder decodeObjectForKey:kHolidayColor]];
        _workdayColor = [NSColor colorWithHexString:[aDecoder decodeObjectForKey:kWorkdayColor]];
        _currentDayColor = [NSColor colorWithHexString:[aDecoder decodeObjectForKey:kCurrentDayColor]];
        _feastColor = [NSColor colorWithHexString:[aDecoder decodeObjectForKey:kFeastColor]];
        _titleColor = [NSColor colorWithHexString:[aDecoder decodeObjectForKey:kTitleColor]];
        _backgroundColor = Color(107, 109, 121, 1.0) ;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setDefaultValue];
    }
    return self;
}

- (void)setHeaderHeight:(CGFloat)headerHeight {
    _headerHeight = headerHeight;
}


- (void)setDefaultValue {
    self.headerHeight = 24;
    self.itemSize = NSMakeSize(35, 35);
    self.headerFontSize = 13;
    self.itemFontSize = 14;
    self.feastFontSize = 10;
    
    self.feastColor = [NSColor whiteColor];
    self.selectedColor = [NSColor redColor];
    self.workdayColor = [UIColor colorWithRed:233 / 255.0 green:133 / 255.0 blue:133 / 255.0 alpha:1.0];
    self.currentDayColor = [UIColor colorWithRed:68 / 255.0 green:177 / 255.0 blue:248 / 255.0 alpha:1.0];
    self.holidayColor = [UIColor colorWithRed:68 / 255.0 green:177 / 255.0 blue:248 / 255.0 alpha:1.0];
    self.titleColor = [NSColor whiteColor];
    self.backgroundColor = Color(107, 109, 121, 1.0) ;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:[self.selectedColor hexStringWithAlpha] forKey:kSelectedColor];
    [aCoder encodeObject:[self.holidayColor hexStringWithAlpha] forKey:kHolidayColor];
    [aCoder encodeObject:[self.workdayColor hexStringWithAlpha] forKey:kWorkdayColor];
    [aCoder encodeObject:[self.currentDayColor hexStringWithAlpha] forKey:kCurrentDayColor];
    [aCoder encodeObject:[self.titleColor hexStringWithAlpha] forKey:kTitleColor];
    [aCoder encodeObject:[self.feastColor hexStringWithAlpha] forKey:kFeastColor];
    [aCoder encodeObject:[NSValue valueWithSize:self.itemSize] forKey:kItemSize];
    [aCoder encodeDouble:self.itemFontSize forKey:kItemFontSize];
    [aCoder encodeDouble:self.headerFontSize forKey:kHeaderFontSize];
    [aCoder encodeDouble:self.headerHeight forKey:kHeaderHeight];
}

@end
