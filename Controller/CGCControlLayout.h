//
//  CGCControlLayout.h
//  Controller
//
//  Created by James Addyman on 04/04/2013.
//  Copyright (c) 2013 James Addyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGCDPad.h"
#import "CGCButton.h"

@interface CGCControlLayout : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) UIDeviceOrientation orientation;

@property (nonatomic, assign) id <CGCDPadDelegate, CGCButtonDelegate> delegate;

- (id)initWithLayout:(NSString *)layoutFile delegate:(id <CGCDPadDelegate, CGCButtonDelegate>)delegate;

@end
