//
//  MapDenunciaViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 11/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "MapDenunciaViewController.h"
#import "Annotation.h"



@interface MapDenunciaViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *Save;




@end

@implementation MapDenunciaViewController
NSMutableArray *_cameras;

BOOL userLocationShown;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    userLocationShown = NO;
      NSLog(@"primeira vez: %d", userLocationShown);
    self.mapViewDenuncia.delegate = self;
    self.mapViewDenuncia.showsUserLocation = YES;
    
    
    self.coreLocation = [[CLLocationManager alloc] init];
    [self.coreLocation requestAlwaysAuthorization];
 //alerta quando entra na tela do mapa de denuncia -------------------
    UIAlertView* finalCheck = [[UIAlertView alloc]
                               initWithTitle:@"Alerta"
                               message:@"Deseja manter a Localização atual?"
                               delegate:self
                               cancelButtonTitle:@"Sim"
                               otherButtonTitles:@"Não",nil];
    
    [finalCheck show];
    
    ;
    
    NSLog(@"descricao %@", self.descricao);
    NSLog(@"tipo %@",self.imagem);
    NSLog(@"tipo %@",self.tipo);
    NSLog(@"referencia %@",self.referencia);
    
 
    
    
//    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
//    [self.mapViewDenuncia addGestureRecognizer:longPressGesture];
    
    
    
    // setando os pinos
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestAlwaysAuthorization];
 // UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
    [self.mapViewDenuncia addGestureRecognizer:longPressGesture];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 0) {
        NSLog(@"OK Button is clicked supostamente do ok");
        
        self.location = (CLLocation *)self.mapViewDenuncia.userLocation;
        NSLog(@"testando %@",self.location);
        
        [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
            if (!error) {
                NSLog(@"fez alguma coisa");
                [[PFUser currentUser] setObject: geoPoint forKey: @"location"];
                [[PFUser currentUser] saveInBackground];// do something with the new geoPoint
            }
        }];
        
        
        
        NSData *data = UIImageJPEGRepresentation(self.imagem, 0.6);
        
        PFFile *file = [PFFile fileWithName:@"myPicture.jpg" data:data];
        PFObject *locais = [PFObject objectWithClassName:@"Locais"];
        PFUser *user = [PFUser currentUser];
        PFGeoPoint *point = [PFGeoPoint geoPointWithLocation:self.location];
        NSLog(@"suposta mente pegou o local%@",point);
                 
        locais[@"picture"] = file;
//        locais[@"description"] = self.textFieldDescription.text;
        locais[@"geoLocalization"] = point;
        locais[@"createdBy"] = user.username;
        locais[@"tipoAgressao"] = self.tipo;
        locais[@"descricao"] = self.descricao;
        locais[@"pontoReferencia"] = self.referencia;
        
        [locais saveInBackgroundWithBlock:^(BOOL success, NSError *error) {
            if (!error) {
                NSLog(@"Upload done");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Done"
                                                                message:@"Sent successfully"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            } else {
                NSLog(@"%@", error.userInfo);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"Could not be sent. Check your internet connection"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            }
        }];
        
        //[self dismissViewControllerAnimated:YES completion:nil];
        //[self.navigationController popViewControllerAnimated: YES];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        MapBarViewController *viewController = (MapBarViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MapaGlobal"];
        [self presentViewController:viewController animated:YES completion:nil];
        
    }
    else if(buttonIndex == 1) {
        NSLog(@"Cancel Button is clicked");
        
    }
}

//- (IBAction)testar:(id)sender {
//    
//    UIAlertView* finalCheck = [[UIAlertView alloc]
//                               initWithTitle:@"Alerta"
//                               message:@"Deseja manter a Localização atual?"
//                               delegate:self
//                               cancelButtonTitle:@"Sim"
//                               otherButtonTitles:@"Não",nil];
//    
//    
//    
//    [finalCheck show];
//    
//    
//
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    if(userLocationShown) return;
    
    

        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 200, 200);
        [self.mapViewDenuncia setRegion:[self.mapViewDenuncia regionThatFits:region] animated:NO];
   

    userLocationShown = YES;
        NSLog(@"Entrou com zoom %d", userLocationShown);
}


// Mensagem de Alerta quando clicar no botao "testando" apenas para teste:




//- (IBAction)salvaTeste:(id)sender  {
//    self.location = (CLLocation *)self.mapViewDenuncia.userLocation;
//    NSLog(@"testando %@",self.location);
//    
//    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
//        if (!error) {
//            NSLog(@"fez alguma coisa");
//            [[PFUser currentUser] setObject: geoPoint forKey: @"location"];
//            [[PFUser currentUser] saveInBackground];// do something with the new geoPoint
//        }
//    }];
//    
//    
//    
//    //    NSData *data = UIImageJPEGRepresentation(self.picture, 0.6);
//    //
//    //    PFFile *file = [PFFile fileWithName:@"myPicture.jpg" data:data];
//    PFObject *locais = [PFObject objectWithClassName:@"Locais"];
//    PFUser *user = [PFUser currentUser];
//    PFGeoPoint *point = [PFGeoPoint geoPointWithLocation:self.location];
//    NSLog(@"suposta mente pegou o local%@",point);
//    
//    //    photo[@"picture"] = file;
//    //    photo[@"description"] = self.textFieldDescription.text;
//    //    photo[@"isPrivate"] = @NO;
//    locais[@"geoLocalization"] = point;
//    locais[@"createdBy"] = user.username;
//    
//    [locais saveInBackgroundWithBlock:^(BOOL success, NSError *error) {
//        if (!error) {
//            NSLog(@"Upload done");
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Done"
//                                                            message:@"Sent successfully"
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles:nil];
//            [alert show];
////            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
////            MapBarViewController *viewController = (MapBarViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MapaGlobal"];
////            [self presentViewController:viewController animated:YES completion:nil];
//
//        } else {
//            NSLog(@"%@", error.userInfo);
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                            message:@"Could not be sent. Check your internet connection"
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles:nil];
//            [alert show];
//        }
//    }];
//    
////    [self dismissViewControllerAnimated:YES completion:nil];
////    [self.navigationController popViewControllerAnimated: YES];
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    MapBarViewController *viewController = (MapBarViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MapaGlobal"];
//    [self presentViewController:viewController animated:YES completion:nil];
//    
//    }


// fim pop up alerta ------------



//setando pinos
- (void)handleLongPressGesture:(UIGestureRecognizer*)sender
{
    if(sender.state == UIGestureRecognizerStateBegan)
    {
        CGPoint point = [sender locationInView:self.mapViewDenuncia];
        CLLocationCoordinate2D locCoord = [self.mapViewDenuncia convertPoint:point toCoordinateFromView:self.mapViewDenuncia];
MKPointAnnotation *dropPin = [[MKPointAnnotation alloc] init];
dropPin.coordinate = locCoord;
[self.mapViewDenuncia addAnnotation:dropPin];
self.pinLocation = [[CLLocation alloc] initWithLatitude:locCoord.latitude longitude:locCoord.longitude];
        
}
}




- (IBAction)cancel:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MapBarViewController *viewController = (MapBarViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MapaGlobal"];
    [self presentViewController:viewController animated:YES completion:nil];
    
}

- (IBAction)save:(id)sender {
    NSLog(@"clicou no botal do save");
    NSLog(@"testando o localisacao dos pins setados %@",self.pinLocation);
    
    
    
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
        if (!error) {
            NSLog(@"fez alguma coisa");
            [[PFUser currentUser] setObject: geoPoint forKey: @"location"];
            [[PFUser currentUser] saveInBackground];// do something with the new geoPoint
        }
    }];
    
    
    NSData *data = UIImageJPEGRepresentation(self.imagem, 0.6);
    
    PFFile *file = [PFFile fileWithName:@"myPicture.jpg" data:data];
    PFObject *locais = [PFObject objectWithClassName:@"Locais"];
    PFUser *user = [PFUser currentUser];
    PFGeoPoint *point = [PFGeoPoint geoPointWithLocation:self.pinLocation];
    NSLog(@"suposta mente pegou o local%@",point);
    
    locais[@"picture"] = file;
    //        locais[@"description"] = self.textFieldDescription.text;
    locais[@"geoLocalization"] = point;
    locais[@"createdBy"] = user.username;
    locais[@"tipoAgressao"] = self.tipo;
    locais[@"descricao"] = self.descricao;
    locais[@"pontoReferencia"] = self.referencia;
    [locais saveInBackgroundWithBlock:^(BOOL success, NSError *error) {
        if (!error) {
            NSLog(@"Upload done");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Done"
                                                            message:@"Sent successfully"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        } else {
            NSLog(@"%@", error.userInfo);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Could not be sent. Check your internet connection"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MapBarViewController *viewController = (MapBarViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MapaGlobal"];
    [self presentViewController:viewController animated:YES completion:nil];
}
- (IBAction)meuLocal:(id)sender {

    NSLog(@"dedei");
    
    
    float spanX = 0.00725;
    float spanY = 0.00725;
    MKCoordinateRegion region;
    region.center.latitude = self.mapViewDenuncia.userLocation.coordinate.latitude;
    region.center.longitude = self.mapViewDenuncia.userLocation.coordinate.longitude;
    region.span.latitudeDelta = spanX;
    region.span.longitudeDelta = spanY;
    
    
    
    [self.mapViewDenuncia setRegion:region animated:YES];
}


@end


