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

- (id)initWithFrame:(CGRect)frame
{
   if (self = [super initWithFrame:frame]) {
      hour_angle = 0.0f;
      minute_angle = 0.0f;
      hour = 0;
      minute = 0;
   }
   return self;
}

float radians(float x) {
   return x * 2*M_PI / 360.0f;
}

- (void)drawRect:(CGRect)rect
{
   const float margin = 3.0f;
   float r = (self.bounds.size.width-margin*2) / 2;

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

   // Draw the minute ticks
   for (int a = 0; a < 360; a+=30) {
      float x0 = self.bounds.size.width/2  + ( cosf(radians(a)) * (r-8) );
      float y0 = self.bounds.size.height/2 + ( sinf(radians(a)) * (r-8) );
      float x1 = self.bounds.size.width/2  + ( cosf(radians(a)) * r );
      float y1 = self.bounds.size.height/2 + ( sinf(radians(a)) * r );

      CGPoint points[] = {{x0, y0}, {x1, y1}};

      CGContextAddLines (context, points, 2);
      CGContextStrokePath(context);
   }
   // Draw ticks

   float x0 = self.bounds.size.width/2;
   float y0 = self.bounds.size.height/2;
   float x1 = self.bounds.size.width/2  + ( sinf(radians(hour_angle)) * r );
   float y1 = self.bounds.size.height/2 + ( -cosf(radians(hour_angle)) * r );

   CGPoint points[] = {{x0, y0}, {x1, y1}};

   CGContextAddLines (context, points, 2);
   CGContextStrokePath(context);
}


- (void)dealloc
{
   [super dealloc];
}


@end
