//
//  MapPin.h
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 12/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>



@interface MapPin : NSObject <MKAnnotation>


@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) NSString* title;
@property (nonatomic, readonly) NSString* subtitle;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location
placeName:(NSString *)placeName
description:(NSString *)description;

    @end
