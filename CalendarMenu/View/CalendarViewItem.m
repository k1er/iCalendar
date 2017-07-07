//
//  CalendarVIewItem.m
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/25.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "CalendarVIewItem.h"
#import "HolidayUtil.h"
#import "Bookmark.h"
#import "TodayMark.h"
#import "CalendarView.h"

@interface CalendarViewItem ()

@property (weak) IBOutlet NSTextField *gregorianLabel;
@property (weak) IBOutlet NSTextField *detailLabel;
@property (weak) IBOutlet Bookmark *bookmarkView;

@property (weak) IBOutlet TodayMark *todaymark;

@end

@implementation CalendarViewItem

- (void)viewDidLoad
{
    [super viewDidLoad];
    [((YXView *)self.view) setBackgroundColor: [StyleModel sharedInstance].backgroundColor];
     self.gregorianLabel.font = [NSFont systemFontOfSize:[StyleModel sharedInstance].itemFontSize];
    self.detailLabel.font = [NSFont systemFontOfSize:[StyleModel sharedInstance].feastFontSize];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    self.todaymark.isSelected = self.isSelected;
}

- (void)setDate:(NSDate *)date
{
    self.gregorianLabel.stringValue = [NSString stringWithFormat:@"%@", @([date day])];
    self.detailLabel.stringValue = [date chineseCalendar];
    switch ([date dateType]) {
        case DateTypeHoliday:
            self.bookmarkView.hidden = NO;
            self.bookmarkView.isHoliday = YES;
            self.bookmarkView.color = [StyleModel sharedInstance].holidayColor;
            break;
        case DateTypeWorkOffday:
            self.bookmarkView.hidden = NO;
            self.bookmarkView.isHoliday = false;
            self.bookmarkView.color = [StyleModel sharedInstance].workdayColor;
            break;
        default:
            [self.bookmarkView setHidden:YES];
            break;
    }
    
    
    self.todaymark.isToday = [date isToday];
    self.todaymark.isSelected = self.isSelected;
    
    self.gregorianLabel.textColor = self.isViewMonth ? [NSColor whiteColor] : [NSColor lightGrayColor];
    self.detailLabel.textColor = self.isViewMonth ? [NSColor whiteColor] : [NSColor lightGrayColor];
    
}

@end
