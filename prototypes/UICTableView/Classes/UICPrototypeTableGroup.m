#import "UICPrototypeTableGroup.h"

@implementation UICPrototypeTableGroup

@synthesize cells, title;

- (id)initWithCells:(NSArray*)Cells withTitle:(NSString*)aTitle {
	if (self = [super init]) {
		cells = [Cells retain];
		title = [aTitle retain];
		NSLog(@"UICPrototypeTableGroup initWithTitle");
	}
	return self;
}

+ (id)groupWithCells:(NSArray*)Cells withTitle:(NSString*)aTitle {
	return [[[UICPrototypeTableGroup alloc] initWithCells:Cells withTitle:aTitle] autorelease];
}

- (void)dealloc {
	NSLog(@"UICPrototypeTableGroup dealloc");
	[cells release];
	[title release];
	[super dealloc];
}

@end
