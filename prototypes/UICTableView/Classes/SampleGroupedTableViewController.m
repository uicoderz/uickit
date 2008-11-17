#import "SampleGroupedTableViewController.h"
#import "UICPrototypeTableCellTextInput.h"
#import "UICPrototypeTableCellSelect.h"

@implementation SampleGroupedTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {

		UICPrototypeTableCellTextInput *c = [UICPrototypeTableCell cellForTextInput:@"Passowrd" withPlaceholder:@"password"];
		c.secure = YES;
		NSArray *g1 = [NSArray arrayWithObjects:
							[UICPrototypeTableCell cellForTextInput:@"Username" withPlaceholder:@"username"],
							c,
							nil];
		NSArray *g2 = [NSArray arrayWithObjects:
					   [UICPrototypeTableCell cellForSwitch:@"text1" withSwitch:YES],
					   [UICPrototypeTableCell cellForSwitch:@"text2" withSwitch:NO],
					   [UICPrototypeTableCell cellForSwitch:@"text3" withSwitch:YES],
					   [UICPrototypeTableCell cellForSwitch:@"text4" withSwitch:NO],
					   [UICPrototypeTableCell cellForSwitch:@"text5" withSwitch:YES],
					   nil];
		
		NSArray *g3 = [NSArray arrayWithObjects:
					   [UICPrototypeTableCell cellForSelect:@"testsel1" withSelectTitles:[NSArray arrayWithObjects:@"aaa", @"bbb", @"ccc", nil]],
					   [UICPrototypeTableCell cellForSelect:@"testsel2" withSelectTitles:[NSArray arrayWithObjects:@"abc", @"123", @"456", @"789", nil]],
					   [UICPrototypeTableCell cellForSelect:@"testsel3" withSelectTitles:[NSArray arrayWithObjects:@"a", nil]],
					   [UICPrototypeTableCell cellForSelect:@"testsel4" withSelectTitles:[NSArray arrayWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", nil]],
					   nil];

		NSArray *g4 = [NSArray arrayWithObjects:
					   [UICPrototypeTableCell cellForTitle:@"text0"],
					   [UICPrototypeTableCell cellForTitle:@"text1"],
					   [UICPrototypeTableCell cellForTitle:@"text2"],
					   [UICPrototypeTableCell cellForTitle:@"text3"],
					   [UICPrototypeTableCell cellForTitle:@"text4"],
					   [UICPrototypeTableCell cellForTitle:@"text5"],
					   [UICPrototypeTableCell cellForTitle:@"text6"],
					   [UICPrototypeTableCell cellForTitle:@"text7"],
					   [UICPrototypeTableCell cellForTitle:@"text8"],
					   [UICPrototypeTableCell cellForTitle:@"text9"],
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

