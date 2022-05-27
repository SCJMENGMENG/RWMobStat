//
//  NSDictionary+MobStat.h
//  ProtobufDemo
//
//  Created by 宋高杰 on 2022/5/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (MobStat)

- (NSDictionary *)md5CodeSignWithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
