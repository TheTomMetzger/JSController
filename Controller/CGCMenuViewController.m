//
//  CGCMenuViewController.m
//  CGCController
//
//  Created by James Addyman on 26/07/2013.
//  Copyright (c) 2013 James Addyman. All rights reserved.
//

#import "CGCMenuViewController.h"
#import "CGCViewController.h"

static NSString *CellIdentifier = @"Cell";

@interface CGCMenuViewController ()

@end

@implementation CGCMenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    if ((self = [super initWithStyle:style]))
	{
    }
	
    return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	
	if (indexPath.row == 0)
	{
		cell.textLabel.text = @"Directional Pad";
	}
	else
	{
		cell.textLabel.text = @"Analogue Stick";
	}
	
	return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row == 0)
	{
		CGCViewController *viewController = [[CGCViewController alloc] initWithNibName:@"CGCViewController" bundle:nil];
		[viewController setShowDPad:YES];
		[self.navigationController pushViewController:viewController animated:YES];
	}
	else
	{
		CGCViewController *viewController = [[CGCViewController alloc] initWithNibName:@"CGCViewController" bundle:nil];
		[viewController setShowAnalogue:YES];
		[self.navigationController pushViewController:viewController animated:YES];
	}
}

@end
