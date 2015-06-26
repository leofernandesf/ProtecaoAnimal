//
//  ChangePasswordViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 23/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController () <FBSDKLoginButtonDelegate>

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFUser *user = [PFUser currentUser];
    NSLog(@"senha do usuaro atual: %@", user[@"password"]);
    
    
    
    self.loginButton.delegate = self;
    
    if ([FBSDKAccessToken currentAccessToken]) {
        NSLog(@"o usuario esta logado na tela de configuracoes");
        self.loginButton.hidden = NO;
} else {
    NSLog(@"O usuario nao esta logado na tela de configuracoes");
    self.loginButton.hidden = YES;
}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    NSLog(@"esta logado na tela de configuracoes");
}
    // implementaçao do LogOut
    - (IBAction)sair:(id)sender {
        [PFUser logOut];
        PFUser *currentUser = [PFUser currentUser];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *viewController = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:@"login"];
        [self presentViewController:viewController animated:YES completion:nil];
    }
    
    -(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton
    {
        NSLog(@"o usuario deslogou");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *viewController = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:@"login"];
        [self presentViewController:viewController animated:YES completion:nil];
    }

- (IBAction)enviar:(id)sender {
    PFUser *user = [PFUser currentUser];
    
    NSLog(@"%@",user[@"password"]);
    user[@"password"] = self.senhaAtual.text;
    NSLog(@"pode ter ido");
    NSLog(@"%@",user[@"password"]);
    
    if ([self.senhaAtual.text isEqualToString:self.conrfirmaSenha.text]) {
        
        NSLog(@"vou salvar aqui");
        user[@"password"] = self.senhaAtual.text;
        [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            
            if (!error){
                
                UIAlertView* alertview = [[UIAlertView alloc]
                                           initWithTitle:@"Senha Alterada"
                                           message:@"Deseja manter a Localização atual?"
                                           delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
                
                [alertview show];

            } else {
                
                UIAlertView *alertView = [[UIAlertView alloc]
                                          initWithTitle:@"Sorry!"
                                          message:[error.userInfo objectForKey:@"error"]
                                          delegate:nil cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
                
                [alertView show];
                NSLog(@"Nao salvou");
                self.senhaAtual.text = @"";
                self.conrfirmaSenha.text = @"";
            }
        }];
        
    } else {
        
        
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Aa senhas nao sao iguais!"
                                  message:@"informe novamente"
                                  delegate:nil cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        
        [alertView show];
        self.senhaAtual.text = @"";
        self.conrfirmaSenha.text = @"";
        
    }
    
}

//- (void)dismissKeyboard {
//    [self.senhaAtual resignFirstResponder];
//    [self.descricao resignFirstResponder];
//    [self.referencia resignFirstResponder];
//    
//}
////pra subir os campos quando o teclado aparece:
//- (void)textViewDidBeginEditing:(UITextView *)textView{
//    [self animate:YES];
//}
//
//-(void)textViewDidEndEditing:(UITextView *)textView{
//    [self animate:NO];
//}
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField {
//    [self animate:YES];
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField {
//    [self animate:NO];
//}
//
//- (void) animate: (BOOL)up {
//    const int movementDistance = 195; // tweak as needed
//    const float movementDuration = 0.3f; // tweak as needed
//    
//    int movement = (up ? -movementDistance : movementDistance);
//    [UIView beginAnimations: @"anim" context: nil];
//    [UIView setAnimationBeginsFromCurrentState: YES];
//    [UIView setAnimationDuration: movementDuration];
//    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
//    [UIView commitAnimations];
//}
//fim manipulacao tela x teclado

@end
