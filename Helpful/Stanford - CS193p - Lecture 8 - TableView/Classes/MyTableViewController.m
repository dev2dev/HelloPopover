//
//  MyTableViewController.m
//  MyTableView
//

#import "MyTableViewController.h"

enum {
    InstructorsGroup = 0,
    TeachingAssistantsGroup,
    GuestLecturersGroup
};

@implementation MyTableViewController

#pragma mark -
#pragma mark My TableView Controller - Lifecycle Methods

- (void)dealloc {
    [instructors release];
    [teachingAssistants release];
    [guestLecturers release];
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style {
	
    self = [super initWithStyle:style];
	
    if (self) {        
        instructors = [[NSMutableArray alloc] initWithObjects:@"Alan", @"Evan", @"Paul M.", @"Alan", @"Evan", @"Paul M.", nil];
        teachingAssistants = [[NSMutableArray alloc] initWithObjects:@"Troy", @"Paul S.", @"Troy", @"Paul S.", nil];
        guestLecturers = [[NSMutableArray alloc] initWithObjects:@"Jason", @"Josh", @"Alex", @"Justin", @"Eric", @"Dan", @"Jason", @"Josh", @"Alex", @"Justin", @"Eric", @"Dan", nil];
    }
	
    return self;
}

#pragma mark -
#pragma mark My TableView Controller - Helper Methods

- (NSMutableArray *)namesForSection:(NSInteger)section {
	
    switch (section) {
        case InstructorsGroup:
            return instructors;
        case TeachingAssistantsGroup:
            return teachingAssistants;
        case GuestLecturersGroup:
            return guestLecturers;
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
	
//	return 1;
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
    NSString *name = [self nameForIndexPath:indexPath];
    NSString *title = [NSString stringWithFormat:@"You selected %@.", name];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:@"Now what?" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
