//
//  OngsViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 23/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "OngsViewController.h"
#import "SelectedOngViewController.h"


@interface OngsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation OngsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier;
    if (indexPath.row == 0) {
        identifier = @"cell4";
    }
    else{
        identifier = @"cell5";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    //altera fonte e tamanho texto da tabela.
    [[cell textLabel] setFont:[UIFont fontWithName:@"SofiaProLight" size: 15]];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = [self.tableview indexPathForSelectedRow];
    SelectedOngViewController *destino = segue.destinationViewController;
    
    if (indexPath.row == 0) {
        destino.descricaoOng = @"\n\n Descrição ONG 1";
        destino.nomeOng = @"ONG 1";
        destino.telefoneOng = @"ONG 1";
        destino.siteOng = @"ONG 1";
        destino.enderecoOng = @"ONG 1";
        destino.fotoOng = @"pino-3";
    }else{
        destino.descricaoOng = @"\n\n Descrição ONG 2";
        destino.nomeOng = @"ONG 2";
        destino.telefoneOng = @"ONG 2";
        destino.siteOng = @"ONG 2";
        destino.enderecoOng = @"ONG 2";
        destino.fotoOng = @"pino-3.png";
    }
}

@end
