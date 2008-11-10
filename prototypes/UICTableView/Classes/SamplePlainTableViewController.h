#import <UIKit/UIKit.h>

@interface SamplePlainTableViewController : UITableViewController {
	NSMutableArray *lines;
	BOOL use_uiccell;
}

- (id)initWithStyle:(UITableViewStyle)style useUICCell:(BOOL)use;

@end
