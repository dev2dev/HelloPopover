//
//  PanoramaTableViewController.m
//  HelloPopover
//
//  Created by turner on 4/17/10.
//  Copyright 2010 Douglass Turner Consulting. All rights reserved.
//

#import "PanoramaTableViewController.h"

@implementation PanoramaTableViewController

@synthesize popoverController = m_popoverController;
@synthesize detailDescriptionLabel = m_detailDescriptionLabel;

- (void)dealloc {
	
    [m_popoverController		release], m_popoverController = nil;
    [m_detailDescriptionLabel	release], m_detailDescriptionLabel = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Panorama TableView Controller - View Lifecycle Methods

- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	self.clearsSelectionOnViewWillAppear = NO;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	
}

static BOOL firstTime = YES;
static int visit = 1;
- (void)selectTheRowInTheTable {

	NSLog(@"Panorama TableView Controller - select The Row In The Table - visit %d", visit++);

	if (firstTime == YES) {
		
		[self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:8 inSection:0] 
									animated:NO 
							  scrollPosition:UITableViewScrollPositionTop];
		
		NSIndexPath *preselected = [self.tableView indexPathForSelectedRow];
		
		NSLog(@"Row %d has been pre-selected", preselected.row);
		
		firstTime = NO;
	}

}

- (void)viewDidAppear:(BOOL)animated {
	
	NSLog(@"Panorama TableView Controller - view Did Appear - visit %d", visit++);
	
    [super viewDidAppear:animated];
	
	[self performSelector:@selector(selectTheRowInTheTable) withObject:nil afterDelay:0.0];


}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {

    return YES;
}

#pragma mark -
#pragma mark UITableView DataSource Protocol Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	NSLog(@"Panorama TableView Controller - tableView:numberOfRowsInSection:");
	
	return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSLog(@"Panorama TableView Controller - tableView:cellForRowAtIndexPath: - row %d", indexPath.row);
		  		  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCell"];
	
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"DefaultCell"] autorelease];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	self.detailDescriptionLabel.text = [NSString stringWithFormat:@"You Selected Row %d", indexPath.row];
	
	[self.popoverController dismissPopoverAnimated:YES];
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
 
    [super didReceiveMemoryWarning];
    
}

@end

