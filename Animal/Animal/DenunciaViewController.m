//
//  DenunciaViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 17/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "DenunciaViewController.h"
#import "MapDenunciaViewController.h"
//manipular a imagem
#import <QuartzCore/QuartzCore.h>

@interface DenunciaViewController ()

@end

@implementation DenunciaViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   BOOL userLocationShown = NO;
    NSLog(@"%d", userLocationShown);
    
     self.foto.image = self.image;
    
// gera pontas arredondadas na imageView
    self.foto.layer.cornerRadius = 8;
    self.foto.clipsToBounds = YES;
    
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
    const int movementDistance = 150; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (IBAction)foto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:nil];
    
    //inserir data no momento em que tirar a foto! !!
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    self.foto.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


// fim recurso camera
- (IBAction)registrar:(id)sender {
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"registrardenuncia"]) {
        MapDenunciaViewController *denuncia = segue.destinationViewController;
        denuncia.descricao = self.descricao.text;
        denuncia.referencia = self.referencia.text;
        denuncia.tipo = self.tipo.text;
    }
}
@end
