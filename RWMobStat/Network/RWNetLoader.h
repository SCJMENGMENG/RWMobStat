//
//  RWNetLoader.h
//  RestartProject
//
//  Created by 宋高杰 on 2022/5/24.
//  Copyright © 2022 Reworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RWMobStatError;

NS_ASSUME_NONNULL_BEGIN

@interface RWNetLoader : NSObject

- (NSURLSessionDataTask*)uploadMobStatLog:(NSString*)strURL params:(NSDictionary *)dicParams fileData:(NSData*)data fileParam:(NSString *)fileParam completeHandler:(void(^)(id model, RWMobStatError *errorModel))completeHandler;

@end

NS_ASSUME_NONNULL_END
