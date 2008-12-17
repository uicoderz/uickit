//
//  UICClockTimePickerAppDelegate.h
//  UICClockTimePicker
//
//  Created by mootoh on 12/17/08.
//  Copyright deadbeaf.org 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UICClockTimePickerViewController;

@interface UICClockTimePickerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UICClockTimePickerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UICClockTimePickerViewController *viewController;

@end

