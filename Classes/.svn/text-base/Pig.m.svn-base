//
//  Pig.m
//  When Pigs Fly
//
//  Created by Ryan on 10/10/08.
//  Copyright 2008 Fifth Floor Media. All rights reserved.
//

#import "Pig.h"
#import "PFObject.h"

@implementation Pig

@synthesize flyingImg,thrustImg,velocity,health,hat,jetpack,jetpack2,jetpack3;
@synthesize jetpackth, jetpack2th, jetpack3th,blinking,boundingBoxes,hatName;

-(id)init{
	//img = [UIImage imageNamed:@"pig1.png"];
	self =  [self initWithFrame:CGRectMake(10, 50, 125, 80)]; //55
	
	//[self setBackgroundColor:[UIColor greenColor]];
	
	flyingImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pig" ofType:@"png"]];
	
	jetpack = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"jetpack" ofType:@"png"]];
	jetpack2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"jetpack2" ofType:@"png"]];
	jetpack3 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"jetpack3" ofType:@"png"]];
	
	jetpackth = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"jetpack-th" ofType:@"png"]];
	jetpack2th = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"jetpack2-th" ofType:@"png"]];
	jetpack3th = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"jetpack3-th" ofType:@"png"]];
	
	hat = nil; //[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"hat-jester" ofType:@"png"]];
	
	[flyingImg retain];
	[jetpack retain];
	[jetpack2 retain];
	[jetpack3 retain];

	[jetpackth retain];
	[jetpack2th retain];
	[jetpack3th retain];
	
	[hat retain];
	
	frame = 1;
	blinking = NO;
	
	//return [self initWithFrame:CGRectMake(10, 50, 100, 52)];
	//[self addSubview:jetpack];

	boundingBoxes = [[NSMutableArray alloc] init];
	[boundingBoxes addObject:[NSValue valueWithCGRect:CGRectMake(23, 45, 60, 30)]];
	[boundingBoxes addObject:[NSValue valueWithCGRect:CGRectMake(65, 27, 35, 35)]];
	[boundingBoxes addObject:[NSValue valueWithCGRect:CGRectMake(97, 45, 10, 10)]];
/*
	for (int x=0;x<[boundingBoxes count];x++){
		NSValue *tmp = [boundingBoxes objectAtIndex:x];
		CGRect rect = [tmp CGRectValue];
		UIView *bb = [[UIView alloc] initWithFrame:rect]; 
		[bb setBackgroundColor:[UIColor redColor]];
		[bb setAlpha:0.6];
		[self addSubview:bb];
	}
	*/
	
	[NSThread detachNewThreadSelector:@selector(animate) toTarget:self withObject:nil];
	return self;
}

-(void)removeHat{
	hat = nil;
	hatName = @"";
}

-(void)putHatOn:(NSString *)name{
	[hat release];
	hat = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]];
	[hat retain];
	
	hatName = name;
}

- (void) updateDisplay {
	[self setNeedsDisplay];
}

-(void)animate{
	NSAutoreleasePool* p = [[NSAutoreleasePool alloc] init];
	
	[NSThread setThreadPriority:0.5];
	
	while(1){
		[NSThread sleepForTimeInterval:0.1];
		
		[self performSelectorOnMainThread:@selector(updateDisplay) withObject:nil waitUntilDone:YES];
	}
	
	[p release];
}

- (id)initWithFrame:(CGRect)f {
    if (self = [super initWithFrame:f]) {
		[self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

-(void)addHealth:(int)h{
	health += h;
}
-(void)takeDamage:(int)damage{
	health -= damage;
}

-(void)updatePosition:(float)x y:(float)y z:(float)z{
	if (x > 0){
		x *= 10;
	}
	else{
		x *= 4;
	}
	float newY = self.frame.origin.y - x;
	[self setFrame:CGRectMake(self.frame.origin.x, newY, self.frame.size.width, self.frame.size.height)];
}

-(void)startThrust{
	//img = [UIImage imageNamed:@"pig1-thrust.png"];
	[self setNeedsDisplay];
	thrusting = YES;
	//velocity.y = 0;
}

-(void)stopThrust{
	//img = [UIImage imageNamed:@"pig1.png"];
	[self setNeedsDisplay];
	thrusting = NO;
	//velocity.y = 0;
}

-(void)update:(float)elapsed screenX:(float)screenX{
	if (thrusting){
		velocity.y -= 12;
		if (velocity.y < -110){
			velocity.y = -110;
		}
	}
	else{
		velocity.y += 10;
		if (velocity.y > 110){
			velocity.y = 110;
		}
	}
	
	//Check to see if we're off the screen
	float xpos = self.frame.origin.x + (self.velocity.x * elapsed);
	float ypos = self.frame.origin.y + (self.velocity.y * elapsed);

	if (xpos < screenX){
		xpos = screenX;
	}
	else if (xpos > screenX + 480-self.frame.size.width+20){
		xpos = screenX + 480-self.frame.size.width+20;
	}
	 
	
	if (ypos > 235){
		ypos = 235;
		velocity.y = 0;
	}
	else if (ypos < -25){
		ypos = -25;
	}
	
	//NSLog(@"Y: %f",ypos);
	
	[self setFrame:CGRectMake(xpos, ypos, self.frame.size.width, self.frame.size.height)];
}

-(BOOL)checkCollisionWithObject:(id)object{
	int left1, left2;
	int right1, right2;
	int top1, top2;
	int bottom1, bottom2;
		
	for (int x=0;x<[boundingBoxes count];x++){
		//If object has bounding boxes check with each of those
		CGRect rect = [[boundingBoxes objectAtIndex:x] CGRectValue];
		rect.origin.x += self.frame.origin.x;
		rect.origin.y += self.frame.origin.y;
		
		if ([[object boundingBoxes] count] > 0){
			for (int d=0;d<[[object boundingBoxes] count];d++){
				CGRect rect2 = [[[object boundingBoxes] objectAtIndex:d] CGRectValue];
				rect2.origin.x += [object frame].origin.x;
				rect2.origin.y += [object frame].origin.y;

				left1 = rect.origin.x;
				left2 = rect2.origin.x;
				
				right1 = rect.origin.x + rect.size.width;
				right2 = rect2.origin.x + rect2.size.width;
				
				top1 = rect.origin.y;
				top2 = rect2.origin.y;
				
				bottom1 = rect.origin.y + rect.size.height;
				bottom2 = rect2.origin.y + rect2.size.height;
				
				if (bottom1 < top2) continue;
				if (top1 > bottom2) continue;
				
				if (right1 < left2) continue;
				if (left1 > right2) continue;
				
				return YES;
			}
		}
		else{
			left1 = rect.origin.x;
			left2 = [object frame].origin.x;
			
			right1 = rect.origin.x + rect.size.width;
			right2 = [object frame].origin.x + [object frame].size.width;
			
			top1 = rect.origin.y;
			top2 = [object frame].origin.y;
			
			bottom1 = rect.origin.y + rect.size.height;
			bottom2 = [object frame].origin.y + [object frame].size.height;
		
			if (bottom1 < top2) continue;
			if (top1 > bottom2) continue;
		
			if (right1 < left2) continue;
			if (left1 > right2) continue;
			
			return YES;
		}
	}
	return NO;
}


- (void)drawRect:(CGRect)rect {
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	//CGContextSaveGState(ctx);
	CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
	CGContextScaleCTM(ctx, 1.0, -1.0);
	CGContextSetRGBFillColor(ctx, 255, 255, 255,1);
	
	if (blinking){
		float blinkVal = 0.85;
		if (frame == 2)	blinkVal = 0.720;
		if (frame == 3) blinkVal = 0.65;
		CGContextSetAlpha(ctx,blinkVal);
	}
	
	CGContextDrawImage(ctx,CGRectMake(0,0,111,55), [flyingImg CGImage]);
	
	if ([hatName isEqualToString:@"hat-jester"]){
		CGContextDrawImage(ctx,CGRectMake(60,41,[hat size].width,[hat size].height), [hat CGImage]); //Jester
	}
	else if ([hatName isEqualToString:@"hat-chef"]){
		CGContextDrawImage(ctx,CGRectMake(70,50,[hat size].width,[hat size].height), [hat CGImage]); //chef
	}
	else if ([hatName isEqualToString:@"hat-king"]){
		CGContextDrawImage(ctx,CGRectMake(64,49,[hat size].width,[hat size].height), [hat CGImage]);
	}
	else if ([hatName isEqualToString:@"hat-pirate"]){
		CGContextDrawImage(ctx,CGRectMake(62,35,[hat size].width,[hat size].height), [hat CGImage]);
	}
	else if ([hatName isEqualToString:@"hat-santa"]){
		CGContextDrawImage(ctx,CGRectMake(50,15,[hat size].width,[hat size].height), [hat CGImage]);
	}

	
	if (thrusting){
		if (frame == 1)	CGContextDrawImage(ctx,CGRectMake(0,-4,jetpack.size.width,jetpack.size.height), [jetpackth CGImage]);
		if (frame == 2)	CGContextDrawImage(ctx,CGRectMake(0,-4,jetpack.size.width,jetpack.size.height), [jetpack2th CGImage]);
		if (frame == 3)	CGContextDrawImage(ctx,CGRectMake(0,-4,jetpack.size.width,jetpack.size.height), [jetpack3th CGImage]);			
	}
	else{
		if (frame == 1)	CGContextDrawImage(ctx,CGRectMake(0,0,jetpack.size.width,jetpack.size.height), [jetpack CGImage]);
		if (frame == 2)	CGContextDrawImage(ctx,CGRectMake(0,0,jetpack.size.width,jetpack.size.height), [jetpack2 CGImage]);
		if (frame == 3)	CGContextDrawImage(ctx,CGRectMake(0,0,jetpack.size.width,jetpack.size.height), [jetpack3 CGImage]);	
	}
	
	frame++;
	if (frame > 3) frame = 1;
	
	//CGContextRestoreGState(ctx);
}


- (void)dealloc {
    [super dealloc];
}


@end
