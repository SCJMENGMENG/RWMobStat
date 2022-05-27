//
//  RWNetStateManager.m
//  ProtobufDemo
//
//  Created by 宋高杰 on 2022/5/26.
//

#import "RWNetStateManager.h"

@implementation RWNetStateManager

+ (void)startNetworkMonitoring {
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
      
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                [[NSNotificationCenter defaultCenter] postNotificationName:kNetWorkStateNotify object:[NSNumber numberWithInteger:RWNetState_Unknown]];
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                
                [[NSNotificationCenter defaultCenter] postNotificationName:kNetWorkStateNotify object:[NSNumber numberWithInteger:RWNetState_NotReachable]];
                
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [[NSNotificationCenter defaultCenter] postNotificationName:kNetWorkStateNotify object:[NSNumber numberWithInteger:RWNetState_ReachableViaWiFi]];
                
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [[NSNotificationCenter defaultCenter] postNotificationName:kNetWorkStateNotify object:[NSNumber numberWithInteger:RWNetState_ReachableViaWWAN]];
                
                break;
                
            default:
                
                break;
        }
    }];
    [reachabilityManager startMonitoring];
}
@end
