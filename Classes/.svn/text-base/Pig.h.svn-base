//
//  Pig.h
//  When Pigs Fly
//
//  Created by Ryan on 10/10/08.
//  Copyright 2008 Fifth Floor Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Pig : UIView {
	UIImage *flyingImg;
	UIImage *thrustImg;
	
	UIImage *jetpack;
	UIImage *jetpack2;
	UIImage *jetpack3;
	
	UIImage *jetpackth;
	UIImage *jetpack2th;
	UIImage *jetpack3th;

	UIImage *hat;
	NSString *hatName;
	
	CGPoint velocity;
	BOOL thrusting;
	BOOL blinking;
	int frame;
	
	NSMutableArray *boundingBoxes;
	int health;
}

@property (nonatomic, assign) int health;
@property (nonatomic, assign) CGPoint velocity;
@property (nonatomic, retain) UIImage *flyingImg;
@property (nonatomic, retain) UIImage *thrustImg;
@property (nonatomic, retain) UIImage *hat;
@property (nonatomic, retain) NSString *hatName;

@property (nonatomic, retain) UIImage *jetpack;
@property (nonatomic, retain) UIImage *jetpack2;
@property (nonatomic, retain) UIImage *jetpack3;
@property (nonatomic, retain) UIImage *jetpackth;
@property (nonatomic, retain) UIImage *jetpack2th;
@property (nonatomic, retain) UIImage *jetpack3th;
@property (nonatomic, assign) BOOL blinking;
@property (nonatomic, retain) NSMutableArray *boundingBoxes;

-(void)update:(float)elapsed screenX:(float)screenX;
-(void)updatePosition:(float)x y:(float)y z:(float)z;
-(void)stopThrust;
-(void)startThrust;
-(BOOL)checkCollisionWithObject:(id)object;
-(void)takeDamage:(int)damage;
-(void)removeHat;
-(void)putHatOn:(NSString *)name;
-(void)addHealth:(int)h;

@end

