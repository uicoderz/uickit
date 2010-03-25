//
//  Created by Motohiro Takayama on 3/25/10.
//  Copyright deadbeaf.org 2010. All rights reserved.
//

#import "UICClockViewSampleViewController.h"
#import "UICClockView.h"

@implementation UICClockViewSampleViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   cv = [[UICClockView alloc] initWithFrame:CGRectMake(128, 64, 128, 128)];
   cv.center = self.view.center;
   NSDate *now = [NSDate date];
   NSCalendar *calendar = [NSCalendar currentCalendar];
   NSDateComponents *compo = [calendar components:NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:now];
   cv.hour = compo.hour;
   cv.minute = compo.minute;
   cv.frequency = 0.01f;
   [self.view addSubview:cv];
   [cv start];
}

- (void)dealloc
{
   [cv release];
   [super dealloc];
}

- (IBAction) toggle
{
   if (cv.working) {
      [toggleButton setTitle:@"start" forState:UIControlStateNormal];
      [cv stop];
   } else {
      [toggleButton setTitle:@"stop" forState:UIControlStateNormal];
      [cv start];
   }
}

@end