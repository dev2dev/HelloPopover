//
//  MyTableViewController.h
//  MyTableView
//

#import <UIKit/UIKit.h>


@interface MyTableViewController : UITableViewController {
    NSMutableArray *instructors;
    NSMutableArray *teachingAssistants;
    NSMutableArray *guestLecturers;
}

- (NSMutableArray *)namesForSection:(NSInteger)section;
- (NSString *)nameForIndexPath:(NSIndexPath *)indexPath;

@end
