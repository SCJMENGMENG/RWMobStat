//
//  RWFileManager.m
//  RestartProject
//
//  Created by scj on 2022/5/19.
//  Copyright © 2022 Reworld. All rights reserved.
//

#import "RWFileManager.h"

#define kFileSize (1000 *20.0)

@implementation RWFileManager
 
/**
 * save mob state data
 *
 * @param data  mob state data
 *
 * @return （BOOL） result
 **/
+ (BOOL)saveMobStatData:(NSData * __nonnull)data
{
    //1数据转换
    //2无文件？取header创建
    //3添加数据
    //4满了？迁移 删除
    
    //1数据转换
    if (data.length <= 0) {
        return NO;
    }
    NSMutableData * dataPlus = [RWFileManager data4Length:data.length];
    [dataPlus appendData:data];
    
    
    //2无文件？取header创建
    NSString *logSavePath = [RWFileManager logSavePath];
    BOOL res = YES;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if  (![fileManager fileExistsAtPath:logSavePath])
    {//先判断目录是否存在，不存在 以公参信息创建文件
        NSData *mobData = [[RWMobStatPublicParams mj_objectWithKeyValues:[RWMobStatManager manager].publicParams] data];
        if (!mobData.length) {
            return NO;
        }
        NSMutableData *dataPlus = [RWFileManager data4Length:mobData.length];
        [dataPlus appendData:mobData];
        res = [fileManager createFileAtPath:logSavePath contents:dataPlus attributes:nil];
        
//        NSMutableData *bb = [[NSMutableData alloc] initWithData:dataPlus];
//        [bb replaceBytesInRange:NSMakeRange(0, 4) withBytes:NULL length:0];
//        
//        RWMobStatPublicParams * para = [RWMobStatPublicParams parseFromData:mobData error:nil];
//        RWMobStatPublicParams * para4 = [RWMobStatPublicParams parseFromData:bb error:nil];
        if (!res) {
            return NO;
        }
    }
    
    
    //3添加数据
    //打开fileHandle用于更新操作
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:logSavePath];
    if (!fileHandle) {
        return NO;
    }
    //找到并定位到fileHandle的末尾位置(在此后追加写入文件)
    unsigned long long length = [fileHandle seekToEndOfFile];
    //将data写到fileHandle中
    [fileHandle writeData:dataPlus];
    
//    NSMutableData *bb = [[NSMutableData alloc] initWithData:dataPlus];
//    [bb replaceBytesInRange:NSMakeRange(0, 4) withBytes:NULL length:0];
//
//    RWMobStatPrivateParams * para = [RWMobStatPrivateParams parseFromData:data error:nil];
//    RWMobStatPrivateParams * para4 = [RWMobStatPrivateParams parseFromData:bb error:nil];
    
    assert(fileHandle);
    [fileHandle closeFile]; //先关闭 fileHandle
    
    
    //4满了？迁移 删除 注意：必要的话加同步
    if (length > kFileSize) {//20k 然后再检查迁移
//        [RWFileManager checkAndMoveToDirPathOfWaitingUploadFiles];
        [[RWMobStatManager manager] handleWaitingForuploadFiles];
    }
    
    return res;
}

/**
 * get log save file path
 *
 * @return （NSString*) a file path string
 **/
+ (NSString *)logSavePath
{
    NSString *logUploadFilePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"rw_log"];
    return logUploadFilePath;
}


/**
 * get log upload file path
 *
 * @return （NSString*) a file path string
 **/
+ (NSString * __nullable)dirPathOfWaitingUploadFiles
{
    NSString *logUploadFilePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"rw_logs_up"];
    return logUploadFilePath;
}


/**
 * check and move log file to waitingupload file
 *
 * @return （BOOL） result
 **/
+ (BOOL)checkAndMoveToDirPathOfWaitingUploadFiles
{
    BOOL res = YES;
    NSString *logSavePath = [RWFileManager logSavePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:logSavePath]) {
        return NO;
    }
    
    long long tsp = [[NSDate date] timeIntervalSince1970] * 1000;
    NSString *newName = [NSString stringWithFormat:@"%lld",tsp];
    NSString *logUploadFilePath = [RWFileManager dirPathOfWaitingUploadFiles];
    
    BOOL isDir = YES;
    if (![fileManager fileExistsAtPath:logUploadFilePath isDirectory:&isDir])             {
        [fileManager createDirectoryAtPath:logUploadFilePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *newPath = [logUploadFilePath stringByAppendingPathComponent:newName];
    res = [fileManager moveItemAtPath:logSavePath toPath:newPath error:NULL];
    
    return res;
}


/**
 * remove log file
 *
 * @param filePath  a file path
 *
 * @return （BOOL） result
 **/
+ (BOOL)removeLogFilePath:(NSString * __nonnull)filePath
{
    BOOL res = [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    return res;
}


+ (NSMutableData *)data4Length:(NSUInteger)len {
    //用4个字节接收
    Byte bytes[4];
    //int mask=0xff;
    for(int i = 0 ; i < 4 ; i++){
        bytes[i] = (Byte)(len >> (24-i*8));
    }
    NSMutableData *data = [NSMutableData dataWithBytes:bytes length:4];
    return data;
}
@end
