//
//  CalendarMenuController.m
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/25.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "CalendarMenuController.h"
#import "CalendarView.h"
#import "CalendarMenuViewController.h"

@interface CalendarMenuController ()<NSMenuDelegate>

@property (strong, nonatomic) NSStatusItem *statusItem;

@property (strong, nonatomic) CalendarMenuViewController *viewController;

@property (strong, nonatomic) id popoverTransiencyMonitor;

@end

@implementation CalendarMenuController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setUpStatusItem];
    [self setUpMenu];
}

- (void)setUpStatusItem
{
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    
    self.statusItem.highlightMode = YES;
    NSImage *image = [NSImage imageNamed:@"statusbar_logo"];
    
    NSString *dateString = @([[NSDate date] day]).stringValue;
    
    NSDictionary *dict = @{
                           NSFontAttributeName:[NSFont systemFontOfSize:10.0],
                           NSForegroundColorAttributeName:[NSColor whiteColor]
                           };
    CGFloat width = [dateString boundingRectWithSize:CGSizeMake(30, 30) options:NSStringDrawingUsesFontLeading attributes:dict].size.width;
    [image lockFocus];
    [[NSColor whiteColor] set];
    [dateString drawAtPoint:CGPointMake((image.size.width - width) / 2, 0)
             withAttributes:dict];
    [image unlockFocus];

    self.statusItem.image = image;
    self.statusItem.alternateImage = image;
    
}

- (void)setUpMenu
{
    NSMenu *menu = [[NSMenu alloc] init];
    menu.delegate = self;
    NSMenuItem *item = [[NSMenuItem alloc] init];
    self.viewController = [[CalendarMenuViewController alloc] initWithNibName:@"CalendarMenuViewController" bundle:nil];
//    item.view = self.viewController.view;
    [self.statusItem setTarget:self];
    [self.statusItem setAction:@selector(showCalendar:)];
    [menu addItem:item];
//    self.statusItem.menu = menu;
   
    if ([menu respondsToSelector: @selector(_setHasPadding:onEdge:)])
    {
        [menu _setHasPadding: NO onEdge: 1];
        [menu _setHasPadding: NO onEdge: 3];
    }
}

- (void)showCalendar:(NSView *)sender {
    NSPopover *popover = [[NSPopover alloc] init];
    popover.contentViewController = self.viewController;
    popover.behavior = NSPopoverBehaviorTransient;
    [popover showRelativeToRect:NSZeroRect ofView:sender preferredEdge:NSRectEdgeMinY];
    
    if(self.popoverTransiencyMonitor == nil)
    {
        self.popoverTransiencyMonitor = [NSEvent addGlobalMonitorForEventsMatchingMask:NSEventMaskLeftMouseDown|NSEventMaskRightMouseDown handler:^(NSEvent* event)
                                    {
                                        [self closePopover:popover];
                                    }];
    }
}

- (void)closePopover:(NSPopover *)sender
{
    if(self.popoverTransiencyMonitor)
    {
        [NSEvent removeMonitor:self.popoverTransiencyMonitor];
        
        self.popoverTransiencyMonitor = nil;
    }
    
    [sender close];
}

@end
