//
//  RMUserLocationMarker.h
//  MapView
//
//  Created by Ding Orlando on 8/21/12.
//
//  comments : this class inherited from RMMarker and should add animiation for implementation.
//  refer to - http://stackoverflow.com/questions/7150443/iphone-create-animation-like-user-location-blue-marble-drop
//  dotblue animiation - http://stackoverflow.com/questions/7150443/iphone-create-animation-like-user-location-blue-marble-drop
//


#import <QuartzCore/QuartzCore.h>
#import "RMMarker.h"

@class RMUserAnimationLayer;

@interface RMUserLocationMarker : RMMarker{
    RMUserAnimationLayer *customLayer;
}

@property (nonatomic, assign) CGFloat circleRadius;

///\des - initialization with customized lower-layer top
- (id) initWithUIImage: (UIImage*) image anchorPoint: (CGPoint) _anchorPoint;
- (void)addLayerAndAnimate;

@end
