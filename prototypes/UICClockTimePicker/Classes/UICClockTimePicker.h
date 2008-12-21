//
//  UICClockTimePicker.h
//  UICClockTimePicker
//
//  Created by mootoh on 12/17/08.
//  Copyright 2008 deadbeaf.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UICClockTimePicker;

@protocol UICClockTimePickerDelegate
- (void) picked:(UICClockTimePicker *)picker;
@end

@interface UICClockTimePicker : UIView
{
   float hour_angle;
   float minute_angle;
   float hour_hand_r;
   float minute_hand_r;
   NSInteger hour;
   NSInteger minute;
   BOOL minute_moving;
   id delegate;
}

@property (nonatomic) NSInteger hour;
@property (nonatomic) NSInteger minute;
@property (nonatomic, retain) id delegate;

@end
