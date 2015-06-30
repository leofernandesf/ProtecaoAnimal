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
    //define o que vai aparecer na tela... 
    if (indexPath.row == 0) {
        destino.descricaoOng = @"\n\n Descrição ONG 1 \n\n Aqui serão expostas as características de cada organização, cada organização poderá criar um perfil organizacional que será implementado posteriormente, sendo assim poderão editar os dados que serão expostos ao publico que fizer uso do PetAlert®. \n\n Aqui serão expostas as características de cada organização, cada organização poderá criar um perfil organizacional que será implementado posteriormente, sendo assim poderão editar os dados que serão expostos ao publico que fizer uso do PetAlert®.\n\n Aqui serão expostas as características de cada organização, cada organização poderá criar um perfil organizacional que será implementado posteriormente, sendo assim poderão editar os dados que serão expostos ao publico que fizer uso do PetAlert®.\n\n Aqui serão expostas as características de cada organização, cada organização poderá criar um perfil organizacional que será implementado posteriormente, sendo assim poderão editar os dados que serão expostos ao publico que fizer uso do PetAlert®.";
        destino.nomeOng = @"Nome ONG 1";
        destino.telefoneOng = @"(00)9999-9999";
        destino.siteOng = @"www.ong1.org";
        destino.enderecoOng = @"Rua 1, 234 - Bairro, Cidade";
        // destino.fotoOng = @"pino-3";
    }else{
        destino.descricaoOng = @"\n\n Descrição ONG 2";
        destino.nomeOng = @"Nome ONG 2";
        destino.telefoneOng = @"(00)2222-2222";
        destino.siteOng = @"www.ong2.org";
        destino.enderecoOng = @"Rua 1, 234 - Bairro, Cidade";
     //   destino.fotoOng = @"pino-3.png";
    }
}

@end
