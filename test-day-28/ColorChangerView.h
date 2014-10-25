//
//  ColorChangerView.h
//  test-day-28
//
//  Created by Ben Norris on 10/25/14.
//  Copyright (c) 2014 BSN Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorChangeDelegate;

@interface ColorChangerView : UIView

@property (nonatomic, weak) id<ColorChangeDelegate> delegate;

@end

@protocol ColorChangeDelegate <NSObject>

@required
- (void)buttonPressedDown;
- (void)buttonLiftedUp;

@end
