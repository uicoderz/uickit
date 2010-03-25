//
//  Created by Motohiro Takayama on 3/25/10.
//  Copyright deadbeaf.org 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UICClockView;

@interface UICClockViewSampleViewController : UIViewController
{
   UICClockView *cv;
   IBOutlet UIButton *toggleButton;
}

- (IBAction) toggle;

@end