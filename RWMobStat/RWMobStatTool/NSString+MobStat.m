//
//  NSString+MobStat.m
//  ProtobufDemo
//
//  Created by 宋高杰 on 2022/5/26.
//

#import "NSString+MobStat.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonHMAC.h>

@implementation NSString (MobStat)

#pragma mark - md5
- (NSString *)md5Hash {
    const char *plain = self.UTF8String;
    unsigned char *digest;
    digest = malloc(CC_SHA1_DIGEST_LENGTH);
    
    CC_MD5(plain, (CC_LONG)strlen(plain), digest);
    
    NSString *encode = [self stringFromBytes:digest length:CC_MD5_DIGEST_LENGTH];
    free(digest);
    return encode;
}

#pragma mark - Bytes转字符串
/// 字符大小写可以通过修改“%02X”中的x修改,下面采用的是大写
- (NSString *)stringFromBytes:(uint8_t *)bytes length:(int)length {
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02X", bytes[i]];
    }
    
    return [strM copy];
}
@end
