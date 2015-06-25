//
//  InfoViewController.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 19/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

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
    
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier;
    if (indexPath.row == 0) {
        identifier = @"cell2";
    }
    else if (indexPath.row == 1) {
        identifier = @"cell3";
    }
    else{
        identifier = @"cell10";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    //altera fonte e tamanho texto da tabela.
    [[cell textLabel] setFont:[UIFont fontWithName:@"SofiaProLight" size: 15]];
    return cell;
}

@end
