//
//  Enemy.m
//  When Pigs Fly
//
//  Created by Ryan on 10/11/08.
//  Copyright 2008 Fifth Floor Media. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

@synthesize path,status,shipType,health,energy,damage1,damage2,points,boss;
@synthesize gun,aggression,shouldFire,fireTimer,maxHealth;

-(id)init:(int)t x:(float)x y:(float)y isStatic:(BOOL)isS path:(int)p difficulty:(int)difficulty{
	
	shipType = t;
	health = maxHealth = 3;
	aggression = 0;
	NSString *imgName = @"boss2.png";
	boss = NO;
	shouldFire = NO;
	points = 50;
	
	switch (t) {
		case TYPE1:
			health = 3;
			imgName = @"ship1.png";
			damage1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship1d1" ofType:@"png"]];
			damage2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship1d2" ofType:@"png"]];
			points = 75;
			break;
		case TYPE2:
			health = 4;
			imgName = @"ship2.png";
			damage1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship2d1" ofType:@"png"]];
			damage2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship2d2" ofType:@"png"]];
			points = 100;
			break;
		case TYPE3:
			health = 6;
			imgName = @"ship3.png";
			damage1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship3d1" ofType:@"png"]];
			damage2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship3d2" ofType:@"png"]];
			points = 125;
			break;
		case TYPE4:
			health = 8;
			imgName = @"ship4.png";
			damage1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship4d1" ofType:@"png"]];
			damage2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship4d2" ofType:@"png"]];
			points = 150;
			break;
		case TYPE5:
			health = 9;
			imgName = @"ship5.png";
			damage1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship5d1" ofType:@"png"]];
			damage2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship5d2" ofType:@"png"]];
			points = 175;
			break;
		case TYPE6:
			health = 11;
			imgName = @"ship6.png";
			damage1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship6d1" ofType:@"png"]];
			damage2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship6d2" ofType:@"png"]];
			points = 175;
			break;
		case TYPE8:
			health = 13;
			imgName = @"ship8.png";
			damage1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship8d1" ofType:@"png"]];
			damage2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship8d2" ofType:@"png"]];
			points = 225;
			break;
		case TYPE9:
			health = 15;
			imgName = @"ship9.png";
			damage1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship9d1" ofType:@"png"]];
			damage2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ship9d2" ofType:@"png"]];
			points = 250;
			break;
			
		case BOSS1:	health = 20; boss = YES; points = 300;	break;
		case BOSS2:	health = 22; boss = YES; points = 300;	break;
		case BOSS3:	health = 25; boss = YES; points = 300;	break;
		case BOSS4:	health = 27; boss = YES; points = 300;	break;
		case BOSS5:	health = 30; boss = YES; points = 300;	break;
		case BOSS6:	health = 35; boss = YES; points = 300;	break;
		case BOSS7:	health = 40; boss = YES; points = 300;	break;
	}
	
	gun = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"alienGun1" ofType:@"png"]];

	
	//Hard add extra life
	if (difficulty == 3){
		health += round(health * 0.50);
	}
	
	maxHealth = health;

	
	self = [super init:imgName x:x y:y isStatic:isS type:SHIP];
	self.path = p;
	
	if (boss){
		damage1 = damage2 = self.img;
	}
	else{
		[damage1 retain];
		[damage2 retain];
	}	

	[gun retain];
	
	max_left_x_vel = -1;
	max_right_x_vel = 100;
	
	status = PENDING;
	
	//Update the size to fit the health bar
	[self setFrame:CGRectMake(x, y, self.frame.size.width, self.frame.size.height+15)];
	
	//Setup bounding boxes
	if (!boss){
		[self addBoundingBox:CGRectMake(30, 0, 40, 20)];  //top
		[self addBoundingBox:CGRectMake(20, 20, 60, 40)];  //box in middle
		[self addBoundingBox:CGRectMake(5, 33, 20, 20)];  //left bottom
		[self addBoundingBox:CGRectMake(75, 33, 20, 20)];  //right bottom
	}
	else{
		[self addBoundingBox:CGRectMake(38, 5, 50, 15)];  //top
		[self addBoundingBox:CGRectMake(28, 20, 70, 40)];  //box in middle
		[self addBoundingBox:CGRectMake(5, 60, 110, 20)];  //left bottom
		[self addBoundingBox:CGRectMake(20, 80, 80, 10)];  //left bottom

	}
	
	/*
	for (int x=0;x<[boundingBoxes count];x++){
		NSValue *tmp = [boundingBoxes objectAtIndex:x];
		CGRect rect = [tmp CGRectValue];
		UIView *bb = [[UIView alloc] initWithFrame:rect]; 
		[bb setBackgroundColor:[UIColor blueColor]];
		[bb setAlpha:0.5];
		[self addSubview:bb];
	}
	*/
	
	return self;
}

-(void)setAggressionLevel:(int)level{
	aggression = level;
	
	int seconds = 10 - level;
	if (seconds <= 0) seconds = 1;
	
	fireTimer = [NSTimer scheduledTimerWithTimeInterval:(seconds) 
									 target:self 
								   selector:@selector(fire) 
								   userInfo:nil
									repeats:YES];
}

-(void)fire{
	if (status == ALIVE){
		//NSLog(@"Fire");
		shouldFire = YES;
	}
}

-(void)update:(float)elapsed screenX:(float)screenX player:(Pig *)player{
	//Should we update?
	if (self.frame.origin.x <= screenX + 480 && status == PENDING){
		status = ALIVE;
		[fireTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:10 - aggression]];
		[self setNeedsDisplay];
	}
	
	if (status == PENDING){
		return;
	}
	
	if (velocity.x != 0 || velocity.y != 0){
		float newX = self.frame.origin.x + (velocity.x * elapsed);
		float newY = self.frame.origin.y + (velocity.y * elapsed);
		
		[self setFrame:CGRectMake(newX, newY, self.frame.size.width, self.frame.size.height)];
	}

	//Check to ground hit.
	/*
	if (self.frame.origin.y + self.frame.size.height-20 >= 320){
		velocity.x = 0;
		velocity.y = 0;
	}*/
	
	[self followPath:screenX];
}

- (void)drawRect:(CGRect)rect {
	
	if (status == ALIVE && health > 0){
		CGContextRef ctx = UIGraphicsGetCurrentContext();
		CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
		CGContextScaleCTM(ctx, 1.0, -1.0);
		
		float percent = (float)health / maxHealth;
		int perc = percent * 100;
		
		CGContextDrawImage(ctx,CGRectMake(self.frame.size.width / 2 - 10 ,12,20, 6), [gun CGImage]);

		if (perc >= 33 && perc < 66){
			CGContextDrawImage(ctx,CGRectMake(0,15,self.frame.size.width,self.frame.size.height-15), [damage1 CGImage]);
		}
		else if (perc < 33){
			CGContextDrawImage(ctx,CGRectMake(0,15,self.frame.size.width,self.frame.size.height-15), [damage2 CGImage]);
		}
		else{
			CGContextDrawImage(ctx,CGRectMake(0,15,self.frame.size.width,self.frame.size.height-15), [img CGImage]);
		}
		//Draw gun
		
		CGContextSetRGBFillColor(ctx, 0.01, 1, 0, 0.7);
		
		int diff = (self.frame.size.width - 60) / 2;
		
		for (int x=0;x<(60) * percent;x+=5){
			CGRect tmp = CGRectMake(x+2+diff, 0 , 3, 10);
			CGContextFillRect(ctx,tmp);
		}
	}
	/*else{
		CGContextRef ctx = UIGraphicsGetCurrentContext();
		CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
		CGContextScaleCTM(ctx, 1.0, -1.0);
		
		CGContextSetRGBFillColor(ctx, 0.0, 0.0, 0, 0.7);
		CGRect tmp = CGRectMake(0, 0 , 30, 30);
		CGContextFillRect(ctx,tmp);
	}	*/	
}

-(void)hit:(int)damage{
	health-=damage;
	
	if (velocity.x < 0){
		if (!boss){
			velocity.x = velocity.x / 2;
		}
	}
	
	[self setFrame:CGRectMake(self.frame.origin.x + 5, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
	
	[self setNeedsDisplay];
}

-(void)followPath:(float)screenX{
	// Reverse x velocity
	
	if (status != ALIVE){
		return;
	}
	
	if (path == UPDOWN1){
		if (self.frame.origin.x < screenX + 250){
			[self setVelocity:CGPointMake( self.velocity.x + 2,self.velocity.y)];
		}
		else if (self.frame.origin.x > screenX + 380){
			[self setVelocity:CGPointMake( self.velocity.x - 2,self.velocity.y)];
		}
		if (self.frame.origin.x <= 130){
			[self setFrame:CGRectMake(130, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
		}
	}
	else if (path == UPDOWN2){
		if (self.frame.origin.x < screenX + 150){
			[self setVelocity:CGPointMake( self.velocity.x + 2,self.velocity.y)];
		}
		else if (self.frame.origin.x > screenX + 380){
			[self setVelocity:CGPointMake( self.velocity.x - 2,self.velocity.y)];
		}
		
		if (self.frame.origin.x <= 50){
			[self setFrame:CGRectMake(50, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
		}
	}
	
	//Max
	if (velocity.x > 150){
		[self setVelocity:CGPointMake(150,self.velocity.y)];
	}
	if (velocity.x < -110){
		[self setVelocity:CGPointMake(-110,self.velocity.y)];
	}
	
	if (self.frame.origin.y < 0){
		[self setVelocity:CGPointMake( self.velocity.x,self.velocity.y+1)];
	}
	else if (self.frame.origin.y > 200){
		[self setVelocity:CGPointMake( self.velocity.x,self.velocity.y-1)];
	}
	
	/*if (boss){
		if (self.frame.origin.x > screenX + 480 - self.frame.size.width){
			[self setFrame:CGRectMake(screenX + 480 - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
		}
	}*/
}

- (void)dealloc {
	[super dealloc];
	
	//[damage1 release];
	//[damage2 release];
	//[gun release];
}

@end
