//
//  MapBarViewController.h
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 11/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//


//#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
@import MapKit;
#import <CoreGraphics/CoreGraphics.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKFoundation.h>

@interface MapBarViewController : UIViewController <UIApplicationDelegate, MKMapViewDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapBarView;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic, strong) CLLocationManager *coreLocation2;



@end
