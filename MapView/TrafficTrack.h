//
//  TrafficTrack.h
//  MapView
//
//  Created by Ding Orlando on 8/23/12.
//
//  refer to - https://groups.google.com/forum/?fromgroups=#!topic/route-me-map/MlNTVxfUyrw
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

static int _wcategory = 0;

@interface TrafficTrack : NSObject

@property (nonatomic, readwrite) CLLocationCoordinate2D startpoint;
@property (nonatomic, readwrite) CLLocationCoordinate2D endpoint;
@property (nonatomic, readwrite) long sectionid;
@property (nonatomic, readwrite) double speed;
@property (nonatomic, readwrite) float linewidth;
@property (nonatomic, readwrite, getter = getWcategory, setter = setWcategory:) int wcategory;
///\des - get from speed?
@property (nonatomic, readonly, getter = getUicolor) UIColor* uicolor;

@end
