//
//  RWMobStatObject.m
//  RestartProject
//
//  Created by scj on 2022/5/19.
//  Copyright © 2022 Reworld. All rights reserved.
//

#import "RWMobStatObject.h"
#import "RWMobStatManager.h"
#import "RWNetStateManager.h"

@implementation RWMobStatObject

+ (void)initWithUoloadUrl:(NSString *)uploadUrl publicParams:(NSDictionary *)publicParams initKey:(NSString *)initKey {
    
    [RWNetStateManager startNetworkMonitoring];
    
    [RWMobStatManager manager].uploadUrl = uploadUrl;
    [RWMobStatManager manager].publicParams = publicParams;
    [RWMobStatManager manager].rw_initKey = initKey;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[RWMobStatManager manager] handleWaitingForuploadFiles];
    });
}

#pragma mark - upload

+ (void)uploadMobStat {
    [[RWMobStatManager manager] handleWaitingForuploadFiles];
}

#pragma mark - logs

+ (void)logWithPrivateParams:(NSDictionary *)privateParams {
    if (!privateParams.count) {
        return;
    }
    
    [[RWMobStatManager manager] logWithPrivateParams:privateParams];
}

#pragma mark - event logs

+ (void)logEvent:(NSString *)eventId
{
    [self logEvent:eventId label:nil];
}

+ (void)logEvent:(NSString *)eventId label:(NSString *)label
{
    if (![eventId length]) {
        return;
    }
    [[RWMobStatManager manager] logEvent:eventId label:label];
}

+ (void)logEvent:(NSString *)eventId attributes:(NSDictionary *)attributes
{
    if (![eventId length]) {
        return;
    }
    [[RWMobStatManager manager] logEvent:eventId attributes:attributes];
}

#pragma mark - page logs

+ (void)logPage:(NSString *)pageId
{
    [self logPage:pageId fromPage:nil];
}

+ (void)logPage:(NSString *)pageId fromPage:(NSString *)fromPageId
{
    if (![pageId length]) {
        return;
    }
    
    [[RWMobStatManager manager] logPage:pageId fromPage:fromPageId];
}

@end
