//
//  ViewController.h
//  Animal
//
//  Created by leonardo fernandes farias on 09/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nome;
@property (strong, nonatomic) IBOutlet UITextField *senha;
 

//@property (strong, nonatomic) IBOutlet UITextField *senha;
- (IBAction)Login:(id)sender;
@end

