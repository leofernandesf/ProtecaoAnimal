//
//  MapDenunciaViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 11/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "MapDenunciaViewController.h"

@interface MapDenunciaViewController ()

@end

@implementation MapDenunciaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapViewDenuncia.delegate = self;
    self.mapViewDenuncia.showsUserLocation = YES;
    
    self.coreLocation = [[CLLocationManager alloc] init];
    [self.coreLocation requestAlwaysAuthorization];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion mc = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 200, 200);
    [self.mapViewDenuncia setRegion:[self.mapViewDenuncia regionThatFits:mc] animated:YES];
}

@end
