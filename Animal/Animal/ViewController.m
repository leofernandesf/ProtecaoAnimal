//
//  ViewController.m
//  Animal
//
//  Created by leonardo fernandes farias on 09/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
    
    
    
//    PFUser *user = [PFUser user];
//    user.username = @"leo";
//    user.password = @"36544404";
//    user.email = @"leo@example.com";
//    
//    // other fields can be set just like with PFObject
//    user[@"phone"] = @"415-392-0202";
//    
//    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (!error) {   // Hooray! Let them use the app now.
//        } else {   NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
//        }
//    }];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [PFUser logInWithUsernameInBackground:@"leo" password:@"36544404"
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            NSLog(@"Entrou abestado");
                                        } else {
                                            NSLog(@"Nao Entrou abestado");

                                            // The login failed. Check error to see why.
                                        }
                                    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)go:(id)sender {
}
- (IBAction)Login:(id)sender {
}
@end
