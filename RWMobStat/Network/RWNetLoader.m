//
//  RWNetLoader.m
//  RestartProject
//
//  Created by 宋高杰 on 2022/5/24.
//  Copyright © 2022 Reworld. All rights reserved.
//

#import "RWNetLoader.h"

@interface _RWNetLoader : AFHTTPSessionManager

@end

@implementation _RWNetLoader

- (instancetype)init {
    if (self = [super init]) {
        NSSet *typeSet = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", @"text/xml", @"video/mp2t", @"suggestion/json", @"application/zip", nil];
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.responseSerializer.acceptableContentTypes = typeSet;
        self.requestSerializer.timeoutInterval = 5.0f;
        [self.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        AFSecurityPolicy *policy = [AFSecurityPolicy defaultPolicy];
        policy.allowInvalidCertificates = YES;
        policy.validatesDomainName = NO;
        self.securityPolicy = policy;
    }
    return self;
}

- (NSURLSessionDataTask*)uploadMobStatLog:(NSString*)strURL params:(NSDictionary *)dicParams fileData:(NSData*)data fileParam:(NSString *)fileParam completeHandler:(void(^)(id model, RWMobStatError *errorModel))completeHandler {
    return [self POST:strURL parameters:dicParams headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:@"file" fileName:fileParam mimeType:@"file/*"];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self successWithRespData:responseObject resultModelClass:(NSDictionary.class) task:task completeHandler:completeHandler];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self printLogWithURLString:strURL params:dicParams responseObject:nil error:error];
        [self failureWithError:error task:task completeHandler:completeHandler];
    }];
};

#pragma mark  HTTP Result Handler

- (void)successWithRespData:(id)responseObj resultModelClass:(Class)modelClass task:(NSURLSessionDataTask *)task completeHandler:(void(^)(id model, RWMobStatError *errorModel))completeHandler {
#if XCODE_USER != 8001
    NSLog(@"Request URL: %@", [task.currentRequest.URL absoluteString]);
#endif
    
    if (!completeHandler) {
        return;
    }
    if ([responseObj conformsToProtocol:@protocol(OS_dispatch_data)] && [modelClass isSubclassOfClass:[NSData class]]) {
        completeHandler(responseObj, nil);
        return;
    }
    RWMobStatError *errorModel = [[RWMobStatError alloc] init];
    if (![responseObj isKindOfClass:[NSData class]]) {
        errorModel.message = @"responseObj Cannot be resolved";
        completeHandler(nil,errorModel);
        return;
    }
    
    if ([[[modelClass alloc] init] isKindOfClass:[NSString class]]) {
        NSString *str = [[NSString alloc] initWithData:responseObj encoding:NSUTF8StringEncoding];
        completeHandler(str,nil);
        return;
    }
    
    id jsonObj = [NSJSONSerialization JSONObjectWithData:responseObj options:NSJSONReadingMutableContainers error:nil];
    if (jsonObj == nil) {
        errorModel.message = @"responseObj Not a dictionary or array";
        completeHandler(nil,errorModel);
        return;
    }
    
#if XCODE_USER != 8001
    NSLog(@"responseObj: %@", [jsonObj description]);
#endif
    
    if (![jsonObj isKindOfClass:[NSDictionary class]]) {
        errorModel.message = @"responseObj Not a dictionary or array";
        completeHandler(nil,errorModel);
        return;
    }
    
    NSDictionary *responseDic = jsonObj;

    if ([responseDic[@"code"] integerValue] == 1) {
        completeHandler(jsonObj, nil);
    }
    else {
        RWMobStatError *errorModel = [[RWMobStatError alloc] init];
        errorModel.code = [responseDic[@"code"] integerValue
        ];
        errorModel.message = responseDic[@"message"];
        completeHandler(nil, errorModel);
    }
}


- (void)failureWithError:(NSError *)error task:(NSURLSessionDataTask *)task completeHandler:(void(^)(id model, RWMobStatError *errorModel))completeHandler {
    RWMobStatError *errorModel = [[RWMobStatError alloc] init];
    
    errorModel.code = error.code;
    if (completeHandler) {
        completeHandler(nil, errorModel);
    }
}

#pragma mrak - Helper

- (void)printLogWithURLString:(NSString *)strURLString params:(NSDictionary *)dicParams responseObject:(id)respObj error:(NSError *)error {
    NSURL *url = [NSURL URLWithString:strURLString relativeToURL:self.baseURL];
    if (error) {
        NSLog(@"Request URL: %@", url.absoluteString);
        NSLog(@"Params: %@", dicParams);
        NSLog(@"Error: %@", error);
    }
}

@end

@implementation RWNetLoader

{
    _RWNetLoader *loader;
}

- (instancetype)init {
    if (self = [super init]) {
        loader = [[_RWNetLoader alloc] init];
    }
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return loader;
}

- (NSURLSessionDataTask *)uploadMobStatLog:(NSString *)strURL params:(NSDictionary *)dicParams fileData:(NSData *)data fileParam:(NSString *)fileParam completeHandler:(void (^)(id _Nonnull, RWMobStatError * _Nonnull))completeHandler {
    return [loader uploadMobStatLog:strURL params:dicParams fileData:data fileParam:fileParam completeHandler:completeHandler];
}
@end
