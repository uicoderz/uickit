#import "UICPrototypeTableCellSelect.h"
#import "UICTableViewCellSelect.h"

@implementation UICPrototypeTableCellSelect

@synthesize titles, selectedIndex;

- (id)tableCellViewWithReuseId:(NSString*)reuseId {
	return [[[UICTableViewCellSelect alloc] initWithFrame:CGRectZero reuseIdentifier:reuseId] autorelease];
}

- (NSString*)cellIdentifier {
	static NSString *s = @"TBCSL";
	return s;
}

- (void)dealloc {
	[titles release];
	[super dealloc];
}

@end
