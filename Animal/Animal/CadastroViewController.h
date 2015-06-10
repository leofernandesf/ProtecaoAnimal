//
//  CadastroViewController.h
//  Animal
//
//  Created by Tiago Cahú Lacerda do Nascimento on 6/10/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CadastroViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *primeiroNome;

@property (weak, nonatomic) IBOutlet UITextField *segundoNome;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *senha;

@end
