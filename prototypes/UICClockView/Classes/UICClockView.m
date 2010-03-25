//
//  Created by Motohiro Takayama on 3/25/10.
//  Copyright 2010 deadbeaf.org. All rights reserved.
//

#import "UICClockView.h"

@implementation UICClockView

@synthesize hour, minute, frequency, working;

static NSArray *s_colors = nil;

+ (NSArray *) colors
{
   if (s_colors == nil) {
      s_colors = [NSArray arrayWithObjects:
                  [UIColor colorWithRed:0.31 green:0.31 blue:0.31 alpha:0.8], // 0
                  [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:0.8],
                  [UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:0.8],
                  [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:0.8],
                  [UIColor colorWithRed:0.31 green:0.31 blue:0.31 alpha:0.8],
                  [UIColor colorWithRed:0.36 green:0.36 blue:0.36 alpha:0.8],
                  [UIColor colorWithRed:0.42 green:0.42 blue:0.42 alpha:0.8], // 6
                  [UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:0.8],
                  [UIColor colorWithRed:0.53 green:0.53 blue:0.53 alpha:0.8],
                  [UIColor colorWithRed:0.58 green:0.58 blue:0.58 alpha:0.8],
                  [UIColor colorWithRed:0.64 green:0.64 blue:0.64 alpha:0.8],
                  [UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:0.8],
                  [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:0.8], // 12
                  [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:0.8],
                  [UIColor colorWithRed:0.86 green:0.86 blue:0.86 alpha:0.8],
                  [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:0.8],
                  [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:0.8],
                  [UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:0.8],
                  [UIColor colorWithRed:0.64 green:0.64 blue:0.64 alpha:0.8], // 18
                  [UIColor colorWithRed:0.58 green:0.58 blue:0.58 alpha:0.8],
                  [UIColor colorWithRed:0.53 green:0.53 blue:0.53 alpha:0.8],
                  [UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:0.8],
                  [UIColor colorWithRed:0.42 green:0.42 blue:0.42 alpha:0.8],
                  [UIColor colorWithRed:0.36 green:0.36 blue:0.36 alpha:0.8], // 23
                  nil];
      [s_colors retain];
   }
   return s_colors;
}

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
   CGContextSetFillColorWithColor(context, [[[UICClockView colors] objectAtIndex:hour] CGColor]);
   CGContextAddEllipseInRect(context, ellipseRect);
   CGContextFillPath(context);
   CGContextAddEllipseInRect(context, ellipseRect);
   CGContextStrokePath(context);

   CGPoint ellipseCenter = {rect.origin.x + rect.size.width/2, rect.origin.y + rect.size.height/2};
   CGFloat minuteHand = rect.size.height * 0.4;
   CGFloat hourHand = rect.size.height * 0.25;

   CGColorRef circleColor = [[[UICClockView colors] objectAtIndex:hour] CGColor];
   const CGFloat *colorComponents = CGColorGetComponents(circleColor);
   CGContextSetRGBStrokeColor(context, 1.0 - colorComponents[0] + 0.25, 1.0 - colorComponents[1] + 0.1, 1.0 - colorComponents[2] + 0.1, colorComponents[3]);

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
