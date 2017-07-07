//
//  Bookmark.h
//  DrawIcon
//
//  Created by 杨向阳 on 2017/2/27.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_OSX
#import <AppKit/AppKit.h>
#import "YXView.h"
#ifndef UIView
#define UIView NSView
#endif

#ifndef UIColor
#define UIColor NSColor
#endif

#ifndef UIFont
#define UIFont NSFont
#endif

#else
#import <UIKit/UIKit.h>
#endif

@interface Bookmark : UIView

@property (assign, nonatomic) BOOL isHoliday;

@property (strong, nonatomic) UIColor *color;

@end
