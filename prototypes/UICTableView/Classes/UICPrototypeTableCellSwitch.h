#import <UIKit/UIKit.h>
#import "UICPrototypeTableCell.h"

@interface UICPrototypeTableCellSwitch : UICPrototypeTableCell {
	BOOL value;
}

- (id)tableCellViewWithReuseId:(NSString*)reuseId;
- (NSString*)cellIdentifier;

@property (readwrite) BOOL value;

@end
