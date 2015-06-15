//
//  MapPin.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 12/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "MapPin.h"

@implementation MapPin


@synthesize coordinate, title, subtitle;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location
                placeName:(NSString *)placeName
              description:(NSString *)description;
{
    self = [super init];
    if (self)
    {
        coordinate = location;
        title = placeName;
        subtitle = description;
    }
    
    return self;
}

@end
