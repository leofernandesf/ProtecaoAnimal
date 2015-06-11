//
//  DenunciaViewController.h
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 10/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DenunciaViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIImageView *fotoDenuncia;

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@end
