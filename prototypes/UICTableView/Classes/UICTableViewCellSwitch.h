#import <UIKit/UIKit.h>
#import "UICPrototypeTableCell.h"

@interface UICTableViewCellSwitch : UITableViewCell {
	UICPrototypeTableCell *prototype;
	UISwitch *sw;
}

- (void)updateWithPrototype:(UICPrototypeTableCell*)prototype;

@end
