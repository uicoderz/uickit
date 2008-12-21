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
      origin = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
      minute_hand_r = (self.bounds.size.width-margin*2) / 2;
      hour_hand_r   = (self.bounds.size.width-margin*2) / 4;
      self.multipleTouchEnabled = NO;
      self.opaque = YES;
   }
   return self;
}

- (void)dealloc
{
   if (delegate)
      [delegate release];

   [super dealloc];
}


float radians(float x)
{
   return x * 2*M_PI / 360.0f;
}

- (void) drawMinuteHand
{
   minute_angle = minute * 360.0f/60.0f;

   CGContextRef context = UIGraphicsGetCurrentContext();

   CGPoint points[] = {
      origin,
      { origin.x + (  sinf(radians(minute_angle)) * minute_hand_r ),
        origin.y + ( -cosf(radians(minute_angle)) * minute_hand_r )
      }
   };

   CGContextAddLines (context, points, 2);
   CGContextStrokePath(context);
}

- (void) drawHourHand
{
   hour_angle = hour * 360.0f/12.0f + (minute / 60.0f * 30.0f);

   CGContextRef context = UIGraphicsGetCurrentContext();

   CGPoint points[] = {
      origin,
      { origin.x + (  sinf(radians(hour_angle)) * hour_hand_r ),
        origin.y + ( -cosf(radians(hour_angle)) * hour_hand_r )
      }
   };

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
      float x = (rect.size.width-margin*2)/2  + (  sinf(radians(i*30)) * ((rect.size.width-margin)/2-18) );
      float y = (rect.size.height-margin*2)/2 + ( -cosf(radians(i*30)) * ((rect.size.height-margin)/2-18) );

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

   [self drawHourHand];
   [self drawMinuteHand];
}

float vec_length(CGPoint v)
{
   return sqrt(v.x*v.x + v.y*v.y);
}

float distance(CGPoint p1, CGPoint p2)
{
   return sqrt((p1.x-p2.x) * (p1.x-p2.x) + (p1.y-p2.y) * (p1.y-p2.y));
}

// dot product
float dot_product(CGPoint v1, CGPoint v2)
{
   return v1.x*v2.x + v1.y*v2.y;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   CGPoint cntr = {
      (self.bounds.size.width-margin*2)/2,
      (self.bounds.size.height-margin*2)/2
   };

   const float minute_delta = cosf(radians(10));

   for (UITouch *touch in touches) {
      CGPoint loc = [touch locationInView:self];

      for (int i=1; i<=12; i++) {
         // determine hour hand
         CGPoint hour_loc = {
            cntr.x +  sinf(radians(i*30)) * (minute_hand_r-18),
            cntr.y + -cosf(radians(i*30)) * (minute_hand_r-18)
         };
         if (distance(loc, hour_loc) < 20.0f) {
            hour = i;
            [self setNeedsDisplay];
            break;
         }
      }

      // determine minute hand
      minute_angle = minute * 360.0f/60.0f;

      CGPoint minute_hand_vec = {
          sinf(radians(minute_angle)) * (minute_hand_r-18),
         -cosf(radians(minute_angle)) * (minute_hand_r-18)
      };

      CGPoint current_vec = {
         loc.x - cntr.x,
         loc.y - cntr.y
      };

      // dot product
      float dot_p = dot_product(minute_hand_vec, current_vec);
      float cos_theta = dot_p / (vec_length(minute_hand_vec) * vec_length(current_vec));
      if (minute_delta < cos_theta)
         minute_moving = YES;

      break;
   }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
   CGPoint cntr = {
      (self.bounds.size.width-margin*2)/2,
      (self.bounds.size.height-margin*2)/2
   };

   for (UITouch *touch in touches) {
      if (minute_moving) {
         CGPoint loc = [touch locationInView:self];
         minute = loc.x / (float)self.bounds.size.width * 360.0f;

         CGPoint current_vec = {
            loc.x - cntr.x,
            loc.y - cntr.y
         };

         CGPoint base_vec = {0.0f, 1.0f};

         // dot product
         float dot_p = dot_product(current_vec, base_vec);
         float cos_theta = dot_p / vec_length(current_vec);
         float rad = acosf(current_vec.x < 0 ? cos_theta : -cos_theta );
         float theta = rad / (2*M_PI) * 360.0f;
         minute = theta / 360.0f * 60.0f + (current_vec.x < 0 ? 30 : 0);

         [self setNeedsDisplay];
      }
      break;
   }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
   minute_moving = NO;
   if (delegate)
      [delegate picked:self];
}

@end
