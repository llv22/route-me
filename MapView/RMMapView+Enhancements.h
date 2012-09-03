//
//  RMMapView+ShowUserLocation.h
//  MapView
//
//  Created by Ding Orlando on 8/17/12.
//
//  refer to : this class is delegate for all external properties/method form RMMapView
//

#import "RMMapView.h"
@class TrafficTrack;

@interface RMMapView (Enhancements)

#pragma mark - user location enablement

@property (readwrite) BOOL showUserLocation;

#pragma mark - traffic track monitor management [insert&update,switch category]

-(void)postTrafficTracks:(NSArray*)tracks;
-(void)asynHandleTrafficTack:(TrafficTrack*)track;
-(void)clearTrafficTracks;

@end
