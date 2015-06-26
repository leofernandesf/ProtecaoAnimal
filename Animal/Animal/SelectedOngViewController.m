//
//  SelectedOngViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 23/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "SelectedOngViewController.h"
#import "OngsViewController.h"

@interface SelectedOngViewController ()
@property (weak, nonatomic) IBOutlet UITextView *lbDescricao;
@property (weak, nonatomic) IBOutlet UIImage *lbFoto;
@property (weak, nonatomic) IBOutlet UILabel *lbEndereco;
@property (weak, nonatomic) IBOutlet UILabel *lbSite;
@property (weak, nonatomic) IBOutlet UILabel *lbTelefone;
@property (weak, nonatomic) IBOutlet UILabel *lbNome;

@end

@implementation SelectedOngViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //definindo os bagulhos
    _lbNome.text = self.nomeOng;
    _lbNome.textAlignment = NSTextAlignmentJustified;
    _lbTelefone.text = self.telefoneOng;
    _lbTelefone.textAlignment = NSTextAlignmentJustified;
    _lbSite.text = self.siteOng;
    _lbSite.textAlignment = NSTextAlignmentJustified;
    _lbEndereco.text = self.enderecoOng;
    _lbEndereco.textAlignment = NSTextAlignmentJustified;
    
    
    [_lbNome setFont:[UIFont fontWithName:@"SofiaProLight" size: 25]];
    //texto telefone, endereco, site
     [_lbTelefone setFont:[UIFont fontWithName:@"SofiaProLight" size: 20]];
     [_lbSite setFont:[UIFont fontWithName:@"SofiaProLight" size: 20]];
     [_lbEndereco setFont:[UIFont fontWithName:@"SofiaProLight" size: 20]];
    
    
    // text View: descrição
    _lbDescricao.text = self.descricaoOng;
    _lbDescricao.textAlignment = NSTextAlignmentJustified;
    [_lbDescricao setFont:[UIFont fontWithName:@"SofiaProLight" size: 20]];
    
    //foto
    
    
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

@end
