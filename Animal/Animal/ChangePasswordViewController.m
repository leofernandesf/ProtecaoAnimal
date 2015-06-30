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
    
NSLog(@"\n\nEmail do usuaro atual: %@", user[@"email"]);
    
//botoes de logOut
    self.loginButton.delegate = self;
    
    if ([FBSDKAccessToken currentAccessToken]) {
        NSLog(@"o usuario esta logado na tela de configuracoes");
        self.loginButton.hidden = NO;
} else {
    NSLog(@"O usuario nao esta logado na tela de configuracoes");
    self.loginButton.hidden = YES;
}
   
    
    // teste botao edit
    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithTitle:@"DONE" style:UIBarButtonItemStyleDone target:self action:@selector(addAction:)]autoContentAccessingProxy];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
//TECLADO \/
    // teclado some quando clicar na tela
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    
    //pra subir os campos quando o teclado aparece:
    self.senhaAtual.layer.borderColor=[[UIColor colorWithRed:1 green:1 blue:1 alpha:1]CGColor];
    self.senhaAtual.layer.borderWidth=0;
    self.senhaAtual.delegate = self;
    
    self.conrfirmaSenha.layer.borderColor=[[UIColor colorWithRed:1 green:1 blue:1 alpha:1]CGColor];
    self.conrfirmaSenha.layer.borderWidth=0;
    self.conrfirmaSenha.delegate = self;
    //fim
    
    
    
} //fim viewDidLoad

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
        [PFUser logOut];
        PFUser *currentUser = [PFUser currentUser];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *viewController = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:@"login"];
        [self presentViewController:viewController animated:YES completion:nil];
    }



- (IBAction)save:(id)sender {
    
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
                                          message:@""
                                          delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
                
                [alertview show];
                
            } else {
                
                UIAlertView *alertView = [[UIAlertView alloc]
                                          initWithTitle:@"Dados insuficientes"
                                          message:[error.userInfo objectForKey:@"Informe corretamente"]
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
                                  initWithTitle:@"Campos diferentes"
                                  message:@"Informe novamente"
                                  delegate:nil cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        
        [alertView show];
        self.senhaAtual.text = @"";
        self.conrfirmaSenha.text = @"";
        
    }

    
}



- (IBAction)fotoEdit:(id)sender {
    
        
        //por um if aqui: se pegar foto from camera or album
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    
}

//some teclado, verificar
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (void)dismissKeyboard {
    [self.senhaAtual resignFirstResponder];
    [self.conrfirmaSenha resignFirstResponder];
   
    
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
    const int movementDistance = 0; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}
//fim manipulacao tela x teclado
////Adicionar posteriormente na atualização: alterar e-mail

//- (IBAction)enviarEmail:(id)sender {
//
//        PFUser *user = [PFUser currentUser];
//        
//        NSLog(@"%@",user[@"email"]);
//        user[@"email"] = self.redefinirEmail.text;
//        NSLog(@"pode ter ido");
//        NSLog(@"%@",user[@"email"]);
//        
//        if ([self.redefinirEmail.text isEqualToString:self.confirmaEmail.text]) {
//            
//            NSLog(@"vou salvar aqui");
//            user[@"password"] = self.redefinirEmail.text;
//            [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                
//                if (!error){
//                    
//                    UIAlertView* alertview = [[UIAlertView alloc]
//                                              initWithTitle:@"e-Mail Alterado"
//                                              message:@""
//                                              delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//                    
//                    [alertview show];
//                    
//                } else {
//                    
//                    UIAlertView *alertView = [[UIAlertView alloc]
//                                              initWithTitle:@"Dados Insuficientes"
//                                              message:[error.userInfo objectForKey:@"Informe novamente"]
//                                              delegate:nil cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//                    
//                    [alertView show];
//                    NSLog(@"Nao salvou");
//                    self.redefinirEmail.text = @"";
//                    self.confirmaEmail.text = @"";
//                }
//            }];
//            
//        } else {
//            
//            
//            UIAlertView *alertView = [[UIAlertView alloc]
//                                      initWithTitle:@"Os e-Mails nao sao iguais!"
//                                      message:@"informe novamente"
//                                      delegate:nil cancelButtonTitle:@"OK"
//                                      otherButtonTitles:nil];
//            
//            [alertView show];
//            self.redefinirEmail.text = @"";
//            self.confirmaEmail.text = @"";
//            
//        }

 //   }

// funções para baixar teclado. 
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
