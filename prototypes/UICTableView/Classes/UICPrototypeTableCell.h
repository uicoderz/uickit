#import <UIKit/UIKit.h>

typedef enum UICPrototypeTableCellType {
	UICPrototypeTableCellType_Text,
	UICPrototypeTableCellType_TextWithButton,
	UICPrototypeTableCellType_TextWithTextInput,
	
} UICPrototypeTableCellType;

@interface UICPrototypeTableCell : NSObject {
	NSString *text;
	BOOL buttonVal;
	NSString *textInputPrompt;	
	UICPrototypeTableCellType celltype;
}

+ (id)textCell:(NSString*)text;
+ (id)buttonCell:(NSString*)text withButton:(BOOL)val;
+ (id)textInputCell:(NSString*)text withTextInput:(NSString*)prompt;

@property (readonly) NSString *text;
@property (readonly) BOOL buttonVal;
@property (readonly) NSString *textInputPrompt;	
@property (readonly) UICPrototypeTableCellType celltype;

@end
