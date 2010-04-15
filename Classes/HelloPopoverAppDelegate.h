//
//  HelloPopoverAppDelegate.h
//  HelloPopover
//
//  Created by turner on 4/15/10.
//  Copyright Douglass Turner Consulting 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloPopoverViewController;

@interface HelloPopoverAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HelloPopoverViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HelloPopoverViewController *viewController;

@end

