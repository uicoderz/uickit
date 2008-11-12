#import <UIKit/UIKit.h>

typedef enum UICPrototypeTableCellType {
	UICPrototypeTableCellType_Text,
	UICPrototypeTableCellType_TextWithSwitch,
	UICPrototypeTableCellType_TextWithTextInput,
	
} UICPrototypeTableCellType;

@interface UICPrototypeTableCell : NSObject {
	NSString *text;
	BOOL switchVal;
	NSString *textInputPrompt;	
	UICPrototypeTableCellType celltype;
}

+ (id)cellForText:(NSString*)text;
+ (id)cellForSwitch:(NSString*)text withSwitch:(BOOL)val;
+ (id)cellForTextInput:(NSString*)text withPrompt:(NSString*)prompt;

@property (readonly) NSString *text;
@property (readwrite) BOOL switchVal;
@property (readonly) NSString *textInputPrompt;	
@property (readonly) UICPrototypeTableCellType celltype;

@end
