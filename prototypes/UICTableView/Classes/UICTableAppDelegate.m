#import "UICTableAppDelegate.h"
#import "RootViewController.h"

@implementation UICTableAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize testTexts;

- (NSArray*)loadTestTextLines {
	NSString *path = [[NSBundle mainBundle] pathForResource:@"testdata" ofType:@"txt" inDirectory:@""];
	NSString *alltxt = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	NSArray *a = [alltxt componentsSeparatedByString:@"。"];
	/*
	
	for (NSString *s in a) {
		NSLog(@"line: %@", s);
	}
	
	*/
	return a;
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	testTexts = [[self loadTestTextLines] retain];
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];	
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (void)dealloc {
	[testTexts release];
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
