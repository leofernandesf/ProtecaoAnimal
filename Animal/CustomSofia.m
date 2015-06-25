//
//  CustomSofia.m
//  Animal
//
//  Created by Pedro Luis Berbel dos Santos on 25/06/15.
//  Copyright (c) 2015 leonardo fernandes farias. All rights reserved.
//

#import "CustomSofia.h"

@implementation CustomSofia

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder: decoder]) {
        UIColor *textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.0f];
        [self setTextColor:textColor];
        [self setShadowColor:textColor];
        [self setHighlightedTextColor:textColor];
        [self setFont:[UIFont fontWithName:@"SofiaProLight" size:self.font.pointSize]];
    }
    return self;
}

@end
