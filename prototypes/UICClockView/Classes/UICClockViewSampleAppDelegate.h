//
//  Created by Motohiro Takayama on 3/25/10.
//  Copyright deadbeaf.org 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UICClockViewSampleViewController;

@interface UICClockViewSampleAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
    UICClockViewSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UICClockViewSampleViewController *viewController;

@end