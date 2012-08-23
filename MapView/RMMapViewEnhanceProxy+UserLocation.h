//
//  RMMapViewEnhanceProxy+UserLocation.h
//  MapView
//
//  Created by Ding Orlando on 8/23/12.
//
//

#import "RMMapViewEnhanceProxy.h"

@interface RMMapViewEnhanceProxy (UserLocation)

#pragma mark - user location monitor management
-(void)startUserLocationMonitor;
-(void)stopUserLocationMonitor;

@end
