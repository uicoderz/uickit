#import <UIKit/UIKit.h>
#import "UICPrototypeTableCell.h"

@interface UICPrototypeTableCellSelect : UICPrototypeTableCell {
	NSArray *titles;
	int selectedIndex;
}

- (id)initWithTitle:(NSString*)title withUserDefaultsKey:(NSString*)key;

- (id)tableCellViewWithReuseId:(NSString*)reuseId;
- (NSString*)cellIdentifier;

- (void)setSelectedIndex:(int)index;
- (int)selectedIndex;

@property (readwrite, retain) NSArray *titles;
//@property (readwrite) int selectedIndex;

@end
