//
//  UserLocationProxy.h
//  MapView
//
//  Created by Ding Orlando on 8/17/12.
//
//  refer to - https://groups.google.com/forum/?fromgroups=#!topic/route-me-map/MlNTVxfUyrw RMPath impelemtnation for routing
//  futhermore with animation effect.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CLLocationManager.h>
#import <CoreLocation/CLLocationManagerDelegate.h>

@class RMMapView;
@class RMUserLocationMarker;

@interface RMMapViewEnhanceProxy : NSObject<CLLocationManagerDelegate>{
    BOOL _showUserLocationStarted;
    
@private
#pragma mark - route track private fields
    NSMutableDictionary* _trackDic;
    
#pragma mark - userlocation private fields
    ///\desc - userBluedot used for showing user location
    UIImage* _userBluedot;
    ///\desc - userlocation marker for resources
    RMUserLocationMarker *marker;
    
    ///\desc - reference of RMMapView
    RMMapView* _theMap;
}

@property (readwrite) BOOL showUserLocationStarted;
@property (nonatomic, retain) CLLocationManager *locationManager;

-(id)initWithMap:(RMMapView*)theMap;

@end
