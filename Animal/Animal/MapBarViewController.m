//
//  MapBarViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 11/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "MapBarViewController.h"
#import "Annotation.h"

@interface MapBarViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;
@property (nonatomic) BOOL firstTime;
@property (nonatomic) NSString *valor;


@end

//wimbledon
#define WIMB_LATITUDE 51.434783;
#define WIMB_LONGITUDE -0.213428;

//Span
#define THE_SPAN 0.01f;





@implementation MapBarViewController
@synthesize mapBarView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapBarView.delegate = self;
    // ** Don't forget to add NSLocationWhenInUseUsageDescription in MyApp-Info.plist and give it a string
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    [self loadAnnotationsInMap];
    
    
    self.mapBarView.delegate = self;
}

- (void)loadAnnotationsInMap
{
    //PFGeoPoint *point = [PFGeoPoint geoPointWithLocation:self.currentLocation];
    PFQuery *query = [PFQuery queryWithClassName:@"Locais"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         if (!error)
         {
             // The find succeeded.
             NSLog(@"Successfully retrieved %lu", objects.count);
             // Do something with the found objects
             PFGeoPoint *geoPoint;
             CLLocationCoordinate2D location;
             for (PFObject *object in objects)
             {
                 geoPoint = object[@"geoLocalization"];
                 
                 MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
                 location.latitude = geoPoint.latitude;
                 location.longitude = geoPoint.longitude;
                 point.coordinate = location;
                 point.title = object.objectId;
                 //point.subtitle = object[@"description"];
                 [self.mapBarView addAnnotation:point];
                 
             }
         }
         else
         {
             // Log details of the failure
             NSLog(@"Error: %@ %@", error, [error userInfo]);
         }
     }];
}

         
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    CLLocationCoordinate2D pinlocation;
    
    // Add an annotation
     MKPointAnnotation *Pin = [[MKPointAnnotation alloc]init];
    Pin.coordinate = pinlocation;
    Pin.title = @"Annotation Title";
    Pin.subtitle = @"Annotation Subtitle";
    
    [mapView addAnnotation:Pin]; 
    
    
    
    
        
    
    
    
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

}
@end
