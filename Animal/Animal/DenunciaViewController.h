//
//  DenunciaViewController.h
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 17/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface DenunciaViewController : UIViewController <UITextViewDelegate,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *tipo;
@property (strong, nonatomic) IBOutlet UITextField *referencia;

@property (weak, nonatomic) IBOutlet UITextView *descricao;
@property (nonatomic, retain) UIImage * image;

@property (strong, nonatomic) IBOutlet UIImageView *foto;
- (IBAction)foto:(id)sender;
@end
