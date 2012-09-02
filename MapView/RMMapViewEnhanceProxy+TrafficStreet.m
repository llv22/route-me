
//
//  RMMapViewEnhanceProxy+TrafficStreets.m
//  MapView
//
//  Created by Ding Orlando on 8/23/12.
//
//

#import "RMMapViewEnhanceProxy+TrafficStreet.h"
#import "TrafficTrack.h"

@implementation RMMapViewEnhanceProxy (TrafficStreet)

//TODO : post a list of traffic tracks, and add them into ui layer with animiation in RMTrafficPath
-(void)postTrafficTracks:(NSArray*)tracks{
    for(TrafficTrack* track in tracks){
        [self asynUpdateTrafficTack:track];
    }
}

//TODO : update[or insert] one traffic track into ui layer with animiation in RMTrafficPath
///\des : insert or update
-(void)asynUpdateTrafficTack:(TrafficTrack*)track{
    
}

//TODO : clear all of traffic tracks in dictionary
///\des : so when removing dictionary self->_trackDic, RMTrafficPath should be notified and remove also
-(void)clearTrafficTracks{
}

@end
