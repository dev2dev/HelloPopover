//
//  HelloPopoverViewController.h
//  HelloPopover
//
//  Created by turner on 4/15/10.
//  Copyright Douglass Turner Consulting 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloPopoverViewController : UIViewController <UIPopoverControllerDelegate> {

	UIPopoverController	*_poController;
    UIToolbar			*_toolbar;
	UIBarButtonItem		*_toolbarButton;
	
    id					_detailItem;
    UILabel				*_detailDescriptionLabel;
	
}

@property(nonatomic,retain)UIPopoverController *poController;
@property(nonatomic,retain)IBOutlet UIToolbar *toolbar;
@property(nonatomic,retain)IBOutlet UIBarButtonItem *toolbarButton;
@property(nonatomic,retain)id detailItem;
@property(nonatomic,retain)IBOutlet UILabel *detailDescriptionLabel;

- (IBAction)push:(id)sender;

@end

