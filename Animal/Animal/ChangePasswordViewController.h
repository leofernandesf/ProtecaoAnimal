//
//  ChangePasswordViewController.h
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 23/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *senhaAtual;

@property (weak, nonatomic) IBOutlet UITextField *conrfirmaSenha;

- (IBAction)enviar:(id)sender;

@end
