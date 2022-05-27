//
//  RWNetStateManager.h
//  ProtobufDemo
//
//  Created by 宋高杰 on 2022/5/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RWNetState) {
    RWNetState_Unknown          = -1,
    RWNetState_NotReachable     = 0,
    RWNetState_ReachableViaWWAN = 1,
    RWNetState_ReachableViaWiFi = 2,
};

@interface RWNetStateManager : NSObject

+ (void)startNetworkMonitoring;
@end

NS_ASSUME_NONNULL_END
