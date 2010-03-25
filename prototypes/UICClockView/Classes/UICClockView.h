//
//  Created by Motohiro Takayama on 3/25/10.
//  Copyright 2010 deadbeaf.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICClockView : UIView
{
   NSInteger hour;
   NSInteger minute;
   CGFloat frequency; // update frequency, specified in second
   BOOL working;
}

@property (nonatomic, assign) NSInteger hour;
@property (nonatomic, assign) NSInteger minute;
@property (nonatomic, assign) CGFloat frequency;
@property (nonatomic, readonly) BOOL working;

- (void) start;
- (void) stop;

@end