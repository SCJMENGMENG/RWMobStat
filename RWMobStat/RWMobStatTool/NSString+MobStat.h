//
//  NSString+MobStat.h
//  ProtobufDemo
//
//  Created by scj on 2022/5/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MobStat)

- (NSString *)md5Hash;

/**
 带子节的string转为NSData
 
 @return NSData类型
 */
-(NSData*) convertBytesStringToData;

/**
 十进制转十六进制
 
 @return 十六进制字符串
 */
- (NSString *)decimalToHex;

/**
 十进制转十六进制
 length   总长度，不足补0
 @return 十六进制字符串
 */
- (NSString *)decimalToHexWithLength:(NSUInteger)length;

/**
 十六进制转十进制
 
 @return 十进制字符串
 */
- (NSString *)hexToDecimal;

/*
 二进制转十进制
 
 @return 十进制字符串
 */
- (NSString *)binaryToDecimal;

/**
 十进制转二进制
 
 @return 二进制字符串
 */
- (NSString *)decimalToBinary;
@end

NS_ASSUME_NONNULL_END
