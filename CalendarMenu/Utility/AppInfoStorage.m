//
//  AppInfoManager.m
//  CRM
//
//  Created by 杨向阳 on 2017/2/23.
//  Copyright © 2017年 able. All rights reserved.
//

#import "AppInfoStorage.h"
#import "BCSingleton.h"
#import "YYModel.h"
#import "AutoLaunchUtility.h"


#define YXAppInfoStorage   @"YXAppInfoStorage"
#define YXConfigKey      @"YXConfig"

@interface AppInfoStorage ()

@property (strong, nonatomic) YYCache *cacheManager;

@end

@implementation AppInfoStorage

DEF_SINGLETON(AppInfoStorage)

+ (instancetype)storage
{
    return [self sharedInstance];
}

- (YYCache *)cacheManager {
    if (_cacheManager == nil) {
        _cacheManager = [YYCache cacheWithName:YXAppInfoStorage];
    }
    return _cacheManager;
}

- (Config *)config {
    NSDictionary *configJson = (NSDictionary *)[self.cacheManager objectForKey:YXConfigKey];
    if (configJson) {
        return [Config yy_modelWithDictionary:configJson];
    }
    [NSApp setActivationPolicy:NSApplicationActivationPolicyProhibited];
    [AutoLaunchUtility registerAppLaunchWhenComputerPowerOn];
    return [[Config alloc] init];
}

- (void)saveConfig:(Config *)config {
    NSDictionary *json = config.yy_modelToJSONObject;
    if (json) {
        [self.cacheManager setObject:json forKey:YXConfigKey];
    }
}

@end
