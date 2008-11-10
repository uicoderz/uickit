#import "SamplePlainTableViewController.h"

#import "UICTableAppDelegate.h"
#import "SampleLabeledTableCell.h"
#import "SampleUICTableCell.h"

@implementation SamplePlainTableViewController

- (id)initWithStyle:(UITableViewStyle)style useUICCell:(BOOL)use {
	if (self = [super initWithStyle:style]) {
		if (lines == nil) {
			lines = [((UICTableAppDelegate*)[UIApplication sharedApplication].delegate).testTexts retain];
		}
		use_uiccell = use;
		if (use_uiccell) {
			self.tableView.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.f];
			self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		}
	}
	return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [lines count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 70;// + rand() % 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		if (use_uiccell) {
			SampleUICTableCell* c = [[[SampleUICTableCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
			[c setText:[lines objectAtIndex:[indexPath row]]];
			cell = c;
		} else {
			SampleLabeledTableCell* c = [[[SampleLabeledTableCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
			[c setText:[lines objectAtIndex:[indexPath row]]];
			cell = c;
		}
    } else {
		if (use_uiccell) {
			[(SampleUICTableCell*)cell setText:[lines objectAtIndex:[indexPath row]]];
		} else {
			[(SampleLabeledTableCell*)cell setText:[lines objectAtIndex:[indexPath row]]];
		}	
	}
	cell.clearsContextBeforeDrawing = NO;
	
    return cell;
}

- (void)dealloc {
	[lines release];
    [super dealloc];
}

@end

