//
//  Annotation.h
//  Animal
//
//  Created by Tiago Cahú Lacerda do Nascimento on 6/15/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;



@end
