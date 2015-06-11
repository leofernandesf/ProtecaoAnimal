//
//  MapBarViewController.h
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 11/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MapBarViewController : UIViewController <UIApplicationDelegate, MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapBarView;

@end
