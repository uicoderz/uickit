#import "UICPrototypeTableCell.h"
#import "UICPrototypeTableCellSwitch.h"
#import "UICPrototypeTableCellTextInput.h"
#import "UICPrototypeTableCellSelect.h"
#import "UICTableViewCell.h"

@interface UICPrototypeTableCell(Private)
- (id)initWithTitle:(NSString*)aText;

@end


@implementation UICPrototypeTableCell

@synthesize title;

- (id)initWithTitle:(NSString*)aText {
	if (self = [super init]) {
		title = [aText retain];
	}
	return self;
}

+ (id)cellForTitle:(NSString*)aText {
	return [[[UICPrototypeTableCell alloc] initWithTitle:aText] autorelease];
}

+ (id)cellForSwitch:(NSString*)aText withSwitch:(BOOL)val {
	UICPrototypeTableCellSwitch *p = [[[UICPrototypeTableCellSwitch alloc] initWithTitle:aText] 
										autorelease];
	p.value = val;
	return p;
}

+ (id)cellForTextInput:(NSString*)aText withPlaceholder:(NSString*)placeholder {
	UICPrototypeTableCellTextInput *p = [[[UICPrototypeTableCellTextInput alloc] initWithTitle:aText] 
											autorelease];
	p.placeholder = placeholder;
	return p;
}

+ (id)cellForSelect:(NSString*)title withSelectTitles:(NSArray*)titles {
	UICPrototypeTableCellSelect *p = [[[UICPrototypeTableCellSelect alloc] initWithTitle:title]
									   autorelease];
	p.titles = titles;
	return p;
}

+ (id)cellsForTitles:(NSArray*)titles {
	NSMutableArray *a = [[NSMutableArray alloc] init];
	for (NSString *title in titles) {
		[a addObject:[UICPrototypeTableCell cellForTitle:title]];
	}
	return a;
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
