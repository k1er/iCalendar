//
//  AppInfoManager.h
//  CRM
//
//  Created by 杨向阳 on 2017/2/23.
//  Copyright © 2017年 able. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"

@interface AppInfoStorage : NSObject

+ (instancetype)storage;

- (Config *)config;

- (void)saveConfig:(Config *)config;
@end
