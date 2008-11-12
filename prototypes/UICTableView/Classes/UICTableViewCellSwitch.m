//
//  UICTableViewCellSwitch.m
//  UICTable
//
//  Created by Takuma Mori on 08/11/12.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "UICTableViewCellSwitch.h"

@interface UICTableViewCellSwitch(Private)
- (void)switchPushed:(id)sender;

@end

@implementation UICTableViewCellSwitch

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
	
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		sw = [[[[UISwitch alloc] initWithFrame:CGRectMake(208, 9, 0, 0)] autorelease] retain];		
		[sw addTarget:self 
			   action:@selector(switchPushed:)
	 forControlEvents:UIControlEventValueChanged];
		
		[self addSubview:sw];
    }
	NSLog(@"UICTableViewCellSwitch created:%x", self);
    return self;
}

- (void)switchPushed:(id)sender {
	prototype.switchVal = sw.on;
	NSLog(@"switch val changed:%d", prototype.switchVal);
}

- (void)updateWithPrototype:(UICPrototypeTableCell*)aPrototype {
	[prototype release];
	prototype = [aPrototype retain];
	sw.on = prototype.switchVal;
}

- (void)dealloc {
	NSLog(@"UICTableViewCellSwitch dealloc:%x", self);
	[prototype release];
	[sw removeFromSuperview];
	[sw release];
    [super dealloc];
}

@end
