//
//  NSMenu+HasPadding.h
//  iCalendar
//
//  Created by Rudy Yang on 2017/2/27.
//  Copyright © 2017年 rudy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSMenu (HasPadding)

- (void) _setHasPadding: (BOOL) pad onEdge: (int) whatEdge;

@end
