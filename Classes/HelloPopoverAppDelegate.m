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

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc {
	
    [_window			release], _window = nil;
    self.window = nil;
	
    [_viewController	release], _viewController = nil;
	self.viewController = nil;
	
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    [self.window addSubview:self.viewController.view];
    [self.window makeKeyAndVisible];

	return YES;
}


@end
