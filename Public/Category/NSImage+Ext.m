//
//  NSImage+Ext.m
//  iCalendar
//
//  Created by 杨向阳 on 2017/3/15.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import "NSImage+Ext.h"

@implementation NSImage (Ext)

- (void)saveImageAtPath:(NSString *)path {
    
    CGImageRef cgRef = [self CGImageForProposedRect:NULL
                                             context:nil
                                               hints:nil];
    NSBitmapImageRep *newRep = [[NSBitmapImageRep alloc] initWithCGImage:cgRef];
    [newRep setSize:[self size]];   // if you want the same resolution
    NSData *pngData = [newRep representationUsingType:NSPNGFileType properties:@{}];
    [pngData writeToFile:path atomically:YES];
}

@end
