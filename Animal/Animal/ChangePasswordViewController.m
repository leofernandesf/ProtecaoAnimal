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

@end
