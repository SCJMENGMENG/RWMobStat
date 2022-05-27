// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: RWMobStatModel.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import "RWMobStatModel.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdollar-in-identifier-extension"

#pragma mark - Objective C Class declarations
// Forward declarations of Objective C classes that we can use as
// static values in struct initializers.
// We don't use [Foo class] because it is not a static value.
GPBObjCClassDeclaration(RWMobStatPrivateParams);

#pragma mark - RWMobStatModelRoot

@implementation RWMobStatModelRoot

// No extensions in the file and no imports, so no need to generate
// +extensionRegistry.

@end

#pragma mark - RWMobStatModelRoot_FileDescriptor

static GPBFileDescriptor *RWMobStatModelRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@""
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - RWMobStatPublicParams

@implementation RWMobStatPublicParams

@dynamic deviceId;
@dynamic adId;
@dynamic appVer;
@dynamic osType;
@dynamic osVer;
@dynamic deviceName;
@dynamic uuid;
@dynamic imei;
@dynamic oaid;
@dynamic adsId;
@dynamic mac2;
@dynamic umengDeviceToken;
@dynamic argoId;
@dynamic androidId;
@dynamic idfa;

typedef struct RWMobStatPublicParams__storage_ {
  uint32_t _has_storage_[1];
  NSString *deviceId;
  NSString *adId;
  NSString *appVer;
  NSString *osType;
  NSString *osVer;
  NSString *deviceName;
  NSString *uuid;
  NSString *imei;
  NSString *oaid;
  NSString *adsId;
  NSString *mac2;
  NSString *umengDeviceToken;
  NSString *argoId;
  NSString *androidId;
  NSString *idfa;
} RWMobStatPublicParams__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "deviceId",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_DeviceId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, deviceId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "adId",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_AdId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, adId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "appVer",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_AppVer,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, appVer),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "osType",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_OsType,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, osType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "osVer",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_OsVer,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, osVer),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceName",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_DeviceName,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, deviceName),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "uuid",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_Uuid,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, uuid),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "imei",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_Imei,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, imei),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "oaid",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_Oaid,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, oaid),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "adsId",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_AdsId,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, adsId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "mac2",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_Mac2,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, mac2),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "umengDeviceToken",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_UmengDeviceToken,
        .hasIndex = 11,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, umengDeviceToken),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "argoId",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_ArgoId,
        .hasIndex = 12,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, argoId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "androidId",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_AndroidId,
        .hasIndex = 13,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, androidId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "idfa",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPublicParams_FieldNumber_Idfa,
        .hasIndex = 14,
        .offset = (uint32_t)offsetof(RWMobStatPublicParams__storage_, idfa),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RWMobStatPublicParams class]
                                     rootClass:[RWMobStatModelRoot class]
                                          file:RWMobStatModelRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RWMobStatPublicParams__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\013\001\010\000\002\004\000\003\006\000\004\006\000\005\005\000\006\n\000\n\005\000\013c\001\000\014\020\000\r\006\000\016\t\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - RWMobStatPrivateParams

@implementation RWMobStatPrivateParams

@dynamic type;
@dynamic version;
@dynamic userCode;
@dynamic pidSid;
@dynamic flag;
@dynamic os;
@dynamic mac;
@dynamic eventAttributes, eventAttributes_Count;
@dynamic lang;
@dynamic token;
@dynamic unitySdkVer;
@dynamic selfUserCode;
@dynamic selfOpenid;
@dynamic ts;
@dynamic sid;
@dynamic timegap;
@dynamic getornot;
@dynamic mapId;

typedef struct RWMobStatPrivateParams__storage_ {
  uint32_t _has_storage_[1];
  NSString *type;
  NSString *version;
  NSString *userCode;
  NSString *pidSid;
  NSString *flag;
  NSString *os;
  NSString *mac;
  NSMutableDictionary *eventAttributes;
  NSString *lang;
  NSString *token;
  NSString *unitySdkVer;
  NSString *selfUserCode;
  NSString *selfOpenid;
  NSString *ts;
  NSString *sid;
  NSString *timegap;
  NSString *getornot;
  NSString *mapId;
} RWMobStatPrivateParams__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "type",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_Type,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, type),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "version",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_Version,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, version),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "userCode",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_UserCode,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, userCode),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "pidSid",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_PidSid,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, pidSid),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "flag",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_Flag,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, flag),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "os",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_Os,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, os),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "mac",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_Mac,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, mac),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "eventAttributes",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_EventAttributes,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, eventAttributes),
        .flags = GPBFieldMapKeyString,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "lang",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_Lang,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, lang),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "token",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_Token,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, token),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "unitySdkVer",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_UnitySdkVer,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, unitySdkVer),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "selfUserCode",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_SelfUserCode,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, selfUserCode),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "selfOpenid",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_SelfOpenid,
        .hasIndex = 11,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, selfOpenid),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "ts",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_Ts,
        .hasIndex = 12,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, ts),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sid",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_Sid,
        .hasIndex = 13,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, sid),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "timegap",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_Timegap,
        .hasIndex = 14,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, timegap),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "getornot",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_Getornot,
        .hasIndex = 15,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, getornot),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "mapId",
        .dataTypeSpecific.clazz = Nil,
        .number = RWMobStatPrivateParams_FieldNumber_MapId,
        .hasIndex = 16,
        .offset = (uint32_t)offsetof(RWMobStatPrivateParams__storage_, mapId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RWMobStatPrivateParams class]
                                     rootClass:[RWMobStatModelRoot class]
                                          file:RWMobStatModelRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RWMobStatPrivateParams__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\006\003\010\000\004\006\000\014\014\000\r\n\000\017\203\000\022\005\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
