//
//  MapDenunciaViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 11/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "MapDenunciaViewController.h"

@interface MapDenunciaViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *Save;

@end

@implementation MapDenunciaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapViewDenuncia.delegate = self;
    self.mapViewDenuncia.showsUserLocation = YES;
    
    self.coreLocation = [[CLLocationManager alloc] init];
    [self.coreLocation requestAlwaysAuthorization];
    
  // MKCoordinateRegion region = {{0.0 , 0.0} , {0.0 , 0.0}};
   
}




//-(void)Save:(UIBarButtonItem *)sender
//{
//    NSLog(@"oioioioii");
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
//                                                    message:@"...Do you want to proceed?"
//                                                   delegate:self
//                                          cancelButtonTitle:@"No"
//                                          otherButtonTitles:@"Yes", nil];
//    [alert show];
//}





- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch(buttonIndex) {
        case 0: //"No" pressed
            //do something?
            break;
        case 1: //"Yes" pressed
            //here you pop the viewController
            [self.navigationController popViewControllerAnimated:YES];
            break;
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void) mapViewDenuncia:(MKMapView *)mapViewDenuncia didUpdateUserLocation:(MKUserLocation *)userLocation
//{
//    MKCoordinateRegion mc = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 200, 200);
//    [self.mapViewDenuncia setRegion:[self.mapViewDenuncia regionThatFits:mc] animated:YES];
//}
- (void) mapViewDenuncia:(MKMapView *)mapViewDenuncia didUpdateUserLocation:(MKUserLocation *)userLocation
{
   
        
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 200, 200);
        [self.mapViewDenuncia setRegion:[self.mapViewDenuncia regionThatFits:region] animated:YES];
      
}


@end
