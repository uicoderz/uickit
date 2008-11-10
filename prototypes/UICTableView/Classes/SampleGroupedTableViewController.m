#import "SampleGroupedTableViewController.h"

@implementation SampleGroupedTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		NSArray *g1 = [NSArray arrayWithObjects:
							[UICPrototypeTableCell textCell:@"text1"],
							[UICPrototypeTableCell textCell:@"text2"],
							[UICPrototypeTableCell textCell:@"text3"],
							[UICPrototypeTableCell textCell:@"text4"],
							[UICPrototypeTableCell textCell:@"text5"],
							[UICPrototypeTableCell textCell:@"text6"],
							nil];
		
		groups = [[NSArray arrayWithObjects:
				   [UICPrototypeTableGroup groupWithCells:g1 withTitle:@"group1"], 
				   [UICPrototypeTableGroup groupWithCells:g1 withTitle:@"group2"], 
				   [UICPrototypeTableGroup groupWithCells:g1 withTitle:@"group3"], 
				   [UICPrototypeTableGroup groupWithCells:g1 withTitle:@"group4"], 
				   nil] retain];
	}
	
	return self;
}
	
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [NSString stringWithFormat:@"セクション %d", section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
	
	cell.text = [NSString stringWithFormat:@"にほんご あいうえお %d %d", [indexPath section], [indexPath row]];
//	cell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
//	cell.backgroundView.backgroundColor = [UIColor grayColor];
    return cell;
}
*/

- (void)dealloc {
    [super dealloc];
}

@end

