//
//  MapViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 10/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    
    self.coreLocation = [[CLLocationManager alloc] init];
    [self.coreLocation requestAlwaysAuthorization];
    
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

- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion mc = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 200, 200);
    [self.mapView setRegion:[self.mapView regionThatFits:mc] animated:YES];
}

@end
