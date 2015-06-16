//
//  MapDenunciaViewController.h
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 11/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;
#import <CoreGraphics/CoreGraphics.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKFoundation.h>




@interface MapDenunciaViewController : UIViewController <UIApplicationDelegate, MKMapViewDelegate, UIAlertViewDelegate, CLLocationManagerDelegate>
- (IBAction)salvar:(id)sender;

- (IBAction)testar:(id)sender;
@property (nonatomic) CLLocation *location;
@property (strong, nonatomic) IBOutlet MKMapView *mapViewDenuncia;
@property(nonatomic, strong) CLLocationManager *coreLocation;
- (IBAction)salvaTeste:(id)sender;
@property (strong, nonatomic) CLLocationManager *locationManager;


@end
