#import "UICPrototypeTableCell.h"

@interface UICPrototypeTableCell(Private)
- (id)initWithText:(NSString*)aText;
- (id)initWithText:(NSString*)aText withSwitch:(BOOL)val;
- (id)initWithText:(NSString*)aText withTextInput:(NSString*)prompt;

@end


@implementation UICPrototypeTableCell

@synthesize text, textInputPrompt, switchVal, celltype;

- (id)initWithText:(NSString*)aText {
	if (self = [super init]) {
		text = [aText retain];
		celltype = UICPrototypeTableCellType_Text;
	}
	return self;
}

- (id)initWithText:(NSString*)aText withSwitch:(BOOL)val {
	if (self = [self initWithText:aText]) {
		switchVal = val;
		celltype = UICPrototypeTableCellType_TextWithSwitch;
	}
	return self;
}

- (id)initWithText:(NSString*)aText withTextInput:(NSString*)prompt {
	if (self = [self initWithText:aText]) {
		textInputPrompt = [prompt retain];
		celltype = UICPrototypeTableCellType_TextWithTextInput;
	}
	return self;
}

+ (id)cellForText:(NSString*)aText {
	return [[[UICPrototypeTableCell alloc] initWithText:aText] autorelease];
}

+ (id)cellForSwitch:(NSString*)aText withSwitch:(BOOL)val {
	return [[[UICPrototypeTableCell alloc] initWithText:aText withSwitch:val] autorelease];
}

+ (id)cellForTextInput:(NSString*)aText withPrompt:(NSString*)prompt {
	return [[[UICPrototypeTableCell alloc] initWithText:aText withTextInput:prompt] autorelease];
}

- (void)dealloc {
	[text release];
	[textInputPrompt release];
	[super dealloc];
}

@end
