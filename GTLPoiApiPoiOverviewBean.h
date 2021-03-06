/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2015 Google Inc.
 */

//
//  GTLPoiApiPoiOverviewBean.h
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   poiApi/v1
// Description:
//   This is an API
// Classes:
//   GTLPoiApiPoiOverviewBean (0 custom class methods, 7 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

// ----------------------------------------------------------------------------
//
//   GTLPoiApiPoiOverviewBean
//

@interface GTLPoiApiPoiOverviewBean : GTLObject
@property (nonatomic, retain) NSNumber *latitude;  // doubleValue
@property (nonatomic, retain) NSNumber *longitude;  // doubleValue
@property (nonatomic, retain) NSNumber *poiId;  // longLongValue
@property (nonatomic, copy) NSString *poiName;
@property (nonatomic, retain) NSNumber *rating;  // floatValue
@property (nonatomic, copy) NSString *shortPoiDescription;
@property (nonatomic, copy) NSString *thumbnailBase64;
@end
