//
//  TrafficTrack.h
//  MapView
//
//  Created by Ding Orlando on 8/23/12.
//
//  refer to - https://groups.google.com/forum/?fromgroups=#!topic/route-me-map/MlNTVxfUyrw
//  objective-c programming guide - http://www.oogtech.org/content/2009/10/22/objective-c-good-evil-things-to-know/
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

///\des - auto-release for http://stackoverflow.com/questions/6673477/objective-c-static-field-issue

@end
