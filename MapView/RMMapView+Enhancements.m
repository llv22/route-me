//
//  RMMapView+ShowUserLocation.m
//  MapView
//
//  Created by Ding Orlando on 8/17/12.
//
//

#import "RMMapView+Enhancements.h"
#import "RMMapViewEnhanceProxy.h"

@implementation RMMapView (Enhancements)

#pragma mark - userLocation enhancement - non-thread safety for this version v0.1
-(void)setShowUserLocation:(BOOL)showUserLocation{
    //TODO : not exists proxy, so don't need to start user location monitor
    if(showUserLocation){
        if(!self->_showUserProxy){
            self->_showUserProxy = [[RMMapViewEnhanceProxy alloc]initWithMap:self];
            [self->_showUserProxy startUserLocationMonitor];
        }
        //else case - already started
    }
    else{
        if (self->_showUserProxy) {
            [self->_showUserProxy stopUserLocationMonitor];
        }
        //else case - already stop
    }
}

-(BOOL)showUserLocation{
    return (self->_showUserProxy != nil);
}

@end