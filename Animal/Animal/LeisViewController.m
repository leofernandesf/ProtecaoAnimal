//
//  LeisViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 23/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "LeisViewController.h"
#import "DescricaoLeisViewController.h"

@interface LeisViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation LeisViewController

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
        identifier = @"cell8";
    }
    else if (indexPath.row == 1){
        identifier = @"cell9";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    //altera fonte e tamanho texto da tabela. 
    [[cell textLabel] setFont:[UIFont fontWithName:@"SofiaProLight" size: 15]];

    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = [self.tableview indexPathForSelectedRow];
    DescricaoLeisViewController *destino = segue.destinationViewController;

        if (indexPath.row == 0) {
            destino.descricao = @"\n\nArt. 32. Praticar ato de abuso, maus-tratos, ferir ou mutilar animais silvestres, domésticos ou domesticados, nativos ou exóticos:\n\n\tPena - detenção, de três meses a um ano, e multa.\n\n\t\t1º. Incorre nas mesmas penas quem realiza experiência dolorosa ou cruel em animal vivo, ainda que para fins didáticos ou científicos, quando existirem recursos alternativos.\n\t\t2º. “A pena é aumentada de um sexto a um terço, se ocorre morte do animal.";
        }else{
            destino.descricao = @"\n\nArt. 23. É competência comum da união, dos Estados, do Distrito Federal e dos Municípios:\n\n\tVI - proteger o meio ambiente e combater a poluição em qualquer de suas formas;\n\tVII - preservar as florestas, a fauna e a flora;\n\nArt. 225. Todos têm o direito ao meio ambiente ecologicamente equilibrado, bem de uso comum do povo e essencial à sadia qualidade de vida, impondo-se ao poder público e à coletividade o dever de defendê-lo e preservá-lo para os presentes e futuras gerações.\n\t  1.º Para assegurar a efetividade desse direito, incube ao poder público:\n\t\tVII - “proteger o Meio Ambiente adotando iniciativas como: proteger a fauna e a flora, vedadas, na forma da lei, as práticas que coloquem em risco sua função ecológica, provoque a extinção de espécies ou submetam os animais à crueldade.”\n\nA denúncia pode ser feita nas delegacias comuns ou nas especializadas em meio-ambiente. Também se pode denunciar diretamente no ministério Público ou no IBAMA.";
        }
}

@end
