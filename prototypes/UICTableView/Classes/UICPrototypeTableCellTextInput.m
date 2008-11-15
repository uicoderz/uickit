#import "UICPrototypeTableCellTextInput.h"
#import "UICTableViewCellTextInput.h"

@implementation UICPrototypeTableCellTextInput

@synthesize value, placeholder, secure;

- (id)tableCellViewWithReuseId:(NSString*)reuseId {
	return [[[UICTableViewCellTextInput alloc] initWithFrame:CGRectZero reuseIdentifier:reuseId] autorelease];
}

- (NSString*)cellIdentifier {
	static NSString *s = @"TBCTI";
	return s;
}

@end
