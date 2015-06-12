//
//  MapDenunciaViewController.h
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 11/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;
#import <CoreLocation/CoreLocation.h>


@interface MapDenunciaViewController : UIViewController <UIApplicationDelegate, MKMapViewDelegate, UIAlertViewDelegate>


@property (strong, nonatomic) IBOutlet MKMapView *mapViewDenuncia;
@property(nonatomic, strong) CLLocationManager *coreLocation;



@end
