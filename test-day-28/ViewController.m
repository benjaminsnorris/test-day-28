//
//  ViewController.m
//  test-day-28
//
//  Created by Ben Norris on 10/25/14.
//  Copyright (c) 2014 BSN Design. All rights reserved.
//

#import "ViewController.h"
#import "ColorChangerView.h"

@interface ViewController () <ColorChangeDelegate>

@property (nonatomic, assign) BOOL wasBlue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    
    ColorChangerView *colorChangerView = [[ColorChangerView alloc] init];
    colorChangerView.delegate = self;
    [colorChangerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:colorChangerView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(50)-[view]-(50)-|" options:0 metrics:0 views:@{@"view":colorChangerView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(100)-[view(100)]" options:0 metrics:0 views:@{@"view":colorChangerView}]];
}

#pragma mark - ColorChangerDelegate Methods

- (void)buttonPressedDown {
    self.wasBlue = self.view.backgroundColor == [UIColor blueColor] ? YES : NO;
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)buttonLiftedUp {
    self.view.backgroundColor = self.wasBlue ? [UIColor orangeColor] : [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
