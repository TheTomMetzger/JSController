//
//  CGCAnalogueStick.h
//  Controller
//
//  Created by James Addyman on 29/03/2013.
//  Copyright (c) 2013 James Addyman. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  CGCAnalogueStick;

@protocol CGCAnalogueStickDelegate <NSObject>

@optional
- (void)analogueStickDidChangeValue:(CGCAnalogueStick *)analogueStick;

@end

@interface CGCAnalogueStick : UIView

@property (nonatomic, readonly) CGFloat xValue;
@property (nonatomic, readonly) CGFloat yValue;
@property (nonatomic, assign) BOOL invertedYAxis;

@property (nonatomic, assign) IBOutlet id <CGCAnalogueStickDelegate> delegate;

@property (nonatomic, readonly) UIImageView *backgroundImageView;
@property (nonatomic, readonly) UIImageView *handleImageView;

@end
