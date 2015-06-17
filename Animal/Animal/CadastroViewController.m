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
    const int movementDistance = 140; // tweak as needed
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




