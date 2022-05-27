//
//  RWFileManager.h
//  RestartProject
//
//  Created by scj on 2022/5/19.
//  Copyright © 2022 Reworld. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RWFileManager : NSObject

/**
 * save mob state data
 *
 * @param data  mob state data
 *
 * @return （BOOL） result
 **/
+ (BOOL)saveMobStatData:(NSData * __nonnull)data;

/**
 * get log upload file path
 *
 * @return （NSString*) a file path string
 **/
+ (NSString * __nullable)dirPathOfWaitingUploadFiles;

/**
 * check and move log file to waitingupload file
 *
 * @return （BOOL） result
 **/
+ (BOOL)checkAndMoveToDirPathOfWaitingUploadFiles;

/**
 * remove log file
 *
 * @param filePath  a file path
 *
 * @return （BOOL） result
 **/
+ (BOOL)removeLogFilePath:(NSString * __nonnull)filePath;
@end

NS_ASSUME_NONNULL_END
