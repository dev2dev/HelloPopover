//
//  MyTableViewController.m
//

#import "MyTableViewController.h"

enum {
    InstructorsGroup = 0,
    TeachingAssistantsGroup,
    GuestLecturersGroup
};

@implementation MyTableViewController

@synthesize instructors = _instructors;
@synthesize teachingAssistants = _teachingAssistants;
@synthesize guestLecturers = _guestLecturers;
@synthesize popoverController = _poController;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;

#pragma mark -
#pragma mark My TableView Controller - Lifecycle Methods

- (void)dealloc {
	
    [_instructors			release], _instructors = nil;
    [_teachingAssistants	release], _teachingAssistants = nil;
    [_guestLecturers		release], _guestLecturers = nil;
    [_poController			release], _poController = nil;
    [_detailDescriptionLabel release], _detailDescriptionLabel = nil;
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style {
	
    self = [super initWithStyle:style];
	
    if (self) {
		
        self.instructors = 
		[[[NSMutableArray alloc] 
		  initWithObjects:@"Alan", @"Evan", @"Paul M.", @"Alan", @"Evan", @"Paul M.", nil] autorelease];
		
        self.teachingAssistants = 
		[[[NSMutableArray alloc] 
		  initWithObjects:@"Troy", @"Paul S.", @"Troy", @"Paul S.", nil] autorelease];
		
        self.guestLecturers = 
		[[[NSMutableArray alloc] 
		  initWithObjects:@"Jason", @"Josh", @"Alex", @"Justin", @"Eric", @"Dan", @"Jason", @"Josh", @"Alex", @"Justin", @"Eric", @"Dan", nil] autorelease];
		
		
		
    } // if (self)
	
    return self;
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

#pragma mark -
#pragma mark UITableView DataSource Protocol Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self namesForSection:section] count];
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
	
//    NSString *title = [NSString stringWithFormat:@"You selected %@.", [self nameForIndexPath:indexPath]];
//    UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle:title message:@"Now what?" 
//														delegate:nil 
//											   cancelButtonTitle:@"Dismiss" 
//											   otherButtonTitles:nil] autorelease];
//    [alertView show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

	self.detailDescriptionLabel.text = 
	[NSString stringWithFormat:@"You Selected %@", [self nameForIndexPath:indexPath]];

	[self.popoverController dismissPopoverAnimated:YES];
}

@end
