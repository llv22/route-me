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
//TODO : create new track then drawing on screen of asynchronous main thread
-(void)asyncNewWithTrafficTrack;
//TODO : updateRMTrafficPath via TrafficTrack comparsion
///\des : if and only if ntrack.sectionid == self->_track.sectionid, then trigger updating of RMTrafficPath
-(bool)asyncUpdateWithTrafficTrack:(TrafficTrack*)ntrack;
//TODO : clear its own track on map
-(void)asyncClearOnMap;

@end
