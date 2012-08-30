//
//  TrafficTrack.m
//  MapView
//
//  Created by Ding Orlando on 8/23/12.
//
//

#import "TrafficTrack.h"

//TODO : copy the weight_low from different levels
const double weight_low = 0.05;
const double weight_mid = 0.3;
const double weight_2_low = 10;
const double weight_2_mid = 30;

//TODO : http://restkit.org mapping rule - https://github.com/llv22/RestKit
@implementation TrafficTrack

@synthesize startpoint, endpoint, sectionid, speed, linewidth;
@synthesize uicolor;
@synthesize wcategory;

//TODO : showSegmentWeightOnOSMMap with speed line way - http://blog.csdn.net/yohohohoho/article/details/6738757
//synthesize override - https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ObjectiveC/Chapters/ocProperties.html oc property getter/setter
//+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
-(UIColor*) getUicolor{
    UIColor* _color = nil;
    if(self->wcategory == 1){
        if(self.speed < weight_low){
            _color = [UIColor colorWithRed:255 green:255*(self.speed/weight_low) blue:0 alpha:1.0];
//            color = String(rgb2Hex(255,255*(weight/weight_low),0));
        }
        else if(self.speed < weight_mid){
            _color = [UIColor colorWithRed:(weight_mid - self.speed)/( weight_mid - weight_low) green:255 blue:0 alpha:1.0];
//            color = String(rgb2Hex(255*((weight_mid - weight)/( weight_mid - weight_low)),255,0));
        }
        else{
            _color = [UIColor colorWithRed:0 green:255 blue:0 alpha:1.0];
//            color = String(rgb2Hex(0,255,0));
        }
    }
    else
    {
        if(self.speed < weight_2_low){
            _color = [UIColor colorWithRed:255 green:255*(self.speed/weight_2_low) blue:0 alpha:1.0];
//            color = String(rgb2Hex(255,255*(weight/weight_2_low),0));
        }
        else if(self.speed < weight_2_mid){
            _color = [UIColor colorWithRed:255*(weight_2_mid - self.speed)/(weight_2_mid - weight_2_low) green:255 blue:0 alpha:1.0];
//            color = String(rgb2Hex(255*((weight_2_mid - weight)/( weight_2_mid - weight_2_low)),255,0));
        }
        else{
            _color = [UIColor colorWithRed:0 green:255 blue:0 alpha:1.0];
//            color = String(rgb2Hex(0,255,0));
        }
    }
    
    return (_color);
}

@end
