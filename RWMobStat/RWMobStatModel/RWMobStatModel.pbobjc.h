// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: RWMobStatModel.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30004
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30004 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

NS_ASSUME_NONNULL_BEGIN

#pragma mark - RWMobStatModelRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
GPB_FINAL @interface RWMobStatModelRoot : GPBRootObject
@end

#pragma mark - RWMobStatPublicParams

typedef GPB_ENUM(RWMobStatPublicParams_FieldNumber) {
  RWMobStatPublicParams_FieldNumber_DeviceId = 1,
  RWMobStatPublicParams_FieldNumber_AdId = 2,
  RWMobStatPublicParams_FieldNumber_AppVer = 3,
  RWMobStatPublicParams_FieldNumber_OsType = 4,
  RWMobStatPublicParams_FieldNumber_OsVer = 5,
  RWMobStatPublicParams_FieldNumber_DeviceName = 6,
  RWMobStatPublicParams_FieldNumber_Uuid = 7,
  RWMobStatPublicParams_FieldNumber_Imei = 8,
  RWMobStatPublicParams_FieldNumber_Oaid = 9,
  RWMobStatPublicParams_FieldNumber_AdsId = 10,
  RWMobStatPublicParams_FieldNumber_Mac2 = 11,
  RWMobStatPublicParams_FieldNumber_UmengDeviceToken = 12,
  RWMobStatPublicParams_FieldNumber_ArgoId = 13,
  RWMobStatPublicParams_FieldNumber_AndroidId = 14,
  RWMobStatPublicParams_FieldNumber_Idfa = 15,
};

GPB_FINAL @interface RWMobStatPublicParams : GPBMessage

/** 设备号，除非用户卸载APP，否则取值不应变化 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *deviceId;

/** 推广id（渠道） */
@property(nonatomic, readwrite, copy, null_resettable) NSString *adId;

/** 版本号 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *appVer;

/** 03官网;05编辑器；08安卓；09ios； */
@property(nonatomic, readwrite, copy, null_resettable) NSString *osType;

/** 操作系统版本号如ios11 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *osVer;

/** 设备名字 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *deviceName;

/** 内部设备ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *uuid;

/** 序列号 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *imei;

/** 移动安全联盟 设备唯一标识 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *oaid;

/** Google广告ID（ads'I'd，I为大写的i） */
@property(nonatomic, readwrite, copy, null_resettable) NSString *adsId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *mac2;

@property(nonatomic, readwrite, copy, null_resettable) NSString *umengDeviceToken;

@property(nonatomic, readwrite, copy, null_resettable) NSString *argoId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *androidId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *idfa;

@end

#pragma mark - RWMobStatPrivateParams

typedef GPB_ENUM(RWMobStatPrivateParams_FieldNumber) {
  RWMobStatPrivateParams_FieldNumber_Type = 1,
  RWMobStatPrivateParams_FieldNumber_Version = 2,
  RWMobStatPrivateParams_FieldNumber_UserCode = 3,
  RWMobStatPrivateParams_FieldNumber_PidSid = 4,
  RWMobStatPrivateParams_FieldNumber_Flag = 5,
  RWMobStatPrivateParams_FieldNumber_Os = 6,
  RWMobStatPrivateParams_FieldNumber_Mac = 7,
  RWMobStatPrivateParams_FieldNumber_EventAttributes = 8,
  RWMobStatPrivateParams_FieldNumber_Lang = 9,
  RWMobStatPrivateParams_FieldNumber_Token = 10,
  RWMobStatPrivateParams_FieldNumber_UnitySdkVer = 11,
  RWMobStatPrivateParams_FieldNumber_SelfUserCode = 12,
  RWMobStatPrivateParams_FieldNumber_SelfOpenid = 13,
  RWMobStatPrivateParams_FieldNumber_Ts = 14,
  RWMobStatPrivateParams_FieldNumber_Sid = 15,
  RWMobStatPrivateParams_FieldNumber_Timegap = 16,
  RWMobStatPrivateParams_FieldNumber_Getornot = 17,
  RWMobStatPrivateParams_FieldNumber_MapId = 18,
};

GPB_FINAL @interface RWMobStatPrivateParams : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *type;

@property(nonatomic, readwrite, copy, null_resettable) NSString *version;

@property(nonatomic, readwrite, copy, null_resettable) NSString *userCode;

@property(nonatomic, readwrite, copy, null_resettable) NSString *pidSid;

@property(nonatomic, readwrite, copy, null_resettable) NSString *flag;

@property(nonatomic, readwrite, copy, null_resettable) NSString *os;

/** mac 地址 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *mac;

/** ext01 ext02 拓展字段 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableDictionary<NSString*, NSString*> *eventAttributes;
/** The number of items in @c eventAttributes without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger eventAttributes_Count;

/** 语言参数 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *lang;

@property(nonatomic, readwrite, copy, null_resettable) NSString *token;

/** "埋点上报时客户端状态：F（前台运行时埋点），B（后台运行时埋点） */
@property(nonatomic, readwrite, copy, null_resettable) NSString *unitySdkVer;

/** 用户code */
@property(nonatomic, readwrite, copy, null_resettable) NSString *selfUserCode;

/** 用户外部ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *selfOpenid;

/** 发起请求时间戳 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *ts;

/** 会话ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *sid;

/** 开启游戏时间 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *timegap;

/** 标示host请求请求成功失败的 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *getornot;

/** 游戏地图id，unity使用，android 当前为常量"0" */
@property(nonatomic, readwrite, copy, null_resettable) NSString *mapId;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
