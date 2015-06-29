//
//  ViewController.m
//  Animal
//
//  Created by Tiago Cahú on 09/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "ViewController.h"



@interface ViewController () <FBSDKLoginButtonDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldUsername;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    
    
    if ([FBSDKAccessToken currentAccessToken]) {
        NSLog(@"o usuario esta logado1");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        MapBarViewController *viewController = (MapBarViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MapaGlobal"];
        [self presentViewController:viewController animated:NO completion:nil];
        
    } else {
        NSLog(@"O usuario nao esta logado1");
    }

    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        MapBarViewController *viewController = (MapBarViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MapaGlobal"];
        [self presentViewController:viewController animated:NO completion:nil];
        
    }
   
   
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    //NSLog(@"acjnasjcnsajncjasncas ---- %@",self.loginButton);
    
    // In your viewDidLoad method:
    self.loginButton.delegate = self;
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
    

    
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
    
    
    
//        // Do any additional setup after loading the view, typically from a nib.
    
    
    // teclado some quando clicar na tela
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    
    
//pra subir os campos quando o teclado aparece:
    self.nome.layer.borderColor=[[UIColor colorWithRed:1 green:1 blue:1 alpha:1]CGColor];
    self.nome.layer.borderWidth=0;
    self.nome.delegate = self;
    
    self.senha.layer.borderColor=[[UIColor colorWithRed:1 green:1 blue:1 alpha:1]CGColor];
    self.senha.layer.borderWidth=0;
    self.senha.delegate = self;
//fim
    
    }

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    NSLog(@"ariba muchacho filha da puta");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MapBarViewController *viewController = (MapBarViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MapaGlobal"];
    [self presentViewController:viewController animated:NO completion:nil];
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton
{
    NSLog(@"o usuario deslogou");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Esconde Status Bar (Barra do relógio)
//- (BOOL)prefersStatusBarHidden {
//    return YES;  
//}


- (IBAction)Login:(id)sender {
//    [PFUser logInWithUsernameInBackground:_nome.text password:_senha.text
//                                    block:^(PFUser *user, NSError *error) {
//                                        if (user) {
//                                            // Do stuff after successful login.
//                                            NSLog(@"Entrou abestado");
//                                        } else {
//                                            NSLog(@"Nao Entrou abestado");   
//                                            
//                                            // The login failed. Check error to see why.
//                                        }
//                                    }];   
    
   

}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"login"]&&[PFUser logInWithUsername:self.textFieldUsername.text password:self.textFieldPassword.text]){
        NSLog(@"%@", [PFUser currentUser]);
        return YES;
    }else if ([identifier isEqualToString:@"cadastrar"]){
        return YES;
    }
    return NO;
}


//some teclado, verificar
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (void)dismissKeyboard {
    [self.nome resignFirstResponder];
    [self.senha resignFirstResponder];
    
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
    const int movementDistance = 50; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

@end
