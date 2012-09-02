//
//  RMTrafficPath.m
//  MapView
//
//  Created by Ding Orlando on 8/30/12.
//
//

#import "RMTrafficPath.h"
#import "TrafficTrack.h"

@interface RMTrafficPath (PrivateMethods)

-(void)updateRMTrafficPathforCategory;

@end

@implementation RMTrafficPath

-(id)initWithTrafficTrack:(TrafficTrack*)track{
    if (self = [super init]) {
        self->_track = [track retain];
        [self->_track addObserver:self
                       forKeyPath:@"wcategory"
                          options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                          context:NULL];
    }
    return (self);
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ([keyPath isEqual:@"wcategory"]) {
        [self updateRMTrafficPathforCategory];
    }
    /*
     Be sure to call the superclass's implementation *if it implements it*.
     NSObject does not implement the method.
     */
    [super observeValueForKeyPath:keyPath
                         ofObject:object
                           change:change
                          context:context];
}

-(void)dealloc{
    [self->_track removeObserver:self forKeyPath:@"wcategory"];
    [self->_track release];
    [super dealloc];
}

//TODO : when wcategory has been changed to new value, the uicolor layer should be changed accordingly here.
-(void)updateRMTrafficPathforCategory{
    
}

//TODO : in new main thread to draw track - with data in initWithTrafficTrack : self->_track
-(void)asyncNewWithTrafficTrack{
    ///\des : create logic on main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
}

//TODO : YES - updateTrafficTrack - with data in ntrack : self->_track and set new value then drop ntrack
-(bool)asyncUpdateWithTrafficTrack:(TrafficTrack*)ntrack{
    if (self->_track.sectionid != ntrack.sectionid) {
        return (NO);
    }
    ///\des : update logic on main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
    ///\des : update RMTrafficPath and animation
    return (YES);
}

//TODO : clear its own track on Map
-(void)asyncClearOnMap{
    ///\des : clean-up logic on main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
}

@end
