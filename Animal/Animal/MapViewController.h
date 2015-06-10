//
//  MapViewController.h
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 10/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;
#import <CoreLocation/CoreLocation.h>


@interface MapViewController : UIViewController <UIApplicationDelegate, MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic, strong) CLLocationManager *coreLocation;


@end
