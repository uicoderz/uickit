//
//  Created by Motohiro Takayama on 3/25/10.
//  Copyright deadbeaf.org 2010. All rights reserved.
//

#import "UICClockViewSampleAppDelegate.h"
#import "UICClockViewSampleViewController.h"

@implementation UICClockViewSampleAppDelegate

@synthesize window;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   [window addSubview:viewController.view];
   [window makeKeyAndVisible];
	
	return YES;
}

- (void)dealloc
{
   [viewController release];
   [window release];
   [super dealloc];
}

@end