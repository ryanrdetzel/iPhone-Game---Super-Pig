//
//  Object.h
//  When Pigs Fly
//
//  Created by Ryan on 10/10/08.
//  Copyright 2008 Fifth Floor Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pig.h"
#import "defines.h"



#define PENDING 0
#define ALIVE 1
#define DEAD 2

@interface PFObject : UIView {
	UIImage *img;
	
	NSString *text;
	BOOL isStatic;
	BOOL effectedByGravity;
	
	int type;
	
	CGPoint velocity;
	int status;
	
	NSMutableArray *boundingBoxes;
}

@property (nonatomic, retain) NSString *text;
@property (nonatomic, assign) int status;
@property (nonatomic, assign) int type;
@property (nonatomic, assign) BOOL effectedByGravity;
@property (nonatomic, assign) CGPoint velocity;
@property (nonatomic, retain) UIImage *img;
@property (nonatomic, retain) NSMutableArray *boundingBoxes;

-(id)init:(NSString *)imgName x:(float)x y:(float)y isStatic:(BOOL)isS type:(int)t;
-(void)update:(float)elapsed screenX:(float)screenX player:(Pig *)player;
-(int)checkCollision:(NSMutableArray *)with;
-(BOOL)checkCollision2:(PFObject *)object;

-(void)addBoundingBox:(CGRect)newBox;
-(BOOL)isAlive;

@end
