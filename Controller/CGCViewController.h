//
//  CGCViewController.h
//  Controller
//
//  Created by James Addyman on 28/03/2013.
//  Copyright (c) 2013 James Addyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGCDPad.h"
#import "CGCButton.h"
#import "CGCAnalogueStick.h"

@interface CGCViewController : UIViewController <CGCDPadDelegate, CGCButtonDelegate, CGCAnalogueStickDelegate>

@property (weak, nonatomic) IBOutlet UILabel *directionlabel;
@property (weak, nonatomic) IBOutlet UILabel *buttonLabel;
@property (weak, nonatomic) IBOutlet UILabel *analogueLabel;
@property (weak, nonatomic) IBOutlet CGCDPad *dPad;
@property (weak, nonatomic) IBOutlet CGCButton *bButton;
@property (weak, nonatomic) IBOutlet CGCButton *aButton;
@property (weak, nonatomic) IBOutlet CGCAnalogueStick *analogueStick;

@property (nonatomic, assign) BOOL showDPad;
@property (nonatomic, assign) BOOL showAnalogue;

@end
