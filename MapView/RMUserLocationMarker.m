//
//  RMUserLocationMarker.m
//  MapView
//
//  Created by Ding Orlando on 8/21/12.
//
//

#import "RMUserLocationMarker.h"
#import "RMUserAnimationLayer.h"

const double _dAnmiationDelay = 2.5;
const double _dAnmiationRemoveDelay = 2;

@interface RMUserLocationMarker (PrivateMethods)

-(void)removeAnimationLayer;

@end

@implementation RMUserLocationMarker

//TODO : add the layer at the bottom of core image
///\description - should be use CGContextAddPath/CGContextSetRGBFillColor and
///               *** Gradients/Shadows *** to get central layer without CGImage
/// page 326, page332
- (id) initWithUIImage: (UIImage*) image
           anchorPoint: (CGPoint) _anchorPoint{
    return [super initWithUIImage:image anchorPoint:_anchorPoint];
}

//TODO - addLayerAndAnimate for User Location
- (void)addLayerAndAnimate {
    self->customLayer = [[RMUserAnimationLayer alloc] init];
    ///\description - don't use frame, as in sublayer, frame propery will be changed based on bounds and postion
    self->customLayer.bounds = CGRectMake(0, 0, 205, 205);
    self->customLayer.position = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
    [self addSublayer:self->customLayer];
    
    ///\description - add additional path for values changes
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"circleRadius"];
    animation.values = [NSArray arrayWithObjects:
                        [NSNumber numberWithFloat:100],
                        [NSNumber numberWithFloat:45],
                        [NSNumber numberWithFloat:50],
                        [NSNumber numberWithFloat:45],
                        [NSNumber numberWithFloat:50],
                        [NSNumber numberWithFloat:45],
                        [NSNumber numberWithFloat:30],
                        [NSNumber numberWithFloat:7],
                        nil];
    self->customLayer.circleRadius = 7;
    
    ///\description - add the loading time of user location based on map loading approach
    animation.duration = _dAnmiationDelay;
    animation.calculationMode = kCAAnimationCubicPaced;
    
    [self->customLayer addAnimation:animation forKey:nil];
    [self performSelector:@selector(removeAnimationLayer) withObject:nil afterDelay:(_dAnmiationDelay + _dAnmiationRemoveDelay)];
}

//TODO : remove anmiation layer for peformance consideration
-(void)removeAnimationLayer{
    if (self->customLayer) {
        [self->customLayer removeFromSuperlayer];
    }
}

@end
