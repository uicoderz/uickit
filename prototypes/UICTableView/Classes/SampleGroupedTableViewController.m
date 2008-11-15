#import "SampleGroupedTableViewController.h"
#import "UICPrototypeTableCellTextInput.h"

@implementation SampleGroupedTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		UICPrototypeTableCellTextInput *c = [UICPrototypeTableCell cellForTextInput:@"Passowrd" withPlaceholder:@"password"];
		c.secure = YES;
		NSArray *g1 = [NSArray arrayWithObjects:
							[UICPrototypeTableCell cellForTextInput:@"Username" withPlaceholder:@"username"],
							c,
							[UICPrototypeTableCell cellForSwitch:@"text2" withSwitch:NO],
							[UICPrototypeTableCell cellForSwitch:@"text3" withSwitch:YES],
							[UICPrototypeTableCell cellForText:@"text4"],
							[UICPrototypeTableCell cellForText:@"text5"],
							[UICPrototypeTableCell cellForText:@"text6"],
							nil];
		NSArray *g2 = [NSArray arrayWithObjects:
					   [UICPrototypeTableCell cellForText:@"text1"],
					   [UICPrototypeTableCell cellForSwitch:@"text2" withSwitch:YES],
					   [UICPrototypeTableCell cellForText:@"text3"],
					   [UICPrototypeTableCell cellForSwitch:@"text4" withSwitch:YES],
					   [UICPrototypeTableCell cellForText:@"text5"],
					   [UICPrototypeTableCell cellForText:@"text6"],
					   nil];
		
		NSArray *g3 = [NSArray arrayWithObjects:
					   [UICPrototypeTableCell cellForText:@"text1"],
					   [UICPrototypeTableCell cellForSwitch:@"text2" withSwitch:YES],
					   [UICPrototypeTableCell cellForSwitch:@"text3" withSwitch:YES],
					   [UICPrototypeTableCell cellForText:@"text4"],
					   [UICPrototypeTableCell cellForText:@"text5"],
					   [UICPrototypeTableCell cellForText:@"text6"],
					   nil];

		NSArray *g4 = [NSArray arrayWithObjects:
					   [UICPrototypeTableCell cellForText:@"text1"],
					   [UICPrototypeTableCell cellForSwitch:@"text2" withSwitch:YES],
					   [UICPrototypeTableCell cellForSwitch:@"text3" withSwitch:YES],
					   [UICPrototypeTableCell cellForText:@"text4"],
					   [UICPrototypeTableCell cellForText:@"text5"],
					   [UICPrototypeTableCell cellForText:@"text6"],
					   nil];

		groups = [[NSArray arrayWithObjects:
				   [UICPrototypeTableGroup groupWithCells:g1 withTitle:@"group1"], 
				   [UICPrototypeTableGroup groupWithCells:g2 withTitle:@"group2"], 
				   [UICPrototypeTableGroup groupWithCells:g3 withTitle:@"group3"], 
				   [UICPrototypeTableGroup groupWithCells:g4 withTitle:@"group4"], 
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

