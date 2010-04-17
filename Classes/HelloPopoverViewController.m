//
//  HelloPopoverViewController.m
//  HelloPopover
//
//  Created by turner on 4/15/10.
//  Copyright Douglass Turner Consulting 2010. All rights reserved.
//

#import "HelloPopoverViewController.h"
#import "MyTableViewController.h"

@implementation HelloPopoverViewController

@synthesize popoverController = m_popoverController;
@synthesize toolbar = m_toolbar;
@synthesize toolbarButton = m_toolbarButton;
@synthesize detailItem = m_detailItem;
@synthesize detailDescriptionLabel = m_detailDescriptionLabel;

- (void)dealloc {
	
    [m_popoverController release], m_popoverController = nil;
    [m_toolbar release], m_toolbar = nil;
    [m_toolbarButton release], m_toolbarButton = nil;
    [m_detailItem release], m_detailItem = nil;
    [m_detailDescriptionLabel release], m_detailDescriptionLabel = nil;
	
    self.toolbar = nil;
    self.toolbarButton = nil;
    self.detailDescriptionLabel = nil;
	
    [super dealloc];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
    [super viewDidLoad];
	
    MyTableViewController * myTableViewController = [[[MyTableViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
	myTableViewController.contentSizeForViewInPopover = CGSizeMake(256, 512);

	self.popoverController = [[[UIPopoverController alloc] initWithContentViewController:myTableViewController] autorelease];
	myTableViewController.popoverController = self.popoverController;
	myTableViewController.detailDescriptionLabel = self.detailDescriptionLabel;
	self.popoverController.delegate = self;
	
//	self.wantsFullScreenLayout = YES;
	
}

- (void)viewDidUnload {
	
	NSLog(@"Hello Popover VC - view Did Unload");
	self.popoverController = nil;
	
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController {

	NSLog(@"Hello Popover VC - popover Controller Should Dismiss Popover");
	return YES;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
	
	NSLog(@"Hello Popover VC - popover Controller Did Dismiss Popover");
}

- (void)didReceiveMemoryWarning {
	
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (IBAction)deployPopover:(id)sender {

	if (self.popoverController.isPopoverVisible) {
		
		return;
		
	} // if (self.poController.isPopoverVisible)
	
	[self.popoverController presentPopoverFromBarButtonItem:sender 
								   permittedArrowDirections:UIPopoverArrowDirectionAny 
												   animated:YES];
	
}

@end
