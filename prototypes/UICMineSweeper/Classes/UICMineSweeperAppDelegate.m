//
//  UICMineSweeperAppDelegate.m
//  UICMineSweeper
//
//  Created by takiuchi on 08/11/14.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "UICMineSweeperAppDelegate.h"

@implementation UICMineSweeperAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
