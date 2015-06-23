//
//  ChangePasswordViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 23/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFUser *user = [PFUser currentUser];
    NSLog(@"senha do usuaro atual: %@", user[@"password"]);
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

- (IBAction)enviar:(id)sender {
    PFUser *user = [PFUser currentUser];
    NSLog(@"usuario atual: %@", user[@"username"]);
    if([PFUser logInWithUsername:user[@"username"] password:self.senhaAtual.text]){
        NSLog(@"foi");
        [PFUser requestPasswordResetForEmailInBackground:user[@"email"]];
        NSLog(@"um email foi mandado para o email: %@", user[@"email"]);
    }else{
        NSLog(@"nao");
    }
    
}
@end
