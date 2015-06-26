//
//  SettingsViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 18/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "SettingsViewController.h"
#import "ViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (section == 0) {
//        return @"Estados";
//    } else {
//        return @"Distritos";
//    }
//}

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    NSInteger total;
//    
//    if (section == 0) {
//        total = [[BPDUnidadeFederativaStore states].items count];
//    } else {
//        total = [[BPDUnidadeFederativaStore districts].items count];
//    }
//    return [NSString stringWithFormat:@"Total: %ld item(ns)", (long)total];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier;
    if (indexPath.row == 0) {
        identifier = @"cell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    /*
     if (!cell) {
     NSLog(@"Uma celula acabou de ser criada!");
     UITableViewCellStyle style = (indexPath.row < 5 ? UITableViewCellStyleValue1 : UITableViewCellStyleSubtitle);
     
     cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:identifier];
     }
     */
    
//    NSArray *items;
//    if (indexPath.section == 0) {
//        items = [BPDUnidadeFederativaStore states].items;
//    } else {
//        items = [BPDUnidadeFederativaStore districts].items;
//    }
//    BPDUnidadeFederativa *uf = [items objectAtIndex:indexPath.row];
//    
//    UIImage *icon = [UIImage imageNamed:uf.code];
//    
//    cell.textLabel.text = uf.name;
//    cell.detailTextLabel.text = uf.code;
//    cell.imageView.image = icon;
    
    //    if (indexPath.row == 5) {
    //        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    //    } else {
    //        cell.accessoryType = UITableViewCellAccessoryNone;
    //    }
    
    return cell;
}


//- (IBAction)sair:(id)sender {
//    [PFUser logOut];
//    PFUser *currentUser = [PFUser currentUser];
//    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ViewController *viewController = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:@"login"];
//    [self presentViewController:viewController animated:YES completion:nil];
//}
@end
