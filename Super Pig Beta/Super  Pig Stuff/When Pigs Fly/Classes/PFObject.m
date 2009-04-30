//
//  Object.m
//  When Pigs Fly
//
//  Created by Ryan on 10/10/08.
//  Copyright 2008 Fifth Floor Media. All rights reserved.
//

#import "PFObject.h"


@implementation PFObject

@synthesize img,velocity,effectedByGravity,type,status,boundingBoxes,text;

-(id)init:(NSString *)imgName x:(float)x y:(float)y isStatic:(BOOL)isS type:(int)t{

	float width,height;
	
	if (t == SCORE || t == DAMAGE || t == HEALTH){
		text = imgName;
		width = 60;
		height = 28;
	}
	else{
		text = nil;
		imgName = [imgName stringByReplacingOccurrencesOfString:@".png" withString:@""];
		img = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imgName ofType:@"png"]];
		[img retain];
		width = img.size.width;
		height = img.size.height;
	}
	
	type = t;
	
	CGRect rect = CGRectMake(x, y, width, height);
	isStatic = isS;
	effectedByGravity = NO;
	
	boundingBoxes = [[NSMutableArray alloc] init];
	
	return [self initWithFrame:rect];
}

-(void)addBoundingBox:(CGRect)newBox{
	NSValue *rectValue = [NSValue valueWithCGRect:newBox];
	//NSLog(@"Value: %@",rectValue);
	[boundingBoxes addObject:rectValue];
	//[rectValue release];
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		[self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

-(void)update:(float)elapsed screenX:(float)screenX player:(Pig *)player{
	if (isStatic){
		return;
	}
	
	//Check if we need to update the position
	if(effectedByGravity){
		velocity.y += 4;
	}
	
	if (velocity.x != 0 || velocity.y != 0){
		float newX = self.frame.origin.x + (velocity.x * elapsed);
		float newY = self.frame.origin.y + (velocity.y * elapsed);
		
		if (type == SPHERE && newY > 260){
			newY = 260;
		}
		
		[self setFrame:CGRectMake(newX, newY, self.frame.size.width, self.frame.size.height)];
	}
	
	//if (self.frame.origin.x > screenX + 480){
		//Reset egg
	//	[self setVelocity:CGPointMake(350,-60)];
	//}
}

-(BOOL)checkCollision2:(PFObject *)object{
	NSMutableArray *with = [object boundingBoxes];
	
	for(int x=0;x<[with count];x++){
		//if ([[with objectAtIndex:x] status] != ALIVE) continue;
			
		//NSLog(@"Status: %d",[[with objectAtIndex:x] status]);
		
		//if ([[with objectAtIndex:x] status] == ALIVE){
		//NSLog(@"Object: %@",[with objectAtIndex:x]);
		NSValue *tmp = [with objectAtIndex:x];
		CGRect rect = [tmp CGRectValue];
		
		//NSLog(@"Frame: %f,%f",object.frame.origin.x,object.frame.origin.y);
		rect.origin.x += object.frame.origin.x;
		rect.origin.y += object.frame.origin.y;
		
		int left1, left2;
		int right1, right2;
		int top1, top2;
		int bottom1, bottom2;
		
		left1 = self.frame.origin.x;
		left2 = rect.origin.x;
		right1 = self.frame.origin.x + self.frame.size.width;
		right2 = rect.origin.x + rect.size.width;
		top1 = self.frame.origin.y;
		top2 = rect.origin.y;
		bottom1 = self.frame.origin.y + self.frame.size.height;
		bottom2 = rect.origin.y + rect.size.height;
		
		if (bottom1 < top2) continue;
		if (top1 > bottom2) continue;
		
		if (right1 < left2) continue;
		if (left1 > right2) continue;
		
		return YES;
		//}
	}
	
	return NO;
}

-(int)checkCollision:(NSMutableArray *)with{
	for(int x=0;x<[with count];x++){
		if ([[with objectAtIndex:x] status] == ALIVE){
			int left1, left2;
			int right1, right2;
			int top1, top2;
			int bottom1, bottom2;
			
			left1 = self.frame.origin.x;
			left2 = [[with objectAtIndex:x] frame].origin.x;
			right1 = self.frame.origin.x + self.frame.size.width;
			right2 = [[with objectAtIndex:x] frame].origin.x + [[with objectAtIndex:x] frame].size.width;
			top1 = self.frame.origin.y;
			top2 = [[with objectAtIndex:x] frame].origin.y;
			bottom1 = self.frame.origin.y + self.frame.size.height;
			bottom2 = [[with objectAtIndex:x] frame].origin.y + [[with objectAtIndex:x] frame].size.height;
			
			if (bottom1 < top2) continue;
			if (top1 > bottom2) continue;
			
			if (right1 < left2) continue;
			if (left1 > right2) continue;
		
			//Check bouning boxes?
			if ([boundingBoxes count] > 0){
				if ([[with objectAtIndex:x] checkCollision2:self]){
					return x;
				}
			}
			else{
				return x;
			}
		}
	}
	
	return -1;
}


-(BOOL)isAlive{
	if (status == ALIVE){
		return YES;
	}
	
	return NO;
}

- (void)drawRect:(CGRect)rect {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	
	//CGContextSaveGState(ctx);
	CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
	
	if (text != nil){

		CGAffineTransform xform = CGAffineTransformMake(1.0,  0.0,0.0, -1.0,0.0,  0.0);
		CGContextSetTextMatrix(ctx, xform);
		//[self setBackgroundColor:[UIColor redColor]];
		
		const char* chtext = [text cStringUsingEncoding: NSASCIIStringEncoding];
		
		CGContextSelectFont(ctx, "Helvetica-Bold", 26, kCGEncodingMacRoman);
		CGContextSetTextDrawingMode(ctx, kCGTextFillStroke);
		
		float red = 15;
		float green = 62;
		float blue = 244;
		
		if (type == DAMAGE){	
			red = 255; green = 10; blue = 10; 
			CGContextSetRGBStrokeColor(ctx,(float)161/255, (float)18/255, (float)18/255, 1);
		}
		else if (type == HEALTH){ 
			red = 0; green = 255; blue = 10; 
			CGContextSetRGBStrokeColor(ctx,(float)9/255, (float)41/255, (float)66/255, 1);
		}
		
		CGContextSetRGBStrokeColor(ctx,(float)255/255, (float)255/255, (float)255/255, 1);
		CGContextSetRGBFillColor(ctx, (float)red/255, (float)green/255, (float)blue/255, 1);
		CGContextShowTextAtPoint(ctx, 0, 0, chtext, strlen(chtext));
		
	}
	else{
		CGContextScaleCTM(ctx, 1.0, -1.0);
		CGContextDrawImage(ctx,CGRectMake(0,0,self.frame.size.width,self.frame.size.height), [img CGImage]);
	}
	//CGContextRestoreGState(ctx);
}

- (void)dealloc {
	[super dealloc];

	//[img release];
	//[boundingBoxes release];
}


@end
