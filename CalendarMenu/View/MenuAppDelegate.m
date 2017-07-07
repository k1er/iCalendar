//
//  AppDelegate.m
//  iCalendar
//
//  Created by 杨向阳 on 2017/2/22.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "MenuAppDelegate.h"

@interface MenuAppDelegate ()

@end

@implementation MenuAppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification {
    [[AppInfoStorage storage] config];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
