//
//  Created by Motohiro Takayama on 3/25/10.
//  Copyright 2010 deadbeaf.org. All rights reserved.
//

#import "UICClockView.h"

@implementation UICClockView

@synthesize hour, minute, frequency, working;

- (id)initWithFrame:(CGRect)frame
{
   if ((self = [super initWithFrame:frame])) {
      self.backgroundColor = [UIColor clearColor];
      hour = 0;
      minute = 0;
   }
   return self;
}

- (void)drawRect:(CGRect)rect
{
   CGContextRef context = UIGraphicsGetCurrentContext();

   // circle around
   CGRect ellipseRect = CGRectMake(rect.origin.x+5, rect.origin.y+5, rect.size.width-10, rect.size.height-10);
   CGContextSetRGBStrokeColor(context, 0.3, 0.3, 0.3, 1.0);
   CGContextSetLineWidth(context, 4.5f);
   CGContextSetRGBFillColor(context, 0.9, 0.9, 0.9, 1.0);
   CGContextAddEllipseInRect(context, ellipseRect);
   CGContextFillPath(context);
   CGContextAddEllipseInRect(context, ellipseRect);
   CGContextStrokePath(context);

   CGPoint ellipseCenter = {rect.origin.x + rect.size.width/2, rect.origin.y + rect.size.height/2};
   CGFloat minuteHand = rect.size.height * 0.4;
   CGFloat hourHand = rect.size.height * 0.25;

   // minuteHand
   CGContextSetLineWidth(context, 3.0f);
   CGContextMoveToPoint(context, ellipseCenter.x, ellipseCenter.y);
   CGContextAddLineToPoint(context,
                           ellipseCenter.x + sinf(M_PI / 180.0f * minute * 6.0f) * minuteHand,
                           ellipseCenter.y - cosf(M_PI / 180.0f * minute * 6.0f) * minuteHand);
   CGContextStrokePath(context);

   // hourHand
   CGContextSetLineWidth(context, 4.0f);
   CGContextMoveToPoint(context, ellipseCenter.x, ellipseCenter.y);
   CGContextAddLineToPoint(context,
                           ellipseCenter.x + sinf(M_PI / 180.0f * (hour * 30.0f + minute * 0.5f)) * hourHand,
                           ellipseCenter.y - cosf(M_PI / 180.0f * (hour * 30.0f + minute * 0.5f)) * hourHand);
   CGContextStrokePath(context);

   // center circle
   CGRect innerEllipseRect = CGRectMake(ellipseCenter.x-4, ellipseCenter.y-4, 8, 8);
   CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
   CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
   CGContextAddEllipseInRect(context, innerEllipseRect);
   CGContextFillPath(context);
}

- (void)dealloc
{
   if (working)
      [self stop];
   [super dealloc];
}

- (void) updateTime
{
   if (++minute >= 60) {
      minute = 0;
      if (++hour >= 24)
         hour = 0;
   }

   [self setNeedsDisplay];
   if (working)
      [self performSelector:@selector(updateTime) withObject:nil afterDelay:frequency];
}


- (void) start
{
   working = YES;
   [self updateTime];
}

- (void) stop
{
   working = NO;
}

@end