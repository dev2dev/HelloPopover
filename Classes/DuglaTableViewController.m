//
//  DuglaTableViewController.m
//  HelloPopover
//
//  Created by turner on 4/17/10.
//  Copyright 2010 Douglass Turner Consulting. All rights reserved.
//

#import "DuglaTableViewController.h"

enum {
    InstructorsGroup = 0,
    TeachingAssistantsGroup,
    GuestLecturersGroup
};

@implementation DuglaTableViewController

@synthesize instructors = m_instructors;
@synthesize teachingAssistants = m_teachingAssistants;
@synthesize guestLecturers = m_guestLecturers;
@synthesize popoverController = m_popoverController;
@synthesize detailDescriptionLabel = m_detailDescriptionLabel;

#pragma mark -
#pragma mark Dugla TableView Controller - Lifecycle Methods

- (void)dealloc {
	
    [m_instructors				release], m_instructors = nil;
    [m_teachingAssistants		release], m_teachingAssistants = nil;
    [m_guestLecturers			release], m_guestLecturers = nil;
    [m_popoverController		release], m_popoverController = nil;
    [m_detailDescriptionLabel	release], m_detailDescriptionLabel = nil;
    
    [super dealloc];
}

- (void)viewDidLoad {
	
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	self.instructors = 
	[[[NSMutableArray alloc] 
	  initWithObjects:@"Alan", @"Evan", @"Paul M.", @"Alan", @"Evan", @"Paul M.", nil] autorelease];
	
	self.teachingAssistants = 
	[[[NSMutableArray alloc] 
	  initWithObjects:@"Troy", @"Paul S.", @"Troy", @"Paul S.", nil] autorelease];
	
	self.guestLecturers = 
	[[[NSMutableArray alloc] 
	  initWithObjects:@"Jason", @"Josh", @"Alex", @"Justin", @"Eric", @"Dan", @"Jason", @"Josh", @"Alex", @"Justin", @"Eric", @"Dan", nil] autorelease];
		
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidUnload {

	// Do Stuff
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}

#pragma mark -
#pragma mark UITableView DataSource Protocol Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 3;
//	return 1;
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
    return [[self namesForSection:section] count];
//	return 128;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCell"];
	
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"DefaultCell"] autorelease];
    }
    
    cell.textLabel.text = [self nameForIndexPath:indexPath];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
    switch (section) {
        case InstructorsGroup:
            return @"Instructors";
        case TeachingAssistantsGroup:
            return @"Teaching Assistants";
        case GuestLecturersGroup:
            return @"Guest Lecturers";
        default:
            return nil;
    }
}


#pragma mark -
#pragma mark UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	self.detailDescriptionLabel.text = 
	[NSString stringWithFormat:@"You Selected %@", [self nameForIndexPath:indexPath]];
	
	[self.popoverController dismissPopoverAnimated:YES];
}

// THIS IS THE DEFAULT IMPLEMENTATION PROVIDED BY THE TEMPLATE
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//	
//    // Navigation logic may go here. Create and push another view controller.
//	/*
//	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//	 [self.navigationController pushViewController:detailViewController animated:YES];
//	 [detailViewController release];
//	 */
//}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

#pragma mark -
#pragma mark My TableView Controller - Helper Methods

- (NSMutableArray *)namesForSection:(NSInteger)section {
	
    switch (section) {
        case InstructorsGroup:
            return self.instructors;
        case TeachingAssistantsGroup:
            return self.teachingAssistants;
        case GuestLecturersGroup:
            return self.guestLecturers;
        default:
            return nil;
    }
}

- (NSString *)nameForIndexPath:(NSIndexPath *)indexPath {
	
    return [[self namesForSection:indexPath.section] objectAtIndex:indexPath.row];
}

@end

