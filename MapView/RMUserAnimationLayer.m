//
//  RMUserAnimationLayer.m
//  MapView
//
//  Created by Ding Orlando on 8/22/12.
//
//

#import "RMUserAnimationLayer.h"

@implementation RMUserAnimationLayer
//\ref: the animatable property - bluedot radius
@dynamic circleRadius;

+ (BOOL)needsDisplayForKey:(NSString*)key {
    //TODO : Programming iOS4 - page 380 / iOS5 - page 440 (ep468)
    if ([key isEqualToString:@"circleRadius"]) {
        return YES;
    } else {
        return [super needsDisplayForKey:key];
    }
}

//TODO : customized layer - http://stackoverflow.com/questions/8484023/is-there-a-way-to-prevent-calayer-shadows-from-overlapping-adjacent-layers
- (void)drawInContext:(CGContextRef)ctx{
    [super drawInContext:ctx];
    
    CGRect rect = CGContextGetClipBoundingBox(ctx);
    // Fill the circle with a light blue
    CGContextSetRGBFillColor(ctx, 0, 0, 255, 0.1);
    // Stoke a dark blue border
    CGContextSetRGBStrokeColor(ctx, 0, 0, 255, 0.5);
    
    // Construct a CGMutablePath to draw the light blue circle
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, rect.size.width / 2, rect.size.height / 2, self.circleRadius, 0, 2 * M_PI, NO);
    // Fill the circle
    CGContextAddPath(ctx, path);
    CGContextFillPath(ctx);
    
    // Stroke the circle's border
    CGContextAddPath(ctx, path);
    CGContextStrokePath(ctx);
    
    // Release the path
    CGPathRelease(path);
    
    // Set a dark blue color for the small inner circle
    CGContextSetRGBFillColor(ctx, 0, 0, 255, 1.0f);
    
    // Draw the center dot - Don't need this input any more for central image
//    CGContextBeginPath (ctx);
//    CGContextAddArc(ctx, rect.size.width / 2,
//                    rect.size.height / 2,
//                    5, 0, 2 * M_PI, NO);
//    CGContextFillPath(ctx);
    CGContextStrokePath(ctx);
}


@end
