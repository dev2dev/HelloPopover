//
//  PanoramaTableViewController.h
//  HelloPopover
//
//  Created by turner on 4/17/10.
//  Copyright 2010 Douglass Turner Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PanoramaTableViewController : UITableViewController {
	
	UIPopoverController	*m_popoverController;
	UILabel				*m_detailDescriptionLabel;
	
}

@property(nonatomic,retain)UIPopoverController *popoverController;
@property(nonatomic,retain)UILabel *detailDescriptionLabel;

@end
