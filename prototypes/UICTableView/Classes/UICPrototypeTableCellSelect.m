#import "UICPrototypeTableCellSelect.h"
#import "UICTableViewCellSelect.h"

@implementation UICPrototypeTableCellSelect

@synthesize titles;

- (id)initWithTitle:(NSString*)aTitle withUserDefaultsKey:(NSString*)key {
	if (self = [super initWithTitle:aTitle]) {
		userDefaultsKey = [key retain];
		selectedIndex = [[NSUserDefaults standardUserDefaults] integerForKey:userDefaultsKey];
	}
	return self;
}

- (id)tableCellViewWithReuseId:(NSString*)reuseId {
	return [[[UICTableViewCellSelect alloc] initWithFrame:CGRectZero reuseIdentifier:reuseId] autorelease];
}

- (NSString*)cellIdentifier {
	static NSString *s = @"TBCSL";
	return s;
}

- (void)setSelectedIndex:(int)index {
	selectedIndex = index;
	if (userDefaultsKey) {
		[[NSUserDefaults standardUserDefaults] setInteger:selectedIndex forKey:userDefaultsKey];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}
}

- (int)selectedIndex {
	return selectedIndex;
}

- (void)dealloc {
	[titles release];
	[super dealloc];
}

@end
