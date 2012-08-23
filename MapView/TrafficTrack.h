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

@interface TrafficTrack : NSObject

@property (nonatomic, readwrite) CLLocationCoordinate2D startpoint;
@property (nonatomic, readwrite) CLLocationCoordinate2D endpoint;
@property (nonatomic, readwrite) long sectionid;
@property (nonatomic, readwrite) double speed;
@property (nonatomic, readwrite) float linewidth;
///\des - get from speed?
@property (nonatomic, readonly) UIColor* uicolor;

@end
