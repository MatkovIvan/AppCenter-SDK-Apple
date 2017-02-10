/*
 * Copyright (c) Microsoft Corporation. All rights reserved.
 */

#import "MSWrapperSdk.h"
#import "MSWrapperSdkPrivate.h"

static NSString *const kMSWrapperSdkVersion = @"wrapper_sdk_version";
static NSString *const kMSWrapperSdkName = @"wrapper_sdk_name";
static NSString *const kMSLiveUpdateReleaseLabel = @"live_update_release_label";
static NSString *const kMSLiveUpdateDeploymentKey = @"live_update_deployment_key";
static NSString *const kMSLiveUpdatePackageHash = @"live_update_package_hash";

@implementation MSWrapperSdk

- (instancetype)initWithWrapperSdkVersion:(NSString *)wrapperSdkVersion
                           wrapperSdkName:(NSString *)wrapperSdkName
                   liveUpdateReleaseLabel:(NSString *)liveUpdateReleaseLabel
                  liveUpdateDeploymentKey:(NSString *)liveUpdateDeploymentKey
                    liveUpdatePackageHash:(NSString *)liveUpdatePackageHash {
  self = [super init];
  if (self) {
    _wrapperSdkVersion = wrapperSdkVersion;
    _wrapperSdkName = wrapperSdkName;
    _liveUpdateReleaseLabel = liveUpdateReleaseLabel;
    _liveUpdateDeploymentKey = liveUpdateDeploymentKey;
    _liveUpdatePackageHash = liveUpdatePackageHash;
  }
  return self;
}

- (NSMutableDictionary *)serializeToDictionary {
  NSMutableDictionary *dict = [NSMutableDictionary new];

  if (self.wrapperSdkVersion) {
    dict[kMSWrapperSdkVersion] = self.wrapperSdkVersion;
  }
  if (self.wrapperSdkName) {
    dict[kMSWrapperSdkName] = self.wrapperSdkName;
  }
  if (self.liveUpdateReleaseLabel) {
    dict[kMSLiveUpdateReleaseLabel] = self.liveUpdateReleaseLabel;
  }
  if (self.liveUpdateDeploymentKey) {
    dict[kMSLiveUpdateDeploymentKey] = self.liveUpdateDeploymentKey;
  }
  if (self.liveUpdatePackageHash) {
    dict[kMSLiveUpdatePackageHash] = self.liveUpdatePackageHash;
  }
  return dict;
}

- (BOOL)isEqual:(MSWrapperSdk *)wrapperSdk {

  if (!wrapperSdk)
    return NO;

  return ((!self.wrapperSdkVersion && !wrapperSdk.wrapperSdkVersion) ||
          [self.wrapperSdkVersion isEqualToString:wrapperSdk.wrapperSdkVersion]) &&
         ((!self.wrapperSdkName && !wrapperSdk.wrapperSdkName) ||
          [self.wrapperSdkName isEqualToString:wrapperSdk.wrapperSdkName]) &&
         ((!self.liveUpdateReleaseLabel && !wrapperSdk.liveUpdateReleaseLabel) ||
          [self.liveUpdateReleaseLabel isEqualToString:wrapperSdk.liveUpdateReleaseLabel]) &&
         ((!self.liveUpdateDeploymentKey && !wrapperSdk.liveUpdateDeploymentKey) ||
          [self.liveUpdateDeploymentKey isEqualToString:wrapperSdk.liveUpdateDeploymentKey]) &&
         ((!self.liveUpdatePackageHash && !wrapperSdk.liveUpdatePackageHash) ||
          [self.liveUpdatePackageHash isEqualToString:wrapperSdk.liveUpdatePackageHash]);
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder {
  self = [super init];
  if (self) {
    _wrapperSdkVersion = [coder decodeObjectForKey:kMSWrapperSdkVersion];
    _wrapperSdkName = [coder decodeObjectForKey:kMSWrapperSdkName];
    _liveUpdateReleaseLabel = [coder decodeObjectForKey:kMSLiveUpdateReleaseLabel];
    _liveUpdateDeploymentKey = [coder decodeObjectForKey:kMSLiveUpdateDeploymentKey];
    _liveUpdatePackageHash = [coder decodeObjectForKey:kMSLiveUpdatePackageHash];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
  [coder encodeObject:self.wrapperSdkVersion forKey:kMSWrapperSdkVersion];
  [coder encodeObject:self.wrapperSdkName forKey:kMSWrapperSdkName];
  [coder encodeObject:self.liveUpdateReleaseLabel forKey:kMSLiveUpdateReleaseLabel];
  [coder encodeObject:self.liveUpdateDeploymentKey forKey:kMSLiveUpdateDeploymentKey];
  [coder encodeObject:self.liveUpdatePackageHash forKey:kMSLiveUpdatePackageHash];
}

@end
