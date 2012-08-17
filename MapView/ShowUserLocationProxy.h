//
//  UserLocationProxy.h
//  MapView
//
//  Created by Ding Orlando on 8/17/12.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocationManager.h>
#import <CoreLocation/CLLocationManagerDelegate.h>

@class RMMapView;

@interface ShowUserLocationProxy : NSObject<CLLocationManagerDelegate>{
    BOOL _showUserLocationStarted;
    
@private
    UIImage* _userBluedot;
    //TODO : reference of RMMapView to update user location dot
    RMMapView* _theMap;
}

@property (readwrite) BOOL showUserLocationStarted;
@property (nonatomic, retain) CLLocationManager *locationManager;

-(id)initWithMap:(RMMapView*)theMap;

#pragma mark - user location monitor management
-(void)startUserLocationMonitor;
-(void)stopUserLocationMonitor;

@end
