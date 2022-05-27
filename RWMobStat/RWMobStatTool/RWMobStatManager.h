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

@end

NS_ASSUME_NONNULL_END
