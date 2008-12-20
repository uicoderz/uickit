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
      hour_angle = 0.0f;
      minute_angle = 0.0f;
      hour = 0;
      minute = 0;
      self.multipleTouchEnabled = true;
   }
   return self;
}

float radians(float x) {
   return x * 2*M_PI / 360.0f;
}

- (void) drawMinuteTick
{
   const float r = (self.bounds.size.width-margin*2) / 2;
   CGContextRef context = UIGraphicsGetCurrentContext();

   // Draw ticks
   float x0 = self.bounds.size.width/2;
   float y0 = self.bounds.size.height/2;
   float x1 = self.bounds.size.width/2  + ( sinf(radians(minute_angle)) * r );
   float y1 = self.bounds.size.height/2 + ( -cosf(radians(minute_angle)) * r );

   CGPoint points[] = {{x0, y0}, {x1, y1}};

   CGContextAddLines (context, points, 2);
   CGContextStrokePath(context);
}

- (void) drawHourTick
{
   const float r = (self.bounds.size.width-margin*2) / 4;
   CGContextRef context = UIGraphicsGetCurrentContext();

   // Draw ticks
   float x0 = self.bounds.size.width/2;
   float y0 = self.bounds.size.height/2;
   float x1 = self.bounds.size.width/2  + ( sinf(radians(hour_angle)) * r );
   float y1 = self.bounds.size.height/2 + ( -cosf(radians(hour_angle)) * r );

   CGPoint points[] = {{x0, y0}, {x1, y1}};

   CGContextAddLines (context, points, 2);
   CGContextStrokePath(context);
}

- (void) drawRect:(CGRect)rect
{
   const float r = (self.bounds.size.width-margin*2) / 2;
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
      float x = (self.bounds.size.width-margin*2)/2  + ( cosf(radians(i*30 - 90)) * (r-18) );
      float y = (self.bounds.size.height-margin*2)/2 + ( sinf(radians(i*30 - 90)) * (r-18) );

      CGPoint pt = {x, y};
      [[NSString stringWithFormat:@"%d", i] drawAtPoint:pt withFont:[UIFont systemFontOfSize:16]];
   }

   [self drawHourTick];
   [self drawMinuteTick];
}

- (void)dealloc
{
   [super dealloc];
}

float distance(CGPoint p1, CGPoint p2)
{
   return sqrt((p1.x-p2.x) * (p1.x-p2.x) + (p1.y-p2.y) * (p1.y-p2.y));
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   float r = (self.bounds.size.width-margin*2) / 2;

   for (UITouch *touch in touches) {
      CGPoint loc = [touch locationInView:self];

      for (int i=1; i<=12; i++) {
         CGPoint hour_loc = {
            (self.bounds.size.width-margin*2)/2  + ( cosf(radians(i*30 - 90)) * (r-18) ),
            (self.bounds.size.height-margin*2)/2 + ( sinf(radians(i*30 - 90)) * (r-18) )
         };
         if (distance(loc, hour_loc) < 20.0f) {
            hour = i;
            hour_angle = i*30;
            [self setNeedsDisplay];
         }
      }
      break;
   }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
   for (UITouch *touch in touches) {
      CGPoint location = [touch locationInView:self];
      minute_angle = location.x / (float)self.bounds.size.width * 360.0f;
      break;
   }
   [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}

@end
