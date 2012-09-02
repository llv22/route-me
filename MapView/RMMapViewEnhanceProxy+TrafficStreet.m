
//
//  RMMapViewEnhanceProxy+TrafficStreets.m
//  MapView
//
//  Created by Ding Orlando on 8/23/12.
//
//

#import "RMMapViewEnhanceProxy+TrafficStreet.h"
#import "TrafficTrack.h"
#import "RMTrafficPath.h"

#define kBroundQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@interface RMMapViewEnhanceProxy (PrivateMethods)

-(void)createTrafficTrack:(TrafficTrack*)track;
-(void)updateTrafficTrack:(TrafficTrack*)track;

@end

@implementation RMMapViewEnhanceProxy (TrafficStreet)

//TODO : post a list of traffic tracks, and add them into ui layer with animiation in RMTrafficPath
///\pre-requistite : tracks with ***no same sectionid for pairs***
-(void)postTrafficTracks:(NSArray*)tracks{
    for(TrafficTrack* track in tracks){
        [self asynHandleTrafficTack:track];
    }
}

//TODO : update[or insert] one traffic track into ui layer with animiation in RMTrafficPath
///\des : insert or update
///\ref : http://blog.csdn.net/ericsuper/article/details/6998856
///\ref : http://stackoverflow.com/questions/11658669/how-to-enable-the-new-objective-c-object-literals-on-ios
-(void)asynHandleTrafficTack:(TrafficTrack*)track{
    dispatch_async(kBroundQueue, ^{
        ///\des : literal for new dictionary
        RMTrafficPath* _item = [self->_rmtrackDic objectForKey:@(track.sectionid)];
        if (!_item) {
            [self createTrafficTrack:track];
        }
        else{
            [self updateTrafficTrack:track];
        }
    });
}

//TODO : clear all of traffic tracks in dictionary
///\des : so when removing dictionary self->_trackDic, RMTrafficPath should be notified and remove also
-(void)clearTrafficTracks{
    [self->_rmtrackDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
        RMTrafficPath* _rmtrack = (RMTrafficPath*)obj;
        [_rmtrack asyncClearOnMap];
    }];
    @synchronized(self->_rmtrackDic){
        [self->_rmtrackDic removeAllObjects];
    }
}

#pragma mark - private methods section

-(void)createTrafficTrack:(TrafficTrack*)track{
    RMTrafficPath* _nitem = [[RMTrafficPath alloc]initWithTrafficTrack:track];
    @synchronized(self->_rmtrackDic){
        [self->_rmtrackDic setObject:_nitem forKey:@(track.sectionid)];
    }
    [_nitem asyncNewWithTrafficTrack];
}

-(void)updateTrafficTrack:(TrafficTrack*)track{
    RMTrafficPath* _citem = [self->_rmtrackDic objectForKey:@(track.sectionid)];
    [_citem asyncUpdateWithTrafficTrack:track];
}

@end
