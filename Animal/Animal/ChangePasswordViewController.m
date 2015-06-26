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
