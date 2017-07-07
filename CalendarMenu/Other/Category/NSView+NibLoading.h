//
//  NSView+NibLoading.h
//  Min60
//
//  Created by Peter Paulis on 08/09/14.
//  Copyright (c) 2014 min60 s.r.o. - Peter Paulis. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSView (NibLoading)

+ (id)loadWithClass:(Class)loadClass owner:(id)owner;

+ (id)loadWithNibNamed:(NSString *)nibNamed ocClass:(Class)loadClass owner:(id)owner;

@end
