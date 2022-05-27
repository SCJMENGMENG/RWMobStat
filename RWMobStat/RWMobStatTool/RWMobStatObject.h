//
//  RWMobStatObject.h
//  RestartProject
//
//  Created by scj on 2022/5/19.
//  Copyright © 2022 Reworld. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RWMobStatObject : NSObject

/**
 *  初始化
 *
 *  @param uploadUrl 上传url
 *
 *  @param publicParams 公参
 *
 *  @param initKey 加密使用的key
 */
+ (void)initWithUoloadUrl:(NSString *__nonnull)uploadUrl publicParams:(NSDictionary *__nonnull)publicParams initKey:(NSString *__nonnull)initKey;

#pragma mark - upload

/**
 *  上传埋点
 */
+ (void)uploadMobStat;

#pragma mark - logs

/**
 *  自定义页统计.
 *
 *  @param privateParams 私参
 */
+ (void)logWithPrivateParams:(NSDictionary * __nonnull)privateParams;

@end

NS_ASSUME_NONNULL_END
