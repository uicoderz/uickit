#import "UICTableViewController.h"
#import "UICTableViewCellSwitch.h"

@implementation UICTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    if (self = [super initWithStyle:style]) {
	}
    return self;
}

+ (NSString*)cellIdentifierForPrototype:(UICPrototypeTableCell*)prototype {
	static NSString *s[] = {@"Text", @"TextWithSwitch", @"TextWithTextInput"};
	switch (prototype.celltype) {
		case UICPrototypeTableCellType_Text: return s[0];
		case UICPrototypeTableCellType_TextWithSwitch: return s[1];
		case UICPrototypeTableCellType_TextWithTextInput: return s[2];
	}
	return nil;
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
	UICPrototypeTableCell *c = (UICPrototypeTableCell*)[g.cells objectAtIndex:[indexPath row]];

	NSString *cid = [UICTableViewController cellIdentifierForPrototype:c];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell == nil) {
			
		switch ([c celltype]) {
			case UICPrototypeTableCellType_TextWithSwitch:
				cell = [[[UICTableViewCellSwitch alloc] initWithFrame:CGRectZero reuseIdentifier:cid] autorelease];
				break;
//			case UICPrototypeTableCellType_TextWithTextInput:
//				break;
			default:
				cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:cid] autorelease];
				break;
		}
	}

	id ccc = cell;
	switch ([c celltype]) {
		case UICPrototypeTableCellType_TextWithSwitch:
			[ccc updateWithPrototype:c];
			break;
	}
	
	cell.text = c.text;
    return cell;
}

- (void)dealloc {
	[groups dealloc];
    [super dealloc];
}

@end

