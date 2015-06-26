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

@end

@implementation SelectedOngViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    // text View: descrição
    _lbDescricao.text = self.descricaoOng;
    _lbDescricao.textAlignment = NSTextAlignmentJustified;
    //  [_lbDescricao setFont:[UIFont boldSystemFontOfSize:20]];
    [_lbDescricao setFont:[UIFont fontWithName:@"SofiaProLight" size: 20]];
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
