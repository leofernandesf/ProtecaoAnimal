//
//  CadastroViewController.m
//  Animal
//
//  Created by Tiago Cahú Lacerda do Nascimento on 6/10/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "CadastroViewController.h"

@interface CadastroViewController ()

@end

@implementation CadastroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)cadastrar:(id)sender {
    PFUser *user = [PFUser user];
    user.username = _primeiroNome.text;
    user.password = _senha.text;
    user.email = _email.text;
    user[@"segundoNome"] = self.segundoNome.text;
    
    // other fields can be set just like with PFObject
    // user[@"Last Name"] = _segundoNome.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            UIStoryboard *oi = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *viewcontroller = (ViewController *) [oi instantiateViewControllerWithIdentifier:@"login"];
            [self presentViewController:viewcontroller animated:YES completion:nil];
            // Hooray! Let them use the app now.
        } else {   NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
        }
    }];
}


@end
