//
//  InfoViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 19/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "InfoViewController.h"
#import "DescricaoLeisViewController.h"

@interface InfoViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation InfoViewController

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
    
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier;
    if (indexPath.row == 0) {
        identifier = @"cell2";
    }
    else if (indexPath.row == 1) {
        identifier = @"cell3";
    }
    else if (indexPath.row == 2){
        identifier = @"cell10";
    }
    else if (indexPath.row == 3){
        identifier = @"cell11";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    //altera fonte e tamanho texto da tabela.
    [[cell textLabel] setFont:[UIFont fontWithName:@"SofiaProLight" size: 15]];
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    DescricaoLeisViewController *destino = segue.destinationViewController;
    if (indexPath.row == 3) {
        
        destino.descricao = @"\n\n* Dirija-se até a delegacia mais próxima ou compareça à promotoria de justiça do meio ambiente;\n\n* O ato de denunciar maus-tratos é legitimada pelo Art. 32, da lei Federal nº. 9.605, de 12.02.1998 (Lei de Crimes Ambientais) e pela Constituição Federal Brasileira, de 05 de outubro de 1998;\n\n* Outra recomendação importante é recorrer ao zoonoses que poderá eventualmente repassar as denúncias aos órgãos responsáveis.";
        
    }}

@end
