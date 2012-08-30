//
//  RMTrafficPath.h
//  MapView
//
//  Created by Ding Orlando on 8/30/12.
//
//

#import <Foundation/Foundation.h>
//TODO : foreward-class isn't declarive for class inheritance
#import "RMPath.h"
@class TrafficTrack;

@interface RMTrafficPath : RMPath{
    TrafficTrack* _track;
}

//TODO : dummy implementation will be changed later
-(id)initWithTrafficTrack:(TrafficTrack*)track;

@end
