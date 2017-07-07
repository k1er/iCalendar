//
//  YXViewController.m
//  iCalendar
//
//  Created by 杨向阳 on 2017/3/14.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "YXViewController.h"

NSString * const YXLocalizationDidChanged = @"YXLocalizationDidChanged";

@interface YXViewController ()

@end

@implementation YXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupLocalization) name:YXLocalizationDidChanged object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setupLocalization { }

@end
