//
//  RMMapViewEnhanceProxy+TrafficStreets.h
//  MapView
//
//  Created by Ding Orlando on 8/23/12.
//
//

#import "RMMapViewEnhanceProxy.h"
#import "TrafficTrack.h"

@interface RMMapViewEnhanceProxy (TrafficStreet)

#pragma mark - traffic track monitor management [insert&update,switch category]

-(void)postTrafficTracks:(NSArray*)tracks;
-(void)asynUpdateTrafficTack:(TrafficTrack*)track;
-(void)clearTrafficTracks;

@end
