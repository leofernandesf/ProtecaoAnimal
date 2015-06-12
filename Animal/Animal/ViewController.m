//
//  ViewController.m
//  Animal
//
//  Created by leonardo fernandes farias on 09/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldUsername;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    
    
    
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
    
    
    
//        // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Login:(id)sender {
//    [PFUser logInWithUsernameInBackground:_nome.text password:_senha.text
//                                    block:^(PFUser *user, NSError *error) {
//                                        if (user) {
//                                            // Do stuff after successful login.
//                                            NSLog(@"Entrou abestado");
//                                        } else {
//                                            NSLog(@"Nao Entrou abestado");
//                                            
//                                            // The login failed. Check error to see why.
//                                        }
//                                    }];
    

}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"login"]&&[PFUser logInWithUsername:self.textFieldUsername.text password:self.textFieldPassword.text]){
        NSLog(@"%@", [PFUser currentUser]);
        return YES;
    }else if ([identifier isEqualToString:@"cadastrar"]){
        return YES;
    }
    return NO;
}



@end
