//
//  SettingsTableViewController.m
//  Animal
//
//  Created by Tiago Cahú Lacerda do Nascimento on 6/19/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "SettingsTableViewController.h"

@interface SettingsTableViewController ()// <FBSDKLoginButtonDelegate>

@end

@implementation SettingsTableViewController




- (void)viewDidLoad {
    
    [super viewDidLoad];
    // gera pontas arredondadas na imageView
    self.sobreNos.layer.cornerRadius = 4;
    self.sobreNos.clipsToBounds = YES;
    
    // gera pontas arredondadas na imageView
    self.fotoPerfil.layer.cornerRadius = 4;
    self.fotoPerfil.clipsToBounds = YES;
    
}
//    self.loginButton.delegate = self;
//    
//    if ([FBSDKAccessToken currentAccessToken]) {
//        NSLog(@"o usuario esta logado na tela de configuracoes");
//        self.loginButton.hidden = NO;

//        
//    } else {
//        NSLog(@"O usuario nao esta logado na tela de configuracoes");
//        self.loginButton.hidden = YES;
//    }
//    
//}
//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return 2;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSString *identifier;
//    if (indexPath.row == 0) {
//        identifier = @"cell";
//    }
//    else{
//        identifier = @"cell1";
//    }
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
//    //muda fonte e tamanho do texto da table
//    [[cell textLabel] setFont:[UIFont fontWithName:@"SofiaProLight" size: 15]];
//    
//
//    return cell;
//}
//
//-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
//    NSLog(@"esta logado na tela de configuracoes");
//}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// implementaçao do LogOut
//- (IBAction)sair:(id)sender {
//    [PFUser logOut];
//    PFUser *currentUser = [PFUser currentUser];
//    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ViewController *viewController = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:@"login"];
//    [self presentViewController:viewController animated:YES completion:nil];
//}
//
//-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton
//{
//    NSLog(@"o usuario deslogou");
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ViewController *viewController = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:@"login"];
//    [self presentViewController:viewController animated:YES completion:nil];
//}

@end
