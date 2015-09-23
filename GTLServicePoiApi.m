/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2015 Google Inc.
 */

//
//  GTLServicePoiApi.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   poiApi/v1
// Description:
//   This is an API
// Classes:
//   GTLServicePoiApi (0 custom class methods, 0 custom properties)

#import "GTLPoiApi.h"

@implementation GTLServicePoiApi

#if DEBUG
// Method compiled in debug builds just to check that all the needed support
// classes are present at link time.
+ (NSArray *)checkClasses {
  NSArray *classes = @[
    [GTLQueryPoiApi class],
    [GTLPoiApiImageUploadUrlBean class],
    [GTLPoiApiPoiCreateBean class],
    [GTLPoiApiPoiDetailBean class],
    [GTLPoiApiPoiOverviewBean class],
    [GTLPoiApiPoiOverviewListBean class]
  ];
  return classes;
}
#endif  // DEBUG

- (instancetype)init {
  self = [super init];
  if (self) {
    // Version from discovery.
    self.apiVersion = @"v1";

    // From discovery.  Where to send JSON-RPC.
    // Turn off prettyPrint for this service to save bandwidth (especially on
    // mobile). The fetcher logging will pretty print.
    self.rpcURL = [NSURL URLWithString:@"http://192.168.160.2:8080/_ah/api/"];
      //https://myApplicationId.appspot.com/_ah/api/rpc?prettyPrint=false
  }
  return self;
}

@end
