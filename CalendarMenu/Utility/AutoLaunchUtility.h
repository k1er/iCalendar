//
//  AutoLaunchUtility.h
//  BlueOfficeMac
//
//  Created by Rudy Yang on 2016/10/19.
//  Copyright © 2016年 Rudy Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AutoLaunchUtility : NSObject
+ (void)registerAppLaunchWhenComputerPowerOn;
+ (void)unregisterAppLaunchWhenComputerPowerOn;
@end
