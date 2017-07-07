//
//  FeHandwriting.h
//  FeSpinner
//
//  Created by Nghia Tran on 1/2/15.
//  Copyright (c) 2015 fe. All rights reserved.
//

#import <AppKit/AppKit.h>

#if TARGET_OS_OSX

#ifndef UIBezierPath
#define UIBezierPath NSBezierPath
#endif

#endif

@interface FeHandwriting : UIView

// is running
@property (assign, readonly, nonatomic) BOOL isShowing;

-(instancetype) initWithView:(UIView *) view;

-(void) show;

-(void) showWhileExecutingBlock:(dispatch_block_t) block;

-(void) showWhileExecutingBlock:(dispatch_block_t)block completion:(dispatch_block_t) completion;

-(void) showWhileExecutingSelector:(SEL) selector onTarget:(id) target withObject:(id) object;

-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object completion:(dispatch_block_t) completion;

-(void) dismiss;

@end
