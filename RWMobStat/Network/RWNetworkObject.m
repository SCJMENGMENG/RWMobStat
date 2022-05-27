//
//  RWNetworkManager.m
//  RestartProject
//
//  Created by 宋高杰 on 2022/5/24.
//  Copyright © 2022 Reworld. All rights reserved.
//

#import "RWNetworkObject.h"

@implementation RWMobStatError

@end

@implementation RWNetworkObject

- (RWNetLoader *)loader {
    RWNetLoader *loader = [[RWNetLoader alloc] init];
    return loader;
}

- (void)postUploadMobStatLog:(NSString *)path params:(NSDictionary *)params fileParam:(NSString *)fileParam fileData:(NSData *)data completion:(void (^)(id model, RWMobStatError *errorModel))handler {
    [self.loader uploadMobStatLog:path params:params fileData:data fileParam:fileParam completeHandler:handler];
}

@end
