//
//  RWMobStatManager.h
//  RestartProject
//
//  Created by scj on 2022/5/19.
//  Copyright © 2022 Reworld. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RWMobStatManager : NSObject

/// 上传url
@property (nonatomic, strong) NSString *uploadUrl;

/// 加密使用的key
@property (nonatomic, strong) NSString *rw_initKey;

/// 公参
@property (nonatomic, strong) NSDictionary *publicParams;

+ (nonnull instancetype)manager;

- (void)handleWaitingForuploadFiles;

- (void)logWithPrivateParams:(NSDictionary *__nonnull)privateParams;

- (void)logEvent:(NSString * __nonnull)eventId label:(NSString * __nullable)label;
- (void)logEvent:(NSString * __nonnull)eventId attributes:(NSDictionary * __nullable)attributes;
- (void)logPage:(NSString * __nonnull)pageId fromPage:(NSString * __nullable)fromPageId;

@end

NS_ASSUME_NONNULL_END
