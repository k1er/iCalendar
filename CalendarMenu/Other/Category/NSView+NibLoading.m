//
//  NSView+NibLoading.m
//  Min60
//
//  Created by Peter Paulis on 08/09/14.
//  Copyright (c) 2014 min60 s.r.o. - Peter Paulis. All rights reserved.
//

#import "NSView+NibLoading.h"

@implementation NSView (NibLoading)

+ (id)loadWithClass:(Class)loadClass owner:(id)owner {
    return [NSView loadWithNibNamed:NSStringFromClass(loadClass) ocClass:loadClass owner:owner];
}

+ (id)loadWithNibNamed:(NSString *)nibNamed ocClass:(Class)loadClass owner:(id)owner {
    
    NSNib *nib = [[NSNib alloc] initWithNibNamed:nibNamed bundle:nil];
    
    NSArray * objects;
    if (![nib instantiateWithOwner:owner topLevelObjects:&objects]) {
        NSLog(@"Couldn't load nib named %@", nibNamed);
        return nil;
    }
    
    for (id object in objects) {
        if ([object isKindOfClass:loadClass]) {
            return object;
        }
    }
    return nil;
}

@end
