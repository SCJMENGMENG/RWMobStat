//
//  RWNetworkManager.h
//  RestartProject
//
//  Created by 宋高杰 on 2022/5/24.
//  Copyright © 2022 Reworld. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RWMobStatError : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) id result;
@end

@interface RWNetworkObject : NSObject

@property(readonly) RWNetLoader* loader;

- (void)postUploadMobStatLog:(NSString *)path params:(NSDictionary *)params fileParam:(NSString *)fileParam fileData:(NSData *)data completion:(void (^)(id model, RWMobStatError *errorModel))handler;
@end

NS_ASSUME_NONNULL_END
