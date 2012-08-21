//
//  UserLocationProxy.m
//  MapView
//
//  Created by Ding Orlando on 8/17/12.
//
//

#import "ShowUserLocationProxy.h"
#import "RMMapView.h"
#import "RMMarker.h"
#import "RMMarkerManager.h"

@interface ShowUserLocationProxy (PrivateMethods)

-(void)updateUserIconAminiation:(CLLocation *)newLocation;

@end

@implementation ShowUserLocationProxy

@synthesize showUserLocationStarted = _showUserLocationStarted;
@synthesize locationManager;

#pragma mark - lifecycle of user location monitor
//-(id)init{
//    if (self = [super init]) {
//        _showUserLocationStarted = NO;
//    }
//    return (self);
//}

-(id)initWithMap:(RMMapView*)theMap{
    if (self = [super init]) {
        self->_showUserLocationStarted = NO;
        self->_theMap = theMap;
    }
    return (self);
}

-(void)dealloc{
    if(self->_showUserLocationStarted){
        //TODO : stop user location monitor
        [self stopUserLocationMonitor];
    }
    [super dealloc];
}

#pragma mark - user location monitor
-(void)startUserLocationMonitor{
    if (_showUserLocationStarted){
        return;
    }
    //TODO : start locationManager monitor
    self->locationManager = [[CLLocationManager alloc]init];
    self->locationManager.delegate = self;
    self->locationManager.distanceFilter = kCLLocationAccuracyHundredMeters;
    self->locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        
    if ([CLLocationManager significantLocationChangeMonitoringAvailable]) {
        NSLog(@"Can Starting significantLocationChangeMonitoringAvailable");
        [locationManager startMonitoringSignificantLocationChanges];
        //TODO : starting userlocation sign
        self->_showUserLocationStarted = YES;
    }
    else{
        NSLog(@"Can not Starting significantLocationChangeMonitoringAvailable");
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                         message:@"Update iOS to 4.0 later to retreive more accurant address information"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

-(void)stopUserLocationMonitor{
    if(!_showUserLocationStarted){
        return;
    }
    //TODO : stop locationManger monitor
    [self->locationManager stopMonitoringSignificantLocationChanges];
    self->locationManager = nil;
    self->_showUserLocationStarted = NO;
}

#pragma mark - CLLocationManagerDelegate delegate
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
	NSLog(@"didFailWithError: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
	// TODO : Work around a bug in MapKit where user location is not initially zoomed to.
    if (newLocation == oldLocation){
        NSLog(@"ShowUserLocationProxy::didUpdateToLocation -- location doesn't change before last time");
        return;
    }
    
    // TODO : see location-awaress guide page 13, if it's a relatively recent event, turn off updates to save power
    NSDate* eventDate = newLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    
    if (abs(howRecent) >= 15.0 && oldLocation) {
        NSLog(@"ShowUserLocationProxy::didUpdateToLocation -- not recent location, more than 15.0 seconds");
        return;
    }
    
    //TODO : moving user to right location with animiation
    NSLog(@"didUpdateToLocation %@ from %@", newLocation, oldLocation);
    [self updateUserIconAminiation:newLocation];
}


-(void)updateUserIconAminiation:(CLLocation *)newLocation{
    if (!_userBluedot) {
//        _userBluedot = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"currentLocation"
//                                                                                        ofType:@"png"]
//                        ];
        //\bug - add the imageNamed: [bundle file]
        _userBluedot =  [UIImage imageNamed:@"currentLocation.png"];
    }
    
    //TODO : refer to marker implementation - CLLocation -> CLLocationCoordinate2D
    CLLocationCoordinate2D _newClloationcoordinate = CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude);
//TODO : refer to marker conversion
//  [marker setProjectedLocation:projectedPoint];
//	[marker setPosition:[[contents mercatorToScreenProjection] projectXYPoint:projectedPoint]];
    //	[[contents overlay] addSublayer:marker];
    //TODO : make marker via markerManager
	RMMarker *marker = [[RMMarker alloc]initWithUIImage:_userBluedot
											anchorPoint:CGPointMake(0.5, 1.0)];
    
	RMMarkerManager *markerManager = [self->_theMap markerManager];
	[markerManager addMarker:marker AtLatLong:_newClloationcoordinate];
	[marker release];
    
    //TODO : https://groups.google.com/forum/?fromgroups#!topic/route-me-map/TuTabkrS9p0%5B1-25%5D - add animiation for CALayer
}

@end
