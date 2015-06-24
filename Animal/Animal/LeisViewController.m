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
    
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier;
    if (indexPath.row == 0) {
        identifier = @"cell7";
    }
    else if (indexPath.row == 1){
        identifier = @"cell8";
    }
    else{
        identifier = @"cell9";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = [self.tableview indexPathForSelectedRow];
    DescricaoLeisViewController *destino = segue.destinationViewController;
    if (indexPath.row == 0) {
        destino.descricao = @"secao 0";
        
          }else
        if (indexPath.row == 1) {
            destino.descricao = @"Secao 1";
        }else{
            destino.descricao = @"Secao 2";
        }
}

@end
