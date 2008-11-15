#import <UIKit/UIKit.h>

@interface UICPrototypeTableCell : NSObject {
	NSString *title;
}

+ (id)cellForText:(NSString*)title;
+ (id)cellForSwitch:(NSString*)title withSwitch:(BOOL)val;
+ (id)cellForTextInput:(NSString*)title withPlaceholder:(NSString*)placeholder;

- (id)tableCellViewWithReuseId:(NSString*)reuseId;
- (NSString*)cellIdentifier;

@property (readonly) NSString *title;

@end
