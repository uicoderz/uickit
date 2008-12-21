//
//  UICClockTimePicker.m
//  UICClockTimePicker
//
//  Created by mootoh on 12/17/08.
//  Copyright 2008 deadbeaf.org. All rights reserved.
//

#import "UICClockTimePicker.h"

@implementation UICClockTimePicker

@synthesize hour, minute, delegate;

const float margin = 3.0f;

- (id)initWithFrame:(CGRect)frame
{
   if (self = [super initWithFrame:frame]) {
      self.backgroundColor = [UIColor whiteColor];
      hour_angle = 0.0f;
      minute_angle = 0.0f;
      hour = 12;
      minute = 0;
      minute_moving = NO;
      minute_hand_r = (self.bounds.size.width-margin*2) / 2;
      hour_hand_r =  (self.bounds.size.width-margin*2) / 4;
      self.multipleTouchEnabled = NO;
   }
   return self;
}

- (void)dealloc
{
   [super dealloc];
}


float radians(float x)
{
   return x * 2*M_PI / 360.0f;
}

- (void) drawMinuteTick
{
   CGContextRef context = UIGraphicsGetCurrentContext();

   // Draw ticks
   float x0 = self.bounds.size.width/2;
   float y0 = self.bounds.size.height/2;
   float x1 = self.bounds.size.width/2  + ( sinf(radians(minute_angle)) * minute_hand_r );
   float y1 = self.bounds.size.height/2 + ( -cosf(radians(minute_angle)) * minute_hand_r );

   CGPoint points[] = {{x0, y0}, {x1, y1}};

   CGContextAddLines (context, points, 2);
   CGContextStrokePath(context);
}

- (void) drawHourTick
{
   CGContextRef context = UIGraphicsGetCurrentContext();

   // Draw ticks
   float x0 = self.bounds.size.width/2;
   float y0 = self.bounds.size.height/2;
   float x1 = self.bounds.size.width/2  + ( sinf(radians(hour_angle)) * hour_hand_r );
   float y1 = self.bounds.size.height/2 + ( -cosf(radians(hour_angle)) * hour_hand_r );

   CGPoint points[] = {{x0, y0}, {x1, y1}};

   CGContextAddLines (context, points, 2);
   CGContextStrokePath(context);
}

- (void) drawRect:(CGRect)rect
{
   CGRect outer_rect = CGRectMake(
      margin,
      margin,
      self.bounds.size.width-margin*2,
      self.bounds.size.height-margin*2);

   CGContextRef context = UIGraphicsGetCurrentContext();
   CGContextBeginPath(context);

   // outer circle
   CGContextSetLineWidth(context, margin);
   CGContextAddEllipseInRect(context, outer_rect);

   // hours
   for (int i=1; i<=12; i++) {
      float x = (self.bounds.size.width-margin*2)/2  + ( cosf(radians(i*30 - 90)) * ((self.bounds.size.width-margin)/2-18) );
      float y = (self.bounds.size.height-margin*2)/2 + ( sinf(radians(i*30 - 90)) * ((self.bounds.size.height-margin)/2-18) );

      CGPoint pt = {x, y};

      if (i == hour) {
         CGContextSetRGBFillColor (context, 1, 0, 0, .5);
         CGContextSetRGBStrokeColor (context, 0, 0, 1, 1);
      } else {
         CGContextSetRGBFillColor (context, 0, 0, 0, 1);
         CGContextSetRGBStrokeColor (context, 0, 0, 0, 1);
      }

      [[NSString stringWithFormat:@"%d", i] drawAtPoint:pt withFont:[UIFont systemFontOfSize:
         (i == hour ? 24 : 18)]];

      CGContextSetRGBFillColor (context, 0, 0, 0, 1);
      CGContextSetRGBStrokeColor (context, 0, 0, 0, 1);
   }

   [self drawHourTick];
   [self drawMinuteTick];
}

float distance(CGPoint p1, CGPoint p2)
{
   return sqrt((p1.x-p2.x) * (p1.x-p2.x) + (p1.y-p2.y) * (p1.y-p2.y));
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   for (UITouch *touch in touches) {
      CGPoint loc = [touch locationInView:self];

      for (int i=1; i<=12; i++) {
         CGPoint hour_loc = {
            (self.bounds.size.width-margin*2)/2  + ( cosf(radians(i*30 - 90)) * (minute_hand_r-18) ),
            (self.bounds.size.height-margin*2)/2 + ( sinf(radians(i*30 - 90)) * (minute_hand_r-18) )
         };
         if (distance(loc, hour_loc) < 20.0f) {
            hour = i;
            hour_angle = i*30;
            [self setNeedsDisplay];
         }

         CGPoint minute_loc = {
            (self.bounds.size.width-margin*2)/2  + cosf(minute_angle * (minute_angle-18)),
            (self.bounds.size.height-margin*2)/2 + sinf(minute_angle * (minute_angle-18))
         };
         if (distance(loc, minute_loc) < 20.0f) {
            minute_moving = YES;
         }
      }
      break;
   }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
   CGPoint cntr = {
      self.bounds.size.width-margin*2,
      self.bounds.size.height-margin*2
   };

   for (UITouch *touch in touches) {
      CGPoint location = [touch locationInView:self];
      minute_angle = location.x / (float)self.bounds.size.width * 360.0f;
      break;
   }
   [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
   minute_moving = NO;
}

@end
