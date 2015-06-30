//
//  ChangePasswordViewController.h
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 23/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ChangePasswordViewController : UIViewController <UITextFieldDelegate, UITabBarControllerDelegate>

//Alteração da senha:
@property (strong, nonatomic) IBOutlet UITextField *senhaAtual;
@property (weak, nonatomic) IBOutlet UITextField *conrfirmaSenha;

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
- (IBAction)fotoEdit:(id)sender;

- (IBAction)save:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *fotoPerfil;
@property (nonatomic, retain) UIImage * image2;
//botoes para logOut
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
- (IBAction)sair:(id)sender;


//Adicionar posteriormente na atualização: alterar e-mail
//@property (weak, nonatomic) IBOutlet UITextField *redefinirEmail;
//@property (weak, nonatomic) IBOutlet UITextField *confirmaEmail;
//- (IBAction)enviarEmail:(id)sender;



@end
