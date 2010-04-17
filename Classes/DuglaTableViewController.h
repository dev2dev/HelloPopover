//
//  DuglaTableViewController.h
//  HelloPopover
//
//  Created by turner on 4/17/10.
//  Copyright 2010 Douglass Turner Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DuglaTableViewController : UITableViewController {
	
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
