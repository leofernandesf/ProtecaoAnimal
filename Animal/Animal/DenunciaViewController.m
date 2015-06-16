//
//  DenunciaViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 10/06/15.
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
/*
 ATIVAR ESTA PARTE QUANDO A TELA ESTIVER PRONTA!!!!
 
//some teclado, verificar
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (void)dismissKeyboard {
    [self. resignFirstResponder];
    [self.segundoNome resignFirstResponder];
    [self.email resignFirstResponder];
    [self.senha resignFirstResponder];
}
*/
@end
