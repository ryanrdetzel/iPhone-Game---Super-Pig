//
//  HealthBar.m
//  When Pigs Fly
//
//  Created by Ryan on 10/15/08.
//  Copyright 2008 Fifth Floor Media. All rights reserved.
//

#import "HealthBar.h"


@implementation HealthBar

@synthesize max,value;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		[self setBackgroundColor:[UIColor clearColor]];
		max = 100;
		value = 100;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(ctx, 0.01, 1, 0, 0.7);

	float percent = (float)value / max;
	
	for (int x=0;x<(60 * percent);x+=5){
		CGRect tmp = CGRectMake(x+2, 0 , 3, 15);
		CGContextFillRect(ctx,tmp);
	}
}


- (void)dealloc {
    [super dealloc];
}


@end
