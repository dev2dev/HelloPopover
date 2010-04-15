//
//  HelloPopoverViewController.m
//  HelloPopover
//
//  Created by turner on 4/15/10.
//  Copyright Douglass Turner Consulting 2010. All rights reserved.
//

#import "HelloPopoverViewController.h"

@implementation HelloPopoverViewController

@synthesize poController = _poController;
@synthesize toolbar = _toolbar;
@synthesize toolbarButton = _toolbarButton;
@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;

- (void)dealloc {
	
    [_poController				release], _poController = nil;
	
    [_toolbar					release], _toolbar = nil;
    self.toolbar				= nil;
	
    [_toolbarButton release], _toolbarButton = nil;
    self.toolbarButton = nil;
	
    [_detailItem				release], _detailItem = nil;
	
    [_detailDescriptionLabel	release], _detailDescriptionLabel = nil;	
    self.detailDescriptionLabel	= nil;
	
    [super dealloc];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
    [super viewDidLoad];
	
}

- (void)viewDidUnload {
	
	NSLog(@"Hello Popover VC - view Did Unload");
	self.poController = nil;
	
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

- (IBAction)push:(id)sender {

	if (nil != _poController) {
		
		if (self.poController.isPopoverVisible) {
			
			NSLog(@"Hello Popover VC - push - Popover Is Visible. Returning ...");
			return;
			
		} // if (self.poController.isPopoverVisible)
		
	} else {

		NSLog(@"Hello Popover VC - push - Popover is nil.");

		UIView* popoverContentView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 128, 128)] autorelease];
		//	popoverContentView.backgroundColor = [UIColor blueColor];
		
		UIViewController* popoverContentVC = [[[UIViewController alloc] init] autorelease];
		popoverContentVC.view = popoverContentView;
		popoverContentVC.contentSizeForViewInPopover = CGSizeMake(128, 128);
		
		self.poController = [[[UIPopoverController alloc] initWithContentViewController:popoverContentVC] autorelease];
	}
	

	[self.poController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	
}

@end
