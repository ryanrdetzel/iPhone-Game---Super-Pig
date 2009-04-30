//
//  HealthBar.h
//  When Pigs Fly
//
//  Created by Ryan on 10/15/08.
//  Copyright 2008 Fifth Floor Media. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HealthBar : UIView {
	int max;
	int value;
}

@property (nonatomic, assign) int max;
@property (nonatomic, assign) int value;

@end
