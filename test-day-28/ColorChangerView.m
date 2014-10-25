//
//  ColorChangerView.m
//  test-day-28
//
//  Created by Ben Norris on 10/25/14.
//  Copyright (c) 2014 BSN Design. All rights reserved.
//

#import "ColorChangerView.h"

@interface ColorChangerView()

@property (nonatomic, strong) UIButton *colorChangeButton;

@end

@implementation ColorChangerView

- (id)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor darkGrayColor];
        self.layer.cornerRadius = 20;
        
        self.colorChangeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self.colorChangeButton setTitle:@"Change Color" forState:UIControlStateNormal];
        [self.colorChangeButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [self.colorChangeButton addTarget:self action:@selector(buttonTouchDown) forControlEvents:UIControlEventTouchDown];
        
        [self.colorChangeButton addTarget:self action:@selector(buttonTouchUp) forControlEvents:UIControlEventTouchUpInside];
        [self.colorChangeButton addTarget:self action:@selector(buttonTouchUp) forControlEvents:UIControlEventTouchUpOutside];
        
        [self addSubview:self.colorChangeButton];
        
        [self addConstraints:[NSLayoutConstraint
                              constraintsWithVisualFormat:@"H:|-(margin)-[button]-(margin)-|" options:0  metrics:@{@"margin":@8} views:@{@"button":self.colorChangeButton}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button]-|" options:0 metrics:0 views:@{@"button":self.colorChangeButton}]];
    }
    return self;
}

- (void)buttonTouchDown {
    self.backgroundColor = [UIColor lightGrayColor];
    [self.colorChangeButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [self.delegate buttonPressedDown];
}

- (void)buttonTouchUp {
    self.backgroundColor = [UIColor darkGrayColor];
    [self.colorChangeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.delegate buttonLiftedUp];
}

@end
