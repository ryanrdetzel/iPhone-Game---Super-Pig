//
//  When_Pigs_FlyAppDelegate.h
//  When Pigs Fly
//
//  Created by Ryan on 10/10/08.
//  Copyright Fifth Floor Media 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJSON.h"

#import "MYViewController.h"
#import "Pig.h"
#import "PFObject.h"
#import "Enemy.h"
#import "SoundEngine.h"
#import "HealthBar.h"
#import "defines.h"


@interface When_Pigs_FlyAppDelegate : NSObject <UIApplicationDelegate,UIAccelerometerDelegate> {
    UIWindow *window;
	
	MYViewController *viewController;
	PFObject *mainView;
	UIScrollView *scrollView;
	UIView *mapview;
	
	NSDate *start;
	
	float screenX;
	float slowMove;
	BOOL gameRunning;
	
	float accelX;
	float accelY;
	float accelZ;
	
	float rollingX;
	float rollingY;
	float rollingZ;
	
	Pig *player;
	
	PFObject *grass1;
	PFObject *grass2;
	
	NSMutableArray *enemys;
	NSMutableArray *clouds;	
	NSMutableArray *bonus;

	NSMutableArray *playerBullets;
	NSMutableArray *enemyBullets;
	
	UIImageView *explosion1;
	UIImageView *explosion2;

	UILabel *points;
	UILabel *info;
	NSMutableArray *scores;
	
	int totalPoints;
	int enemysKilled;
	int bonusItemsCollected;
	int spheresCollected;
	
	int rockDamage;
	NSMutableArray *lightBalls;
	HealthBar *healthBar;
	
	UIView *titleBar;
	UIView *window1;
	UIView *highscores;
	UIView *options;

	UILabel *countryLabel;
	UIView *levelFinished;
	UIView *levelDied;
	UIView *pauseWindow;

	UIButton *fire;
	UIButton *thrust;
	UIButton *menuButton;
	UIImageView *heart;
	
	BOOL screenMoving;
	
	BOOL canThrow;
	NSString *cname;
	int difficulty;
	
	int RPS; //Rocks per second
	
	UIImageView *background;
	
	BOOL training;
	int stage;
	UIView *trainingWindow;
	UILabel *trainingText;
	BOOL oneComplete;
	int rocksThrown;
	int bonusCollected;
	int newLevels;
	
	/*Map Buttons */
	UIButton *usaButton;
	UIButton *greenlandButton;
	UIButton *togoButton;
	UIButton *brazilButton;
	UIButton *canadaButton;
	UIButton *israelButton;
	UIButton *australiaButton;
	UIButton *indiaButton;
	UIButton *norwayButton;
	UIButton *japanButton;
	UIButton *ethiopiaButton;
	UIButton *tanzaniaButton;
	UIButton *russiaButton;
	UIButton *englandButton;
	
	NSTimeInterval elapsed;
	UIView *loadingWindow;
	
	UILabel *score_aliensKilled;
	UILabel *score_spheresCollected;
	UILabel *score_bonus;
	UILabel *score_total;
	UILabel *score_highscore;
		
	BOOL doubleThrow;
	BOOL doubleDamage;
	BOOL tripleDamage;
	BOOL bulletBounce;
	BOOL soundOn;
	BOOL thrustSoundOn;
	BOOL bossSoundPlayed;
	BOOL invincible;
	
	NSTimer *bonusTimer;
	UInt32	_sounds[11];
	
	UISwitch *soundSwitch;
	UISwitch *thrustSwitch;
	
	BOOL arcadeMode;
}

@property (nonatomic, retain) IBOutlet UISwitch *soundSwitch;
@property (nonatomic, retain) IBOutlet UISwitch *thrustSwitch;

@property (nonatomic, retain) NSTimer *bonusTimer;
@property (nonatomic, retain) IBOutlet UILabel *score_aliensKilled;
@property (nonatomic, retain) IBOutlet UILabel *score_spheresCollected;
@property (nonatomic, retain) IBOutlet UILabel *score_bonus;
@property (nonatomic, retain) IBOutlet UILabel *score_total;
@property (nonatomic, retain) IBOutlet UILabel *score_highscore;

@property (nonatomic, retain) IBOutlet UIView *loadingWindow;
@property (nonatomic, retain) IBOutlet UIButton *usaButton;
@property (nonatomic, retain) IBOutlet UIButton *greenlandButton;
@property (nonatomic, retain) IBOutlet UIButton *togoButton;
@property (nonatomic, retain) IBOutlet UIButton *brazilButton;
@property (nonatomic, retain) IBOutlet UIButton *canadaButton;
@property (nonatomic, retain) IBOutlet UIButton *israelButton;
@property (nonatomic, retain) IBOutlet UIButton *australiaButton;
@property (nonatomic, retain) IBOutlet UIButton *indiaButton;
@property (nonatomic, retain) IBOutlet UIButton *norwayButton;
@property (nonatomic, retain) IBOutlet UIButton *japanButton;
@property (nonatomic, retain) IBOutlet UIButton *ethiopiaButton;
@property (nonatomic, retain) IBOutlet UIButton *tanzaniaButton;
@property (nonatomic, retain) IBOutlet UIButton *russiaButton;
@property (nonatomic, retain) IBOutlet UIButton *englandButton;

@property (nonatomic, retain) IBOutlet UIView *trainingWindow;
@property (nonatomic, retain) IBOutlet UILabel *trainingText;

@property (nonatomic, retain) UIImageView *background;

@property (nonatomic, retain) NSString *cname;
@property (nonatomic, retain) IBOutlet UILabel *countryLabel;
@property (nonatomic, retain) IBOutlet UIView *titleBar;
@property (nonatomic, retain) IBOutlet UIView *window1;
@property (nonatomic, retain) IBOutlet UIView *options;
@property (nonatomic, retain) IBOutlet UIView *highscores;

@property (nonatomic, retain) IBOutlet UIView *levelFinished;
@property (nonatomic, retain) IBOutlet UIView *levelDied;
@property (nonatomic, retain) IBOutlet UIView *pauseWindow;

@property (nonatomic, retain) UIImageView *heart;
@property (nonatomic, retain) UIButton *thrust;
@property (nonatomic, retain) UIButton *fire;
@property (nonatomic, retain) UIButton  *menuButton;

@property (nonatomic, retain) HealthBar *healthBar;
@property (nonatomic, retain) NSMutableArray *lightBalls;
@property (nonatomic, retain) NSMutableArray *scores;
@property (nonatomic, retain) NSMutableArray *clouds;
@property (nonatomic, retain) NSMutableArray *bonus;

@property (nonatomic, retain) UILabel *points;
@property (nonatomic, retain) UILabel *info;
@property (nonatomic, retain) UIImageView *explosion1;
@property (nonatomic, retain) UIImageView *explosion2;

@property (nonatomic, retain) IBOutlet UIView *mapview;
@property (nonatomic, retain) Pig *player;
@property (nonatomic, retain) NSDate *start;

@property (nonatomic, retain) PFObject *grass1;
@property (nonatomic, retain) PFObject *grass2;

@property (nonatomic, retain) NSMutableArray *enemys;
@property (nonatomic, retain) NSMutableArray *enemyBullets;
@property (nonatomic, retain) NSMutableArray *playerBullets;

@property (nonatomic, retain) MYViewController *viewController;
@property (nonatomic, retain) PFObject *mainView;
@property (nonatomic, retain) UIScrollView *scrollView;

@property (nonatomic, retain) IBOutlet UIWindow *window;

-(IBAction)load:(id)sender;
-(IBAction)showMenu:(id)sender;

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;
-(void) thrust: (id) sender;

-(void)loadLevel:(NSString *)name;
-(void)addEnemys:(NSMutableArray *)list;
-(void)addClouds;

-(void)showExplosion:(CGPoint)location;
-(void)addPoints:(int)p location:(CGPoint)point;
-(void)addDamage:(int)p location:(CGPoint)point;
-(void)addBonus:(NSMutableArray *)list;

-(void)levelComplete;

-(IBAction)showWindow1:(id)sender;
-(IBAction)hideWindow1:(id)sender;

-(IBAction)showDeadWindow:(id)sender;
-(IBAction)hideDeadWindow:(id)sender;

-(void)initStuff;
-(void)resetLevel;
-(IBAction)restartLevel:(id)sender;
-(IBAction)showTraining:(id)sender;

-(IBAction)trainingNext:(id)sender;
-(void)unlockLevel:(NSString *)name;

-(IBAction)showPauseWindow:(id)sender;
-(IBAction)hidePauseWindow:(id)sender;
-(void)pause;
-(void)unpause;

-(IBAction)showOptions:(id)sender;
-(IBAction)hideOptions:(id)sender;
-(IBAction)hideHighScores:(id)sender;
-(IBAction)showHighScores:(id)sender;

-(void)applyBonus:(int)b obj:(PFObject *)obj;
-(void)removeBonus;
-(void)keyTimer:(NSTimer *)timer;
-(void)initFirst;

-(IBAction)soundOptionChange:(UISwitch *)sender;
-(void)enemyFire:(Enemy *)enemy;
-(void)alert:(NSString *)title message:(NSString *)message;

@end

