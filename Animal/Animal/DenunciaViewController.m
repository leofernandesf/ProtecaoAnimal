//
//  DenunciaViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 17/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "DenunciaViewController.h"

@interface DenunciaViewController ()

@end

@implementation DenunciaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    // teclado some quando clicar na tela
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    
    
    //pra subir os campos quando o teclado aparece:
    self.tipo.layer.borderColor=[[UIColor colorWithRed:1 green:1 blue:1 alpha:1]CGColor];
    self.tipo.layer.borderWidth=0;
    self.tipo.delegate = self;
    
    self.descricao.layer.borderColor=[[UIColor colorWithRed:1 green:1 blue:1 alpha:1]CGColor];
    self.descricao.layer.borderWidth=0;
    self.descricao.delegate = self;
    
    self.referencia.layer.borderColor=[[UIColor colorWithRed:1 green:1 blue:1 alpha:1]CGColor];
    self.referencia.layer.borderWidth=0;
    self.referencia.delegate = self;
    //fim
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
//some teclado, verificar
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (void)dismissKeyboard {
    [self.tipo resignFirstResponder];
    [self.descricao resignFirstResponder];
    [self.referencia resignFirstResponder];
    
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
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (IBAction)foto:(id)sender {
}
@end
