//
//  RMTrafficPath.m
//  MapView
//
//  Created by Ding Orlando on 8/30/12.
//
//

#import "RMTrafficPath.h"
#import "TrafficTrack.h"

@implementation RMTrafficPath

-(id)initWithTrafficTrack:(TrafficTrack*)track{
    if (self = [super init]) {
        self->_track = track;
        [self->_track addObserver:self
                  forKeyPath:@"wcategory"
                     options:(NSKeyValueObservingOptionNew |
                              NSKeyValueObservingOptionOld)
                     context:NULL];
    }
    return (self);
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    if ([keyPath isEqual:@"wcategory"]) {
        
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
    [self->_track dealloc];
}

@end
