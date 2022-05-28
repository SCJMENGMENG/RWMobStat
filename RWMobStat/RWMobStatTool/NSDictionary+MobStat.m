//
//  NSDictionary+MobStat.m
//  ProtobufDemo
//
//  Created by scj on 2022/5/26.
//

#import "NSDictionary+MobStat.h"
#import "NSString+MobStat.h"

@implementation NSDictionary (MobStat)

- (NSDictionary *)md5CodeSignWithKey:(NSString *)key {
    
    NSMutableDictionary *dict = [self mutableCopy];
    
    NSArray *allKeyArray = [dict allKeys];
    NSArray *afterSortKeyArray = [allKeyArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSComparisonResult resuest = [obj1 compare:obj2];
        return resuest;
    }];
    
    NSMutableArray *valueArray = [NSMutableArray array];
    for (NSString *sortsing in afterSortKeyArray) {
        NSString *valueString = [NSString stringWithFormat:@"%@=%@",sortsing,[dict objectForKey:sortsing]];
        [valueArray addObject:valueString];
    }
    
    NSMutableString *signString = [NSMutableString string];
    for (int i = 0; i < afterSortKeyArray.count; i++) {
        NSString *keyValue = [NSString stringWithFormat:@"%@&",valueArray[i]];
        [signString appendString:keyValue];
    }
    
    [signString appendString:key];
    dict[@"sign"] = [signString md5Hash];

    return dict;
}

@end
