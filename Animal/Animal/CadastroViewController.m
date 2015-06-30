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
    NSLog(@"entoru na tela de cadastro");
    // Do any additional setup after loading the view.
    
    
    // teclado some quando clicar na tela
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    
    
    //pra subir os campos quando o teclado aparece:
    self.primeiroNome.layer.borderColor=[[UIColor colorWithRed:1 green:1 blue:1 alpha:1]CGColor];
    self.primeiroNome.layer.borderWidth=0;
    self.primeiroNome.delegate = self;
    
    self.segundoNome.layer.borderColor=[[UIColor colorWithRed:1 green:1 blue:1 alpha:1]CGColor];
    self.segundoNome.layer.borderWidth=0;
    self.segundoNome.delegate = self;
    
    self.email.layer.borderColor=[[UIColor colorWithRed:1 green:1 blue:1 alpha:1]CGColor];
    self.email.layer.borderWidth=0;
    self.email.delegate = self;
    
    self.senha.layer.borderColor=[[UIColor colorWithRed:1 green:1 blue:1 alpha:1]CGColor];
    self.senha.layer.borderWidth=0;
    self.senha.delegate = self;
    //fim
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}
//Esconde Status Bar (Barra do relógio)
//- (BOOL)prefersStatusBarHidden {
//    return YES;
//}

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
            
            UIAlertView* finalCheck = [[UIAlertView alloc]
                                                                      initWithTitle:@"Alerta"
                                                                      message:errorString
                                                                      delegate:self
                                                                      cancelButtonTitle:@"OK"
                                                                      otherButtonTitles:nil,nil];
                                           
            
                                           
                                           [finalCheck show];

        }
    }];
}

//some teclado, verificar
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (void)dismissKeyboard {
    [self.primeiroNome resignFirstResponder];
    [self.segundoNome resignFirstResponder];
    [self.email resignFirstResponder];
    [self.senha resignFirstResponder];
}

//pra subir os campos quando o teclado aparece:
- (void)textViewDidBeginEditing:(UITextView *)textView{
    [self animate:YES];
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    [self animate:NO];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self animate:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self animate:NO];
}

- (void) animate: (BOOL)up {
    const int movementDistance = 155; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

//self.senha.layer.borderColor=[[UIColor colorWithRed:1 green:1 blue:1 alpha:1]CGColor];
//self.senha.layer.borderWidth=0;
//self.senha.delegate = self;
@end




