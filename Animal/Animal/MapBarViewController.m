//
//  MapBarViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 11/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "MapBarViewController.h"

@interface MapBarViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;
@property (nonatomic) BOOL firstTime;
@property (nonatomic) NSString *valor;

@end

@implementation MapBarViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
