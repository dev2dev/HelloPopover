//
//  MyTableViewController.h
//

#import <UIKit/UIKit.h>

@interface MyTableViewController : UITableViewController {
	
    NSMutableArray *m_instructors;
    NSMutableArray *m_teachingAssistants;
    NSMutableArray *m_guestLecturers;
	
	UIPopoverController	*m_popoverController;
	UILabel				*m_detailDescriptionLabel;
}

@property(nonatomic,retain)NSMutableArray *instructors;
@property(nonatomic,retain)NSMutableArray *teachingAssistants;
@property(nonatomic,retain)NSMutableArray *guestLecturers;
@property(nonatomic,retain)UIPopoverController *popoverController;
@property(nonatomic,retain)UILabel *detailDescriptionLabel;

- (NSMutableArray *)namesForSection:(NSInteger)section;
- (NSString *)nameForIndexPath:(NSIndexPath *)indexPath;

@end
