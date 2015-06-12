//
//  MapBarViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 11/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "MapBarViewController.h"

@interface MapBarViewController ()

@end

@implementation MapBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.mapBarView.delegate = self;
    
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
