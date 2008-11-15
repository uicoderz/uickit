#import "UICPrototypeTableCell.h"
#import "UICPrototypeTableCellSwitch.h"
#import "UICPrototypeTableCellTextInput.h"
#import "UICTableViewCell.h"

@interface UICPrototypeTableCell(Private)
- (id)initWithText:(NSString*)aText;

@end


@implementation UICPrototypeTableCell

@synthesize title;

- (id)initWithText:(NSString*)aText {
	if (self = [super init]) {
		title = [aText retain];
	}
	return self;
}

+ (id)cellForText:(NSString*)aText {
	return [[[UICPrototypeTableCell alloc] initWithText:aText] autorelease];
}

+ (id)cellForSwitch:(NSString*)aText withSwitch:(BOOL)val {
	UICPrototypeTableCellSwitch *p = [[[UICPrototypeTableCellSwitch alloc] initWithText:aText] 
										autorelease];
	p.value = val;
	return p;
}

+ (id)cellForTextInput:(NSString*)aText withPlaceholder:(NSString*)placeholder {
	UICPrototypeTableCellTextInput *p = [[[UICPrototypeTableCellTextInput alloc] initWithText:aText] 
											autorelease];
	p.placeholder = placeholder;
	return p;
}

- (id)tableCellViewWithReuseId:(NSString*)reuseId {
	return [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:reuseId] autorelease];
}

- (NSString*)cellIdentifier {
	static NSString *s = @"TBC";
	return s;
}

- (void)dealloc {
	[title release];
	[super dealloc];
}

@end
