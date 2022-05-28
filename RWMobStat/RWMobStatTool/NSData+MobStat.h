//
//  NSData+MobStat.h
//  RestartProject
//
//  Created by scj on 2022/5/28.
//  Copyright © 2022 Reworld. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (MobStat)

/**
 NSData 转  十六进制string
 
 @return NSString类型的十六进制string
 */
- (NSString *)convertDataToHexStr;

/**
 NSData 转 NSString
 
 @return NSString类型的字符串
 */
- (NSString *)dataToString;
@end

NS_ASSUME_NONNULL_END
