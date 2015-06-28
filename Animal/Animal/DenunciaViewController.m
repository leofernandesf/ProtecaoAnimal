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
   // self.descricao.text = @"";
    

    
// gera pontas arredondadas na imageView
    self.foto.layer.cornerRadius = 4;
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
    NSLog(@"ariba muchacho");
}

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
    const int movementDistance = 195; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}
//fim manipulacao tela x teclado
- (IBAction)foto:(id)sender {
    
    
    //por um if aqui: se pegar foto from camera or album 
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:nil];
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.image = info[UIImagePickerControllerEditedImage];
    self.foto.image = self.image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


// fim recurso camera
- (IBAction)registrar:(id)sender {
   
    if (self.foto.image != nil && ![self.tipo.text  isEqual: @""] && ![self.referencia.text  isEqual: @""] && ![self.descricao.text  isEqual: @""]) {
        //        if (![self.tipo.text  isEqual: @""] ) {
        //            NSLog(@"tipo que entrou no if - %@",self.tipo.text);
        //        } else {
        //            NSLog(@"tipo que entrou no else - %@", self.tipo.text);
        //        }
        [self performSegueWithIdentifier:@"registrardenuncia" sender:self];
        //        NSLog(@"tipo - %@", self.tipo.text);
        //        NSLog(@"descricao - %@", self.descricao.text);
        //        NSLog(@"referencia - %@", self.referencia.text);
//        MapDenunciaViewController *denuncia = segue.destinationViewController;
//        denuncia.descricao = self.descricao.text;
//        denuncia.referencia = self.referencia.text;
//        denuncia.tipo = self.tipo.text;
//        denuncia.imagem = self.image;
    } else {
        
//        NSString *mensagem = [NSString stringWithFormat:@"http://maps.apple.com/maps?daddr=%f,%f",_lat,_longi];
        NSLog(@"noa foi");
        UIAlertView* finalCheck = [[UIAlertView alloc]
                                   initWithTitle:@"Campo(s) em branco"
                                   message:@"preencha todos os campos"
                                   delegate:self
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil];
        
        [finalCheck show];
        
        
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"registrardenuncia"]) {

        MapDenunciaViewController *denuncia = segue.destinationViewController;
        denuncia.descricao = self.descricao.text;
        denuncia.referencia = self.referencia.text;
        denuncia.tipo = self.tipo.text;
        denuncia.imagem = self.image;
    }
}
@end
