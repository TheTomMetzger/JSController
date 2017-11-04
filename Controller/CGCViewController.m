//
//  CGCViewController.m
//  Controller
//
//  Created by James Addyman on 28/03/2013.
//  Copyright (c) 2013 James Addyman. All rights reserved.
//

#import "CGCViewController.h"
#import "CGCDPad.h"

@interface CGCViewController () {
	
	NSMutableArray *_pressedButtons;
	
}

- (NSString *)stringForDirection:(CGCDPadDirection)direction;

@end

@implementation CGCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[[self.aButton titleLabel] setText:@"A"];
	[self.aButton setBackgroundImage:[UIImage imageNamed:@"button"]];
	[self.aButton setBackgroundImagePressed:[UIImage imageNamed:@"button-pressed"]];
	
	
	[[self.bButton titleLabel] setText:@"B"];
	[self.bButton setBackgroundImage:[UIImage imageNamed:@"button"]];
	[self.bButton setBackgroundImagePressed:[UIImage imageNamed:@"button-pressed"]];
	
	_pressedButtons = [NSMutableArray new];
	
	[self updateDirectionLabel];
	[self updateButtonLabel];
	[self updateAnalogueLabel];
	
	if (self.showDPad)
	{
		self.dPad.isImageBased = true;
		[self.directionlabel setHidden:NO];
		[self.dPad setHidden:NO];
		
		[self.analogueLabel setHidden:YES];
		[self.analogueStick setHidden:YES];
	}
	
	if (self.showAnalogue)
	{
		[self.directionlabel setHidden:YES];
		[self.dPad setHidden:YES];
		
		[self.analogueLabel setHidden:NO];
		[self.analogueStick setHidden:NO];
	}
	
	UIBarButtonItem *editButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
																					target:self
																					action:@selector(toggleEditing:)];
	[self.navigationItem setRightBarButtonItem:editButtonItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)toggleEditing:(id)sender
{
	[self.dPad setEditing:![self.dPad isEditing]];
	if ([self.dPad isEditing])
	{
		UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
																						target:self
																						action:@selector(toggleEditing:)];
		[self.navigationItem setRightBarButtonItem:doneButtonItem];
	}
	else
	{
		UIBarButtonItem *editButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
																						target:self
																						action:@selector(toggleEditing:)];
		[self.navigationItem setRightBarButtonItem:editButtonItem];
	}
}

- (NSString *)stringForDirection:(CGCDPadDirection)direction
{
	NSString *string = nil;
	
	switch (direction) {
		case CGCDPadDirectionNone:
			string = @"None";
			break;
		case CGCDPadDirectionUp:
			string = @"Up";
			break;
		case CGCDPadDirectionDown:
			string = @"Down";
			break;
		case CGCDPadDirectionLeft:
			string = @"Left";
			break;
		case CGCDPadDirectionRight:
			string = @"Right";
			break;
		case CGCDPadDirectionUpLeft:
			string = @"Up Left";
			break;
		case CGCDPadDirectionUpRight:
			string = @"Up Right";
			break;
		case CGCDPadDirectionDownLeft:
			string = @"Down Left";
			break;
		case CGCDPadDirectionDownRight:
			string = @"Down Right";
			break;
		default:
			string = @"None";
			break;
	}
	
	return string;
}

- (void)updateDirectionLabel
{
	[self.directionlabel setText:[NSString stringWithFormat:@"Direction: %@", [self stringForDirection:[self.dPad currentDirection]]]];
}

- (void)updateButtonLabel
{
	NSString *buttonString = @"";
	
	for(CGCButton *button in _pressedButtons)
	{
		if ([buttonString length])
		{
			buttonString = [buttonString stringByAppendingFormat:@", "];
		}
		
		if ([button isEqual:self.aButton])
		{
			buttonString = [buttonString stringByAppendingFormat:@"A"];
		}
		else if ([button isEqual:self.bButton])
		{
			buttonString = [buttonString stringByAppendingFormat:@"B"];
		}
	}
	
	[self.buttonLabel setText:[NSString stringWithFormat:@"Buttons pressed: %@", buttonString]];
}

- (void)updateAnalogueLabel
{
	[self.analogueLabel setText:[NSString stringWithFormat:@"Analogue: %.1f , %.1f", self.analogueStick.xValue, self.analogueStick.yValue]];
}

#pragma mark - CGCDPadDelegate

- (void)dPad:(CGCDPad *)dPad didPressDirection:(CGCDPadDirection)direction
{
	NSLog(@"Changing direction to: %@", [self stringForDirection:direction]);
	[self updateDirectionLabel];
}

- (void)dPadDidReleaseDirection:(CGCDPad *)dPad
{
	NSLog(@"Releasing DPad");
	[self updateDirectionLabel];
}

#pragma mark - CGCButtonDelegate

- (void)buttonPressed:(CGCButton *)button
{
	if ([_pressedButtons containsObject:button])
	{
		NSLog(@"Button is already being tracked as pressed");
		return;
	}
	
	if ([button isEqual:self.aButton])
	{
		[_pressedButtons addObject:self.aButton];
	}
	else if ([button isEqual:self.bButton])
	{
		[_pressedButtons addObject:self.bButton];
	}
	
	[self updateButtonLabel];
}

- (void)buttonReleased:(CGCButton *)button
{
	if ([_pressedButtons containsObject:button] == NO)
	{
		NSLog(@"Button has already been released");
		return;
	}
	
	if ([button isEqual:self.aButton])
	{
		[_pressedButtons removeObject:self.aButton];
	}
	else if ([button isEqual:self.bButton])
	{
		[_pressedButtons removeObject:self.bButton];
	}
	
	[self updateButtonLabel];
	
}

#pragma mark - CGCAnalogueStickDelegate

- (void)analogueStickDidChangeValue:(CGCAnalogueStick *)analogueStick
{
	[self updateAnalogueLabel];
}

@end
