//
//  UICClockTimePickerAppDelegate.m
//  UICClockTimePicker
//
//  Created by mootoh on 12/17/08.
//  Copyright deadbeaf.org 2008. All rights reserved.
//

#import "UICClockTimePickerAppDelegate.h"
#import "UICClockTimePickerViewController.h"

@implementation UICClockTimePickerAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
