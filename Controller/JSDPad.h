//
//  JSDPad.h
//  Controller
//
//  Created by James Addyman on 28/03/2013.
//  Copyright (c) 2013 James Addyman. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JSDPadDirection)
{
	JSDPadDirectionUpLeft = 1,
	JSDPadDirectionUp,
	JSDPadDirectionUpRight,
	JSDPadDirectionLeft,
	JSDPadDirectionNone,
	JSDPadDirectionRight,
	JSDPadDirectionDownLeft,
	JSDPadDirectionDown,
	JSDPadDirectionDownRight
};

@class JSDPad;

@protocol JSDPadDelegate <NSObject>

- (void)dPad:(JSDPad *)dPad didPressDirection:(JSDPadDirection)direction;
- (void)dPadDidReleaseDirection:(JSDPad *)dPad;

@end

@interface JSDPad : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, weak) IBOutlet id <JSDPadDelegate> delegate;

@property (nonatomic, assign, getter = isEditing) BOOL editing;
@property (nonatomic, assign) CGSize maxSize;
@property (nonatomic, assign) CGSize minSize;

- (JSDPadDirection)currentDirection;

@end
