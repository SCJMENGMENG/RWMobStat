//
//  RWMobStatManager.m
//  RestartProject
//
//  Created by scj on 2022/5/19.
//  Copyright © 2022 Reworld. All rights reserved.
//

#import "RWMobStatManager.h"
#import "RWFileManager.h"
#import "RWNetLoader.h"
#import "RWNetStateManager.h"
#import "RWMobStatModel.pbobjc.h"

#import "NSDictionary+MobStat.h"

#import <UIKit/UIKit.h>
#import <MJExtension/MJExtension.h>

#define kLogNum 20
#define kFileSize (1000 *20.0)

@interface RWMobStatManager()

@property (nonatomic, strong) NSMutableArray *uploadingArray;

//F（前台运行时埋点），B（后台运行时埋点）
@property (nonatomic, copy, nonnull) NSString *unity_sdk_ver;

//日志条数最大20条
@property (nonatomic, assign) NSInteger logNum;

@property (nonatomic, assign) BOOL needMobStat;

@end

@implementation RWMobStatManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _uploadingArray = [NSMutableArray array];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidEnterBackground)
                                                     name:UIApplicationDidEnterBackgroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillEnterForeground)
                                                     name:UIApplicationWillEnterForegroundNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateNotify:) name:kNetWorkStateNotify object:nil];
    }
    
    return self;
}

+ (instancetype)manager
{
    static RWMobStatManager * _sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[RWMobStatManager alloc] init];
    });
    
    return _sharedManager;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)logWithPrivateParams:(NSDictionary *)privateParams {
    if (!privateParams.count) {
        return;
    }
    RWMobStatPrivateParams *model = [self mobStatModelPrivateParams:privateParams];
    if (model) {
        NSData *modelData = [model data];
        BOOL needUpload = [RWFileManager saveMobStatData:modelData publicDic:self.publicParams];
        if (needUpload){
            [self handleWaitingForuploadFiles];
        }
    }
    [self judgeUploadFiles];
}

- (void)logEvent:(NSString * __nonnull)eventId label:(NSString * __nullable)label
{
    if (![eventId length]) {
        return;
    }
    
    RWMobStatPrivateParams *model = [self mobStatModelEvent:eventId label:label];
    if (model) {
        NSData *modelData = [model data];
        BOOL needUpload = [RWFileManager saveMobStatData:modelData publicDic:self.publicParams];
        if (needUpload){
            [self handleWaitingForuploadFiles];
        }
    }
}

- (void)logEvent:(NSString * __nonnull)eventId attributes:(NSDictionary * __nullable)attributes
{
    if (![eventId length]) {
        return;
    }
    
    RWMobStatPrivateParams *model = [self mobStatModelEvent:eventId attributes:attributes];
    if (model) {
        NSData *modelData = [model data];
        BOOL needUpload = [RWFileManager saveMobStatData:modelData publicDic:self.publicParams];
        if (needUpload){
            [self handleWaitingForuploadFiles];
        }
    }
}

- (void)logPage:(NSString * __nonnull)pageId fromPage:(NSString * __nullable)fromPageId
{
    if (![pageId length]) {
        return;
    }
    
    RWMobStatPrivateParams *model = [self mobStatModelPage:pageId fromPage:fromPageId];
    if (model) {
        NSData *modelData = [model data];
        BOOL needUpload = [RWFileManager saveMobStatData:modelData publicDic:self.publicParams];
        if (needUpload){
            [self handleWaitingForuploadFiles];
        }
    }
}

- (RWMobStatPrivateParams *)mobStatModelPrivateParams:(NSDictionary *__nonnull)privateParams {
    RWMobStatPrivateParams *model = [RWMobStatPrivateParams mj_objectWithKeyValues:privateParams];
    model.unitySdkVer = self.unity_sdk_ver ? self.unity_sdk_ver : @"F";
    
    return model;
}

- (RWMobStatPrivateParams *)mobStatModelEvent:(NSString * __nonnull)eventId label:(NSString * __nullable)label
{
    RWMobStatPrivateParams *model = [[RWMobStatPrivateParams alloc] init];
    model.type = @"event";
    model.unitySdkVer = self.unity_sdk_ver ? self.unity_sdk_ver : @"F";
//    model.ctime = (uint64_t)([[NSDate date] timeIntervalSince1970]*1000);
//    model.eventId = eventId;
//    if ([label length]) {
//        model.eventLabel = label;
//    }
//    if (self.userIDBlock) {
//        NSString *id = self.userIDBlock();
//        model.userId = id;
//    }
    return model;
}

- (RWMobStatPrivateParams *)mobStatModelEvent:(NSString * __nonnull)eventId attributes:(NSDictionary * __nullable)attributes
{
    RWMobStatPrivateParams *model = [[RWMobStatPrivateParams alloc] init];
    model.type = @"event";
    model.unitySdkVer = self.unity_sdk_ver ? self.unity_sdk_ver : @"F";
//    model.ctime = (uint64_t)([[NSDate date] timeIntervalSince1970]*1000);
//    model.eventId = eventId;
//    if (attributes) {
//        model.eventAttributes = [attributes copy];
//    }
//    if (self.userIDBlock) {
//        NSString *id = self.userIDBlock();
//        model.userId = id;
//    }
    return model;
}

- (RWMobStatPrivateParams *)mobStatModelPage:(NSString * __nonnull)pageId fromPage:(NSString * __nullable)fromPageId
{
    RWMobStatPrivateParams *model = [[RWMobStatPrivateParams alloc] init];
    model.type = @"page";
    model.unitySdkVer = self.unity_sdk_ver ? self.unity_sdk_ver : @"F";
//    model.ctime = (uint64_t)([[NSDate date] timeIntervalSince1970]*1000);
//    model.pageId = pageId;
//    if ([fromPageId length]) {
//        model.fromPageId = fromPageId;
//    }
//    if (self.userIDBlock) {
//        NSString *id = self.userIDBlock();
//        model.userId = id;
//    }
    return model;
}

- (void)applicationDidEnterBackground
{
    self.unity_sdk_ver = @"B";
    [self handleWaitingForuploadFiles];
}

- (void)applicationWillEnterForeground
{
    self.unity_sdk_ver = @"F";
    [self handleWaitingForuploadFiles];
}

- (void)networkStateNotify:(NSNotification *)notify {
    RWNetState netState = [notify.object intValue];
    //无网
    if (netState == RWNetState_NotReachable) {
        self.needMobStat = YES;
    }
    else {
        if (!self.needMobStat) {
            return;
        }
        self.needMobStat = NO;
        [self handleWaitingForuploadFiles];
    }
}

- (void)judgeUploadFiles {
    self.logNum ++;
    //超过20条
    if (self.logNum >= 20) {
        [self handleWaitingForuploadFiles];
    }
}

- (void)handleWaitingForuploadFiles
{
    self.logNum = 0;
    [RWFileManager checkAndMoveToDirPathOfWaitingUploadFiles];
    
    NSString *dirPath = [RWFileManager dirPathOfWaitingUploadFiles];
    if (!dirPath) {
        return;
    }
    
    NSFileManager *fileManager = [NSFileManager new];
    NSError *error;
    NSArray *filePaths = [fileManager subpathsOfDirectoryAtPath:dirPath error:&error];
    if (error || ![filePaths count]) {
        return;
    }
    
    [filePaths enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([_uploadingArray containsObject:obj]) {
            return;
        }
        
        NSString *path = [dirPath stringByAppendingPathComponent:obj];
        BOOL isDir;
        BOOL fileExisted = [fileManager fileExistsAtPath:path isDirectory:&isDir];
        if (!isDir && fileExisted) {
            [_uploadingArray addObject:obj];
            
            NSString *size = [NSString stringWithFormat:@"%llu",[self sizeAtPath:path]];
            
            NSData *data = [NSData dataWithContentsOfFile:path];
            
            NSString *url = [RWMobStatManager manager].uploadUrl;//@"https://betadataapi.reworlder.com/data/pub/app/bigdata/v1/async/batch/log?";
            
            NSMutableDictionary *dic = self.publicParams.mutableCopy;
            [dic setValue:size forKey:@"fileSize"];
            NSDictionary *params = [dic md5CodeSignWithKey:self.rw_initKey];
            
            NSArray *array = [params allKeys];
            for (int i = 0; i< array.count; i++) {
                url = [url stringByAppendingString:[NSString stringWithFormat:@"%@=%@&",array[i],[params objectForKey:array[i]]]];
            }
            url = [url substringToIndex:url.length-1];
            url = [url stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
            
            [[[RWNetLoader alloc] init] uploadMobStatLog:url params:@{} fileData:data fileParam:path completeHandler:^(id  _Nonnull model, RWMobStatError * _Nonnull errorModel) {
                NSLog(@"");
                if ([model[@"code"] integerValue] == 1) {
                    [self->_uploadingArray removeObject:obj];
                    [RWFileManager removeLogFilePath:path];
                }
            }];
        }
    }];
}

//文件的大小(字节)
- (unsigned long long)sizeAtPath:(NSString *)filePath {
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

@end
