//
//  UICClockTimePickerViewController.m
//  UICClockTimePicker
//
//  Created by mootoh on 12/17/08.
//  Copyright deadbeaf.org 2008. All rights reserved.
//

#import "UICClockTimePickerViewController.h"
#import "UICClockTimePicker.h"

#define TIME_LABEL_TAG 1

@implementation UICClockTimePickerViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
   [super loadView];
   UICClockTimePicker *ctp = [[UICClockTimePicker alloc] initWithFrame:CGRectMake(32, 81, 256, 256)];
   [self.view addSubview:ctp];
   ctp.delegate =self;
   [ctp release];

   UILabel *time_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 64, 32)];
   time_label.center = CGPointMake(self.view.center.x, 400);
   time_label.text = @"time";
   time_label.textColor = [UIColor blackColor];
   time_label.tag = TIME_LABEL_TAG;
   [self.view addSubview:time_label];
   [time_label release];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

// UICClockTimePickerDelegate
- (void) picked:(UICClockTimePicker *)picker
{
   UILabel *time_label = (UILabel *)[self.view viewWithTag:TIME_LABEL_TAG];
   time_label.text = [NSString stringWithFormat:@"%02d:%02d", picker.hour, picker.minute];
}

@end
