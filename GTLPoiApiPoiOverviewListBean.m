/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2015 Google Inc.
 */

//
//  GTLPoiApiPoiOverviewListBean.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   poiApi/v1
// Description:
//   This is an API
// Classes:
//   GTLPoiApiPoiOverviewListBean (0 custom class methods, 1 custom properties)

#import "GTLPoiApiPoiOverviewListBean.h"

#import "GTLPoiApiPoiOverviewBean.h"

// ----------------------------------------------------------------------------
//
//   GTLPoiApiPoiOverviewListBean
//

@implementation GTLPoiApiPoiOverviewListBean
@dynamic list;

+ (NSDictionary *)arrayPropertyToClassMap {
  NSDictionary *map = @{
    @"list" : [GTLPoiApiPoiOverviewBean class]
  };
  return map;
}

@end