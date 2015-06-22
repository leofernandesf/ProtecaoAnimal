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

@property (strong, nonatomic) CLLocationManager *locationManager2;
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

//BOOL userLocationShown1;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //adicionando zoom tela 1
   
    [self.coreLocation2 requestAlwaysAuthorization];

  
    
    self.locationManager2.desiredAccuracy = kCLLocationAccuracyBest;
//    [self.locationManager requestAlwaysAuthorization];
    
    self.mapBarView.delegate = self;
    // ** Don't forget to add NSLocationWhenInUseUsageDescription in MyApp-Info.plist and give it a string
    self.locationManager2 = [[CLLocationManager alloc] init];
    self.locationManager2.delegate = self;
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager2 respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager2 requestWhenInUseAuthorization];
    }
    
    [self.locationManager2 startUpdatingLocation];
    [self loadAnnotationsInMap];
    
    
    self.mapBarView.delegate = self;
    self.mapBarView.showsUserLocation = YES;
    
    
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
    //if(userLocationShown1) return;
    NSLog (@"zoooooom");
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 10000, 10000);
    [self.mapBarView setRegion:[self.mapBarView regionThatFits:region] animated:YES];
    CLLocationCoordinate2D pinlocation;
   // userLocationShown1 = YES;
    // Add an annotation
     MKPointAnnotation *Pin = [[MKPointAnnotation alloc]init];
    Pin.coordinate = pinlocation;
    Pin.title = @"Annotation Title";
    Pin.subtitle = @"Annotation Subtitle";
    
    [mapView addAnnotation:Pin]; 
    
    
    
//    - (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
//    {
//        
//        
//        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 200, 200);
//        [self.mapViewDenuncia setRegion:[self.mapViewDenuncia regionThatFits:region] animated:NO];
//        
//        
//        
//        
//    }
    
        
    
    
    
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
