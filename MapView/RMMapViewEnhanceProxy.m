//
//  UserLocationProxy.m
//  MapView
//
//  Created by Ding Orlando on 8/17/12.
//
//

#import "RMMapViewEnhanceProxy.h"
#import "RMMapViewEnhanceProxy+UserLocation.h"

const int _initSize = 20;

@implementation RMMapViewEnhanceProxy

@synthesize showUserLocationStarted = _showUserLocationStarted;
@synthesize locationManager;

#pragma mark - lifecycle of user location monitor

-(id)initWithMap:(RMMapView*)theMap{
    if (self = [super init]) {
        self->_showUserLocationStarted = NO;
        self->_theMap = theMap;
        self->_trackDic = [[NSMutableDictionary alloc]initWithCapacity:_initSize];
    }
    return (self);
}

-(void)dealloc{
    if(self->_showUserLocationStarted){
        //TODO : stop user location monitor
        [self stopUserLocationMonitor];
    }
    [self->_trackDic dealloc];
    [super dealloc];
}

@end
