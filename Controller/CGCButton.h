//
//  CGCButton.h
//  Controller
//
//  Created by James Addyman on 29/03/2013.
//  Copyright (c) 2013 James Addyman. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGCButton;

@protocol CGCButtonDelegate <NSObject>

- (void)buttonPressed:(CGCButton *)button;
- (void)buttonReleased:(CGCButton *)button;

@end

@interface CGCButton : UIView

@property (nonatomic, readonly) UILabel *titleLabel;
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) UIImage *backgroundImagePressed;
@property (nonatomic, assign) UIEdgeInsets titleEdgeInsets;
@property (nonatomic, assign) BOOL pressed;

@property (nonatomic, weak) IBOutlet id <CGCButtonDelegate> delegate;

@end
