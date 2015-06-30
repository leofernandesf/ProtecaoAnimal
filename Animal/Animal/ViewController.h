//
//  ViewController.h
//  Animal
//
//  Created by leonardo fernandes farias on 09/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "MapBarViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *nome;
@property (strong, nonatomic) IBOutlet UITextField *senha;
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
 

//@property (strong, nonatomic) IBOutlet UITextField *senha;
- (IBAction)Login:(id)sender;
@end

   