//
//  informacoesViewController.m
//  Animal
//
//  Created by leonardo fernandes farias on 29/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "informacoesViewController.h"

@interface informacoesViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbTexto;
@property (weak, nonatomic) IBOutlet UIImageView *ivImagem;

@end

@implementation informacoesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Locais"];
    [query whereKey:@"objectId" equalTo:self.idFoto];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         
         if (!error)
         {
             for (PFObject *object in objects)
             {
                // self.labelUser.text = [NSString stringWithFormat:@"@%@", object[@"username"]];
                 PFFile *image = object[@"picture"];
                 NSData *data = [image getData];
                 self.ivImagem.image = [UIImage imageWithData:data];
                 self.lbTexto.text = object[@"descricao"];
                 //self.labelUser.text = object[@"createdBy"];
                 //self.labelUser.text = [NSString stringWithFormat:@"@%@", object[@"username"]];
             }
         }
     }];

    
    // Do any additional setup after loading the view.
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

- (IBAction)voltar:(id)sender {

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *viewController = (UITabBarController *)[storyboard instantiateViewControllerWithIdentifier:@"MapaGlobal"];
    [self presentViewController:viewController animated:YES completion:nil];
}
@end
