#import "SampleUICTableCell.h"

@implementation SampleUICTableCell

- (void)dealloc {
	[text release];
	[super dealloc];
}

- (void)setText:(NSString*)aText {
	[text release];
	text = [aText retain];
	[self setNeedsDisplay];
}

- (void)drawTextsWithOffset:(CGFloat)offset {
	[@"テストてすと" drawInRect:CGRectMake(10,4+offset,150,20) 
				 withFont:[UIFont boldSystemFontOfSize:12]
			lineBreakMode:UILineBreakModeWordWrap];
	
	[@"ラベル2" drawInRect:CGRectMake(160,4+offset,150,20) 
			   withFont:[UIFont boldSystemFontOfSize:12]
		  lineBreakMode:UILineBreakModeWordWrap];
	
	[text drawInRect:CGRectMake(10, 20+offset, 300, 40) 
			withFont:[UIFont systemFontOfSize:14]
	   lineBreakMode:UILineBreakModeWordWrap];
}


#pragma mark UICCell
- (void)drawRect:(CGRect)rect {
	[super drawRect:rect]; // draw background

	// draw contents

	CGContextRef context = UIGraphicsGetCurrentContext();	
	CGContextSetTextDrawingMode(context, kCGTextFill);

//	CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.9f alpha:1.f].CGColor);
//	[self drawTextsWithOffset:1.f];
	CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.2f alpha:1.f].CGColor);
	[self drawTextsWithOffset:0.f];
}

- (void)drawSelectedBackgroundRect:(CGRect)rect {
	[super drawSelectedBackgroundRect:rect]; // draw background
	
	// draw contents

	CGContextRef context = UIGraphicsGetCurrentContext();	
	CGContextSetTextDrawingMode(context, kCGTextFill);
	
//	CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.3f alpha:1.f].CGColor);
//	[self drawTextsWithOffset:-1.f];
	CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:1.0f alpha:1.f].CGColor);
	[self drawTextsWithOffset:0.f];



}

@end
