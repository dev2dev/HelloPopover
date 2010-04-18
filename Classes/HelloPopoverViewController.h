//
//  HelloPopoverViewController.h
//  HelloPopover
//
//  Created by turner on 4/15/10.
//  Copyright Douglass Turner Consulting 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DuglaTableViewController;
@interface HelloPopoverViewController : UIViewController <UIPopoverControllerDelegate> {

	UIPopoverController			*m_popoverController;
    id							m_detailItem;
	
    UIToolbar					*m_toolbar;
	UIBarButtonItem				*m_toolbarButton;
    UILabel						*m_detailDescriptionLabel;
	DuglaTableViewController	*m_tableViewController;
	
}

@property(nonatomic,retain)UIPopoverController					*popoverController;
@property(nonatomic,retain)id									detailItem;

@property(nonatomic,retain)IBOutlet UIToolbar					*toolbar;
@property(nonatomic,retain)IBOutlet UIBarButtonItem				*toolbarButton;
@property(nonatomic,retain)IBOutlet UILabel						*detailDescriptionLabel;
@property(nonatomic,retain)IBOutlet DuglaTableViewController	*tableViewController;


- (IBAction)deployPopover:(id)sender;

@end

