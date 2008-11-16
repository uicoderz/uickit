#import <UIKit/UIKit.h>
#import "UICPrototypeTableCell.h"

@interface UICPrototypeTableCellSelect : UICPrototypeTableCell {
	NSArray *titles;
	int selectedIndex;
}

- (id)tableCellViewWithReuseId:(NSString*)reuseId;
- (NSString*)cellIdentifier;

@property (readwrite, retain) NSArray *titles;
@property (readwrite) int selectedIndex;

@end
