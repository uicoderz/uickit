#import "UICTableViewController.h"
#import "UICTableViewCellSwitch.h"
#import "UICTableViewCellTextInput.h"

@implementation UICTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    if (self = [super initWithStyle:style]) {
	}
    return self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [groups count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	UICPrototypeTableGroup *g = (UICPrototypeTableGroup *)[groups objectAtIndex:section];
	return g.title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {	
	UICPrototypeTableGroup *g = (UICPrototypeTableGroup *)[groups objectAtIndex:section];
	return [g.cells count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UICPrototypeTableGroup *g = (UICPrototypeTableGroup *)[groups objectAtIndex:[indexPath section]];
	id prototype = (UICPrototypeTableCell*)[g.cells objectAtIndex:[indexPath row]];

	NSString *cellId = [prototype cellIdentifier];
    id cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
		cell = [prototype tableCellViewWithReuseId:cellId];
	}

	if (! [[cell class] isEqual:[UITableViewCell class]]) {
		[cell updateWithPrototype:prototype];
	}
	
	[cell setText:[prototype title]];
    return cell;
}

- (void)dealloc {
	[groups dealloc];
    [super dealloc];
}

@end

