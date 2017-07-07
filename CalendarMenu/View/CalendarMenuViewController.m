//
//  CalendarMenuViewController.m
//  iCalendar
//
//  Created by 杨向阳 on 2017/3/8.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "CalendarMenuViewController.h"
#import "CalendarView.h"
#import <QuartzCore/QuartzCore.h>
#import "FeHandwriting.h"
#import "AutoLaunchUtility.h"

@interface CalendarMenuViewController ()

@property (strong, nonatomic) CalendarView *calendarView;
@property (weak) IBOutlet YXView *bottomContentView;
@property (weak) IBOutlet NSLayoutConstraint *bottomContentTopConstraint;
@property (weak) IBOutlet NSLayoutConstraint *bottomContentHeightConstraint;
@property (weak) IBOutlet NSMenuItem *exitItem;
@property (weak) IBOutlet NSMenuItem *autoStartItem;
@property (weak) IBOutlet NSMenuItem *appearInDockItem;

@property (assign, nonatomic) BOOL isExpand;


@property (strong, nonatomic) FeHandwriting *handwritingLoader;

@end

@implementation CalendarMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    self.view.wantsLayer = YES;
    self.isExpand = YES;
    Config *config = [AppInfoStorage storage].config;
    self.autoStartItem.state = config.autoStart;
    self.appearInDockItem.state = config.appearInDock;
}

- (void)setupLocalization {
    self.exitItem.title = @"exit".localizedString;
}

- (void)setupUI {
    self.calendarView = [CalendarView loadWithNibNamed:@"CalendarView" ocClass:[CalendarView class] owner:nil];
    CGSize itemSize = [StyleModel sharedInstance].itemSize;
    CGSize calendarSize = CGSizeMake(itemSize.width * 7, itemSize.height * 7 + [StyleModel sharedInstance].headerHeight);
    self.view.frame = CGRectMake(0, 0, calendarSize.width, calendarSize.height + self.bottomContentHeightConstraint.constant);

    [self.view addSubview:self.calendarView];
    [self.calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(0);
        make.leading.mas_equalTo(0);
        make.height.mas_equalTo(calendarSize.height);
        make.bottom.mas_equalTo(self.bottomContentView.mas_top);
    }];
    self.bottomContentTopConstraint.constant = calendarSize.height;

    self.bottomContentView.wantsLayer = YES;
    self.bottomContentView.layer.backgroundColor = [StyleModel sharedInstance].backgroundColor.CGColor;
    self.view.layer.backgroundColor = [StyleModel sharedInstance].backgroundColor.CGColor;
    
}

- (IBAction)openItem:(NSButton *)sender {
    [sender.menu popUpMenuPositioningItem:[sender.menu itemAtIndex:0] atLocation:[NSEvent mouseLocation] inView:nil];
}

- (IBAction)autoStartItem:(NSMenuItem *)sender {
    sender.state = !sender.state;
    if (sender.state) {
        [AutoLaunchUtility registerAppLaunchWhenComputerPowerOn];
    } else {
        [AutoLaunchUtility unregisterAppLaunchWhenComputerPowerOn];
    }
    Config *config = [AppInfoStorage storage].config;
    config.autoStart = sender.state;
    [[AppInfoStorage storage] saveConfig:config];
}

- (IBAction)appearInDock:(NSMenuItem *)sender {
    sender.state = !sender.state;
    if (sender.state) {
        [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
    } else {
        [NSApp setActivationPolicy:NSApplicationActivationPolicyProhibited];
    }
    Config *config = [AppInfoStorage storage].config;
    config.appearInDock = sender.state;
    [[AppInfoStorage storage] saveConfig:config];
}

- (IBAction)closeMenuApp:(NSMenuItem *)sender {
//    _handwritingLoader = [[FeHandwriting alloc] initWithView:self.view];
//    [self.view addSubview:_handwritingLoader];
    
//    [_handwritingLoader showWhileExecutingBlock:^{
////        [self myTask];
//        sleep(12);
//    } completion:^{
//        [_handwritingLoader removeFromSuperview];
//    }];

    [NSApp terminate:nil];
}

- (IBAction)respondToTapBottomView:(NSButton *)sender {
    
    CGFloat height = 10;
    if (self.isExpand) {
        height = 10;
//        [NSApp setActivationPolicy:NSApplicationActivationPolicyProhibited];
    } else {
        height = 96;
//        [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
    }
    self.isExpand = !self.isExpand;
    NSRect windowFrame = self.view.window.frame;
    CGFloat offsetY = windowFrame.size.height - self.view.height;
    CGFloat windowHeight = self.calendarView.frame.size.height + height + offsetY;
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
        context.duration = 0.2;
        [self.view.window.animator setFrame:CGRectMake(windowFrame.origin.x, windowFrame.origin.y - windowHeight + windowFrame.size.height, windowFrame.size.width, windowHeight) display:YES];
    } completionHandler:^{
        
    }];
}
@end
