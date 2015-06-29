//
//  ChangePasswordViewController.h
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 23/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ChangePasswordViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *senhaAtual;

@property (weak, nonatomic) IBOutlet UITextField *conrfirmaSenha;
//botao de alterar os dados
- (IBAction)enviar:(id)sender;


//botoes para logOut
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
- (IBAction)sair:(id)sender;

@end
