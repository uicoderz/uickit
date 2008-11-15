#import "UICPrototypeTableCellSwitch.h"
#import "UICTableViewCellSwitch.h"

@implementation UICPrototypeTableCellSwitch

@synthesize value;

- (id)tableCellViewWithReuseId:(NSString*)reuseId {
	return [[[UICTableViewCellSwitch alloc] initWithFrame:CGRectZero reuseIdentifier:reuseId] autorelease];
}

- (NSString*)cellIdentifier {
	static NSString *s = @"TBCSW";
	return s;
}

@end
