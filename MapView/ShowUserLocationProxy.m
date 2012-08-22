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
//TODO : my own user location
#import "RMUserLocationMarker.h"
//RMProjectedPoint class
#import "RMFoundation.h"
//RMProjection -> latLongToPoint
#import "RMProjection.h"
//PointtoUI -> projectXYPoint
#import "RMMercatorToScreenProjection.h"

@interface ShowUserLocationProxy (PrivateMethods)

-(void)updateUserIconAminiation:(CLLocation *)newLocation;

@end

@implementation ShowUserLocationProxy

@synthesize showUserLocationStarted = _showUserLocationStarted;
@synthesize locationManager;

#pragma mark - lifecycle of user location monitor

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
    //\description - start locationManager monitor
    self->locationManager = [[CLLocationManager alloc]init];
    self->locationManager.delegate = self;
    self->locationManager.distanceFilter = kCLLocationAccuracyHundredMeters;
    self->locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        
    if ([CLLocationManager significantLocationChangeMonitoringAvailable]) {
        NSLog(@"Can Starting significantLocationChangeMonitoringAvailable");
        [locationManager startMonitoringSignificantLocationChanges];
        //\description - starting userlocation sign
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
	//\description - Work around a bug in MapKit where user location is not initially zoomed to.
    if (newLocation == oldLocation){
        NSLog(@"ShowUserLocationProxy::didUpdateToLocation -- location doesn't change before last time");
        return;
    }
    
    //\description - see location-awaress guide page 13, if it's a relatively recent event, turn off updates to save power
    NSDate* eventDate = newLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    
    if (abs(howRecent) >= 15.0 && oldLocation) {
        NSLog(@"ShowUserLocationProxy::didUpdateToLocation -- not recent location, more than 15.0 seconds");
        return;
    }
    
    //\description - moving user to right location with animiation
    NSLog(@"didUpdateToLocation %@ from %@", newLocation, oldLocation);
    [self updateUserIconAminiation:newLocation];
}


-(void)updateUserIconAminiation:(CLLocation *)newLocation{
    if (!_userBluedot) {
//        _userBluedot = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"currentLocation"
//                                                                                        ofType:@"png"]
//                        ];
        //\bug - add the imageNamed: [bundle file] - orlando's concern, if it's already include into consideration, with my own drawing
        //       to avoid imaged from externally
        _userBluedot =  [UIImage imageNamed:@"currentLocation.png"];
    }
    
    //\description - refer to marker implementation - CLLocation -> CLLocationCoordinate2D
    CLLocationCoordinate2D _newClloationcoordinate = CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    if(!self->marker){
        //\description - make marker via markerManager
        self->marker = [[RMUserLocationMarker alloc]initWithUIImage:_userBluedot];
        RMMarkerManager *markerManager = [self->_theMap markerManager];
        [markerManager addMarker:self->marker AtLatLong:_newClloationcoordinate];
        [self->marker addLayerAndAnimate];
        [self->marker release];
    }
    else{
        //\description - move _userBluedot to other location with animiation, perhaps not
        RMProjectedPoint _projectedPoint = [[self->_theMap.contents projection] latLongToPoint:_newClloationcoordinate];
        [self->marker setProjectedLocation:_projectedPoint];
        [marker setPosition:[[self->_theMap.contents mercatorToScreenProjection] projectXYPoint:_projectedPoint]];
    }
}

@end
