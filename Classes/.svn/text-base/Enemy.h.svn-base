//
//  Enemy.h
//  When Pigs Fly
//
//  Created by Ryan on 10/11/08.
//  Copyright 2008 Fifth Floor Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFObject.h"

#define UPDOWN1 1
#define UPDOWN2 2

#define TYPE1 1
#define TYPE2 2
#define TYPE3 3
#define TYPE4 4
#define TYPE5 5
#define TYPE6 6
#define TYPE7 7
#define TYPE8 8
#define TYPE9 9

#define BOSS1 10
#define BOSS2 11
#define BOSS3 12
#define BOSS4 13
#define BOSS5 14
#define BOSS6 15
#define BOSS7 16


#define LEVEL1 1
#define LEVEL2 2
#define LEVEL3 3
#define LEVEL4 4
#define LEVEL5 5
#define LEVEL6 6

@interface Enemy : PFObject {
	int path;
	int points;
	
	float max_left_x_vel;
	float max_right_x_vel;
	
	BOOL reversing;
	
	int health;
	int maxHealth;
	
	int shipType;
	int energy;
	int aggression;
	
	BOOL boss;
	BOOL shouldFire;
	
	UIImage *damage1;
	UIImage *damage2;
	
	UIImage *gun;
	NSTimer *fireTimer;
}

@property (nonatomic, retain) NSTimer *fireTimer;
@property (nonatomic, assign) BOOL shouldFire;
@property (nonatomic, retain) UIImage *damage1;
@property (nonatomic, retain) UIImage *damage2;
@property (nonatomic, retain) UIImage *gun;

@property (nonatomic, assign) int energy;
@property (nonatomic, assign) int health;
@property (nonatomic, assign) int maxHealth;
@property (nonatomic, assign) int shipType;
@property (nonatomic, assign) int status;
@property (nonatomic, assign) int path;
@property (nonatomic, assign) int points;
@property (nonatomic, assign) int aggression;

@property (nonatomic, assign) BOOL boss;

-(id)init:(int)type x:(float)x y:(float)y isStatic:(BOOL)isS path:(int)p difficulty:(int)difficulty;
-(void)followPath:(float)screenX;
-(void)hit:(int)damage;
-(void)setAggressionLevel:(int)level;

@end
