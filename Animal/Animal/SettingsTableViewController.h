//
//  SettingsTableViewController.h
//  Animal
//
//  Created by Tiago Cahú Lacerda do Nascimento on 6/19/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"


@interface SettingsTableViewController : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *configuracoes;

@property (weak, nonatomic) IBOutlet UIImageView *sobreNos;

@property (weak, nonatomic) IBOutlet UIImageView *fotoPerfil;


//@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
//
//- (IBAction)sair:(id)sender;
@end
