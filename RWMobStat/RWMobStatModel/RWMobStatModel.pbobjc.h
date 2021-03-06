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

#pragma mark - RwmobStatModelRoot

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
GPB_FINAL @interface RwmobStatModelRoot : GPBRootObject
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

/** ??????????????????????????????APP??????????????????????????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *deviceId;

/** ??????id???????????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *adId;

/** ????????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *appVer;

/** 03??????;05????????????08?????????09ios??? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *osType;

/** ????????????????????????ios11 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *osVer;

/** ???????????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *deviceName;

/** ????????????ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *uuid;

/** ????????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *imei;

/** ?????????????????? ?????????????????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *oaid;

/** Google??????ID???ads'I'd???I????????????i??? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *adsId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *mac2;

/** umeng?????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *umengDeviceToken;

/** IOS???????????? ???????????????id */
@property(nonatomic, readwrite, copy, null_resettable) NSString *argoId;

/** ?????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *androidId;

/** iOS?????????????????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *idfa;

@end

#pragma mark - RWMobStatPrivateParams

typedef GPB_ENUM(RWMobStatPrivateParams_FieldNumber) {
  RWMobStatPrivateParams_FieldNumber_Type = 1,
  RWMobStatPrivateParams_FieldNumber_UserCode = 2,
  RWMobStatPrivateParams_FieldNumber_OpenId = 3,
  RWMobStatPrivateParams_FieldNumber_Flag = 4,
  RWMobStatPrivateParams_FieldNumber_Os = 5,
  RWMobStatPrivateParams_FieldNumber_Mac = 6,
  RWMobStatPrivateParams_FieldNumber_Lang = 7,
  RWMobStatPrivateParams_FieldNumber_Token = 8,
  RWMobStatPrivateParams_FieldNumber_UnitySdkVer = 9,
  RWMobStatPrivateParams_FieldNumber_SelfUserCode = 10,
  RWMobStatPrivateParams_FieldNumber_SelfOpenid = 11,
  RWMobStatPrivateParams_FieldNumber_Ts = 12,
  RWMobStatPrivateParams_FieldNumber_Sid = 13,
  RWMobStatPrivateParams_FieldNumber_MapId = 14,
  RWMobStatPrivateParams_FieldNumber_EventAttributes = 15,
};

GPB_FINAL @interface RWMobStatPrivateParams : GPBMessage

/** ???????????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *type;

/** userCode */
@property(nonatomic, readwrite, copy, null_resettable) NSString *userCode;

/** openId */
@property(nonatomic, readwrite, copy, null_resettable) NSString *openId;

/** 0??????????????? 1?????????iOS 2?????????web??? 3??????????????? 4?????????iOS */
@property(nonatomic, readwrite, copy, null_resettable) NSString *flag;

/** ????????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *os;

/** mac ?????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *mac;

/** ???????????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *lang;

/** token */
@property(nonatomic, readwrite, copy, null_resettable) NSString *token;

/** "?????????????????????????????????F??????????????????????????????B??????????????????????????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *unitySdkVer;

/** ??????code */
@property(nonatomic, readwrite, copy, null_resettable) NSString *selfUserCode;

/** ????????????ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *selfOpenid;

/** ????????????????????? */
@property(nonatomic, readwrite, copy, null_resettable) NSString *ts;

/** ??????ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *sid;

/** ????????????id???unity?????????android ???????????????"0" */
@property(nonatomic, readwrite, copy, null_resettable) NSString *mapId;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableDictionary<NSString*, NSString*> *eventAttributes;
/** The number of items in @c eventAttributes without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger eventAttributes_Count;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
