//
//  HelloPopoverAppDelegate.m
//  HelloPopover
//
//  Created by turner on 4/15/10.
//  Copyright Douglass Turner Consulting 2010. All rights reserved.
//

#import "HelloPopoverAppDelegate.h"
#import "HelloPopoverViewController.h"

@implementation HelloPopoverAppDelegate

@synthesize window = m_window;
@synthesize viewController = m_viewController;

- (void)dealloc {

	[m_window			release], m_window = nil;
    [m_viewController	release], m_viewController = nil;
	
    self.window			= nil;
	self.viewController	= nil;
	
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    [self.window addSubview:self.viewController.view];
    [self.window makeKeyAndVisible];

	return YES;
}

@end
