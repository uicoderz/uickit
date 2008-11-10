#import "UICPrototypeTableCell.h"

@interface UICPrototypeTableCell(Private)
- (id)initWithText:(NSString*)aText;
- (id)initWithText:(NSString*)aText withButton:(BOOL)val;
- (id)initWithText:(NSString*)aText withTextInput:(NSString*)prompt;

@end


@implementation UICPrototypeTableCell

@synthesize text, textInputPrompt, buttonVal, celltype;

- (id)initWithText:(NSString*)aText {
	if (self = [super init]) {
		text = [aText retain];
		celltype = UICPrototypeTableCellType_Text;
	}
	return self;
}

- (id)initWithText:(NSString*)aText withButton:(BOOL)val {
	if (self = [self initWithText:aText]) {
		buttonVal = val;
		celltype = UICPrototypeTableCellType_TextWithButton;
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

+ (id)textCell:(NSString*)aText {
	return [[[UICPrototypeTableCell alloc] initWithText:aText] autorelease];
}

+ (id)buttonCell:(NSString*)aText withButton:(BOOL)val {
	return [[[UICPrototypeTableCell alloc] initWithText:aText withButton:val] autorelease];
}

+ (id)textInputCell:(NSString*)aText withTextInput:(NSString*)prompt {
	return [[[UICPrototypeTableCell alloc] initWithText:aText withTextInput:prompt] autorelease];
}

- (void)dealloc {
	[text release];
	[textInputPrompt release];
	[super dealloc];
}

@end
