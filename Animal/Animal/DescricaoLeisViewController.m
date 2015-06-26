//
//  DescricaoLeisViewController.m
//  Animal
//
//  Created by Tiago Cahú Lacerda do Nascimento on 6/24/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "DescricaoLeisViewController.h"
#import "LeisViewController.h"

@interface DescricaoLeisViewController ()
@property (strong, nonatomic) IBOutlet UITextView *lbDescricao;




@end

@implementation DescricaoLeisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    _lbDescricao.text = self.descricao;
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
