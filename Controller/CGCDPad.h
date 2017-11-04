//
//  CGCDPad.h
//  Controller
//
//  Created by James Addyman on 28/03/2013.
//  Copyright (c) 2013 James Addyman. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CGCDPadDirection)
{
	CGCDPadDirectionUpLeft = 1,
	CGCDPadDirectionUp,
	CGCDPadDirectionUpRight,
	CGCDPadDirectionLeft,
	CGCDPadDirectionNone,
	CGCDPadDirectionRight,
	CGCDPadDirectionDownLeft,
	CGCDPadDirectionDown,
	CGCDPadDirectionDownRight
};

@class CGCDPad;

@protocol CGCDPadDelegate <NSObject>

- (void)dPad:(CGCDPad *)dPad didPressDirection:(CGCDPadDirection)direction;
- (void)dPadDidReleaseDirection:(CGCDPad *)dPad;

@end

@interface CGCDPad : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, weak) IBOutlet id <CGCDPadDelegate> delegate;

@property (nonatomic, assign, getter = isEditing) BOOL editing;
@property bool isImageBased;
@property (nonatomic, assign) CGSize maxSize;
@property (nonatomic, assign) CGSize minSize;

- (CGCDPadDirection)currentDirection;

@end
