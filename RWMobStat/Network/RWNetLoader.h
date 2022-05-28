//
//  RWNetLoader.h
//  RestartProject
//
//  Created by scj on 2022/5/24.
//  Copyright © 2022 Reworld. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RWNetLoader : NSObject

- (NSURLSessionDataTask*)uploadMobStatLog:(NSString*)strURL params:(NSDictionary *)dicParams fileData:(NSData*)data fileParam:(NSString *)fileParam completeHandler:(void(^)(id model, id errorModel))completeHandler;

@end

@interface RWMobStatError : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) id result;
@end

NS_ASSUME_NONNULL_END
