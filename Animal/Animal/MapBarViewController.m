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
    
    
    
    //create the region
    MKCoordinateRegion myRegion;
    
    //center
    CLLocationCoordinate2D center;
    center.latitude = WIMB_LATITUDE;
    center.longitude = WIMB_LONGITUDE;
    
    //Span
    MKCoordinateSpan span;
    span.latitudeDelta = THE_SPAN;
    span.longitudeDelta = THE_SPAN;
    
    myRegion.center = center;
    myRegion.span = span;
    
    [mapBarView setRegion:myRegion animated:YES];
    
    
    //Annotation
    

   //1. Create a coordinate for use
    CLLocationCoordinate2D wimbLocation;
    wimbLocation.latitude = WIMB_LATITUDE;
    wimbLocation.longitude = WIMB_LONGITUDE;
    
    Annotation *myAnnotation = [Annotation alloc];
    myAnnotation.coordinate = wimbLocation;
    myAnnotation.title = @"wimbledon";
    myAnnotation.subtitle = @"home";
    
    [self.mapBarView addAnnotation:myAnnotation];
    
    
    


    
   // self.mapBarView.delegate = self;
    
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
