#import "RootViewController.h"
#import "UICTableAppDelegate.h"

#import "SamplePlainTableViewController.h"
#import "SampleGroupedTableViewController.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	[self.navigationItem setTitle:@"UICTable Sample"];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
	
	switch ([indexPath row]) {
		case 0:
			cell.text = @"UITableViewCell (Plain)";
			break;
		case 1:
			cell.text = @"UICTableViewCell (Plain)";
			break;
		case 2:
			cell.text = @"UITableViewCell (Grouped)";
			break;
		case 3:
			cell.text = @"UICTableViewCell (Grouped)";
			break;
	}
	
	//cell.selectionStyle = UITableViewCellSelectionStyleGray;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	UIViewController *vc = nil;
	switch ([indexPath row]) {
		case 0:
			vc = [[[SamplePlainTableViewController alloc] initWithStyle:UITableViewStylePlain useUICCell:NO] autorelease];
			break;
		case 1:
			vc = [[[SamplePlainTableViewController alloc] initWithStyle:UITableViewStylePlain useUICCell:YES] autorelease];
			break;
		case 2:
			vc = [[[SampleGroupedTableViewController alloc] initWithStyle:UITableViewStyleGrouped] autorelease];
			break;
		case 3:
			vc = [[[SampleGroupedTableViewController alloc] initWithStyle:UITableViewStyleGrouped] autorelease];
			break;
	}
		
	if (vc) {
		[self.navigationController pushViewController:vc animated:YES];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end

