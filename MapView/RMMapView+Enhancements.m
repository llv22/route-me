//
//  RMMapView+ShowUserLocation.m
//  MapView
//
//  Created by Ding Orlando on 8/17/12.
//
//

#import "RMMapView+Enhancements.h"
#import "RMMapViewEnhanceProxy+UserLocation.h"
#import "RMMapViewEnhanceProxy.h"

@implementation RMMapView (Enhancements)

#pragma mark - userLocation enhancement - non-thread safety for this version v0.1
-(void)setShowUserLocation:(BOOL)showUserLocation{
    //TODO : not exists proxy, so don't need to start user location monitor
    if(showUserLocation){
        if(!self->_enhancementProxy){
            self->_enhancementProxy = [[RMMapViewEnhanceProxy alloc]initWithMap:self];
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

@end
