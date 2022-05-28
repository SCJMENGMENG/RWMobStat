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

#pragma mark - event logs


/**
 *  自定义点击事件,数量统计.
 *
 *  @param eventId 事件ID
 */

+ (void)logEvent:(NSString * __nonnull)eventId;

/**
 *  自定义点击事件,数量统计.
 *
 *  @param eventId 事件ID
 *  @param label 分类标签。不同的标签会分别进行统计，方便同一事件的不同标签的对比
 */

+ (void)logEvent:(NSString * __nonnull)eventId label:(NSString * __nullable)label;

/**
 *  自定义点击事件,数量统计.
 *
 *  @param eventId 事件ID
 *  @param attributes 自定义map
 */
+ (void)logEvent:(NSString * __nonnull)eventId attributes:(NSDictionary * __nullable)attributes;


#pragma mark - page logs

/**
 *  自定义页面事件,页面数量统计.
 *
 *  @param pageId 页面ID
 */
+ (void)logPage:(NSString * __nonnull)pageId;

/**
 *  自定义页面事件,页面数量统计.
 *
 *  @param pageId 页面ID
 *  @param fromPageId 来源的页面ID，为nil时，表示首页，等同于logPage:。
 */
+ (void)logPage:(NSString * __nonnull)pageId fromPage:(NSString * __nullable)fromPageId;

@end

NS_ASSUME_NONNULL_END
