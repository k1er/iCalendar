//
//  AutoLaunchUtility.m
//  BlueOfficeMac
//
//  Created by Rudy Yang on 2016/10/19.
//  Copyright © 2016年 Rudy Yang. All rights reserved.
//

#import "AutoLaunchUtility.h"

@implementation AutoLaunchUtility


+ (void)registerAppLaunchWhenComputerPowerOn
{
    NSString * appPath = [[NSBundle mainBundle] bundlePath];
    LSSharedFileListRef loginItems = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
    if (loginItems == NULL)
    {
        return;
    }
    CFURLRef url = (__bridge CFURLRef)[NSURL fileURLWithPath:appPath];
    LSSharedFileListItemRef item = LSSharedFileListInsertItemURL(loginItems, kLSSharedFileListItemLast, NULL, NULL, url, NULL, NULL);
    if (item == NULL)
    {
        CFRelease(loginItems);
        return;
    }
    CFRelease(item);
    CFRelease(loginItems);
}

+ (void)unregisterAppLaunchWhenComputerPowerOn
{
    NSString * appPath = [[NSBundle mainBundle] bundlePath];
    UInt32 seedValue;
    CFURLRef thePath;
    LSSharedFileListRef loginItems = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
    CFArrayRef loginItemsArray = LSSharedFileListCopySnapshot(loginItems, &seedValue);
    for (id item in (__bridge NSArray *)loginItemsArray) {
        LSSharedFileListItemRef itemRef = (__bridge LSSharedFileListItemRef)item;
        if (LSSharedFileListItemResolve(itemRef, 0, (CFURLRef*) &thePath, NULL) == noErr) {
            //appPath目录为要取消开机启动app的路径
            if ([[(__bridge NSURL *)thePath path] hasPrefix:appPath]) {
                LSSharedFileListItemRemove(loginItems, itemRef); // Deleting the item
            }
            CFRelease(thePath);
        }
    }
    CFRelease(loginItemsArray);
    CFRelease(loginItems);
}

@end
