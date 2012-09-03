//
//  RMMapView+ShowUserLocation.m
//  MapView
//
//  Created by Ding Orlando on 8/17/12.
//
//

#import "RMMapView+Enhancements.h"
#import "RMMapViewEnhanceProxy+UserLocation.h"
#import "RMMapViewEnhanceProxy+TrafficStreet.h"
#import "RMMapViewEnhanceProxy.h"

@interface RMMapView (Singleton)

-(RMMapViewEnhanceProxy*)singleton;

@end

@implementation RMMapView (Enhancements)

-(RMMapViewEnhanceProxy*)singleton{
    if (!self->_enhancementProxy) {
        self->_enhancementProxy = [[RMMapViewEnhanceProxy alloc]initWithMap:self];
    }
    
    return (self->_enhancementProxy);
}

#pragma mark - userLocation enhancement - non-thread safety for this version v0.1
-(void)setShowUserLocation:(BOOL)showUserLocation{
    //TODO : not exists proxy, so don't need to start user location monitor
    if(showUserLocation){
        if(!self->_enhancementProxy){
            [self->_enhancementProxy startUserLocationMonitor];
        }
        //else case - already started
    }
    else{
        if (self->_enhancementProxy) {
            [self->_enhancementProxy stopUserLocationMonitor];
        }
        //else case - already stop
    }
}

-(BOOL)showUserLocation{
    return (self->_enhancementProxy != nil);
}


#pragma mark - traffic track monitor management [insert&update,switch category]
-(void)postTrafficTracks:(NSArray*)tracks{
    [[self singleton]postTrafficTracks:tracks];
}

-(void)asynHandleTrafficTack:(TrafficTrack*)track{
    [[self singleton]asynHandleTrafficTack:track];
}

-(void)clearTrafficTracks{
    [[self singleton]clearTrafficTracks];
}


@end
