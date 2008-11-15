#import <UIKit/UIKit.h>
#import "UICPrototypeTableCell.h"

@interface UICPrototypeTableCellTextInput : UICPrototypeTableCell {
	NSString *value;
	NSString *placeholder;
	BOOL secure;
}

- (id)tableCellViewWithReuseId:(NSString*)reuseId;
- (NSString*)cellIdentifier;

@property (readwrite, retain) NSString *value;	
@property (readwrite, retain) NSString *placeholder;	
@property (readwrite) BOOL secure;

@end
