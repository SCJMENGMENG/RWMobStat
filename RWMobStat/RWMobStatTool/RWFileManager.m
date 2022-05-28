//
//  RWFileManager.m
//  RestartProject
//
//  Created by scj on 2022/5/19.
//  Copyright © 2022 Reworld. All rights reserved.
//

#import "RWFileManager.h"
#import "RWMobStatModel.pbobjc.h"

#import "NSData+MobStat.h"
#import "NSString+MobStat.h"

#import <MJExtension/MJExtension.h>

#define kFileSize (1000 *20.0)
#define kByteNum    4

@implementation RWFileManager
 
/**
 * save mob state data
 *
 * @param data  mob state data
 *
 * @return （BOOL） result
 **/
+ (BOOL)saveMobStatData:(NSData * __nonnull)data publicDic:(NSDictionary *)publicDic
{
    //1数据转换
    //2无文件？取header创建
    //3添加数据
    //4满了？迁移 删除
    
    //1数据转换
    if (data.length <= 0) {
        return NO;
    }
    
///MARK: 4字节(公参数据长度)+公参数据+4字节(埋点数据长度)+埋点数据+4字节(埋点数据长度)+埋点数据...
    NSMutableData * dataPlus = [RWFileManager data4Length:data.length];
    [dataPlus appendData:data];
    
    //2无文件？取header创建
    NSString *logSavePath = [RWFileManager logSavePath];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if  (![fileManager fileExistsAtPath:logSavePath])
    {//先判断目录是否存在，不存在 以公参信息创建文件
        NSData *mobData = [[RWMobStatPublicParams mj_objectWithKeyValues:publicDic] data];
        if (!mobData.length) {
            return NO;
        }
        NSMutableData *dataPlus = [RWFileManager data4Length:mobData.length];
        [dataPlus appendData:mobData];
        BOOL res = [fileManager createFileAtPath:logSavePath contents:dataPlus attributes:nil];
        
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
    
    assert(fileHandle);
    [fileHandle closeFile]; //先关闭 fileHandle
    
    
    //4满了？迁移 删除 注意：必要的话加同步
    if (length > kFileSize) {//20k 然后再检查迁移
//        [RWFileManager checkAndMoveToDirPathOfWaitingUploadFiles];
        return YES;
    }
    
    return NO;
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
    Byte bytes[kByteNum];
    //int mask=0xff;
    for(int i = 0 ; i < kByteNum ; i++){
        bytes[i] = (Byte)(len >> (24-i*8));
    }
    NSMutableData *data = [NSMutableData dataWithBytes:bytes length:kByteNum];
    return data;
}

+ (NSArray *)inverseParsingWithPath:(NSString *)path {
    NSMutableData *pathData = [NSMutableData dataWithContentsOfFile:path];
    
    BOOL isPublic = YES;
    NSMutableArray *dataArr = [NSMutableArray new];
    
    //循环取出埋点数据
    while (pathData.length >= 4) {
        //存放单次埋点数据长度的4字节数据
        NSData *lengthData = [pathData subdataWithRange:NSMakeRange(0, kByteNum)];
        [pathData replaceBytesInRange:NSMakeRange(0, kByteNum) withBytes:NULL length:0];
        
        //获取单次埋点数据长度
        NSString* hexString = [lengthData convertDataToHexStr];
        NSInteger dataLength = [[hexString hexToDecimal] integerValue];
        
        //单次埋点数据
        NSData *mobStatData = [pathData subdataWithRange:NSMakeRange(0, dataLength)];
        [pathData replaceBytesInRange:NSMakeRange(0, dataLength) withBytes:NULL length:0];
        
        NSError *error;
        if (isPublic) {
            isPublic = NO;
            RWMobStatPublicParams *publicParams = [RWMobStatPublicParams parseFromData:mobStatData error:&error];
            if (error) {
                break;
            }
            [dataArr addObject:publicParams];
        }
        else {
            RWMobStatPrivateParams *privateParams = [RWMobStatPrivateParams parseFromData:mobStatData error:&error];
            if (error) {
                break;
            }
            [dataArr addObject:privateParams];
        }
    }
    return [NSArray arrayWithArray:dataArr];
}

@end
