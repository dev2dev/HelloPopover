//
//  MyTableViewController.h
//

#import <UIKit/UIKit.h>

@interface MyTableViewController : UITableViewController {
	
    NSMutableArray *_instructors;
    NSMutableArray *_teachingAssistants;
    NSMutableArray *_guestLecturers;
	
	UIPopoverController	*_poController;
	UILabel				*_detailDescriptionLabel;
}

@property(nonatomic,retain)NSMutableArray *instructors;
@property(nonatomic,retain)NSMutableArray *teachingAssistants;
@property(nonatomic,retain)NSMutableArray *guestLecturers;
@property(nonatomic,retain)UIPopoverController *popoverController;
@property(nonatomic,retain)UILabel *detailDescriptionLabel;

- (NSMutableArray *)namesForSection:(NSInteger)section;
- (NSString *)nameForIndexPath:(NSIndexPath *)indexPath;

@end
