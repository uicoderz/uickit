//
//  UICClockTimePickerViewController.h
//  UICClockTimePicker
//
//  Created by mootoh on 12/17/08.
//  Copyright deadbeaf.org 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICClockTimePicker.h"

@interface UICClockTimePickerViewController : UIViewController <UICClockTimePickerDelegate>
{
   IBOutlet UICClockTimePicker *timePicker;
}

@end

