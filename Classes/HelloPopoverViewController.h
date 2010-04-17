//
//  HelloPopoverViewController.h
//  HelloPopover
//
//  Created by turner on 4/15/10.
//  Copyright Douglass Turner Consulting 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloPopoverViewController : UIViewController <UIPopoverControllerDelegate> {

	UIPopoverController	*m_popoverController;
    UIToolbar			*m_toolbar;
	UIBarButtonItem		*m_toolbarButton;
	
    id					m_detailItem;
    UILabel				*m_detailDescriptionLabel;
	
}

@property(nonatomic,retain)UIPopoverController *popoverController;
@property(nonatomic,retain)IBOutlet UIToolbar *toolbar;
@property(nonatomic,retain)IBOutlet UIBarButtonItem *toolbarButton;
@property(nonatomic,retain)id detailItem;
@property(nonatomic,retain)IBOutlet UILabel *detailDescriptionLabel;


- (IBAction)deployPopover:(id)sender;

@end

