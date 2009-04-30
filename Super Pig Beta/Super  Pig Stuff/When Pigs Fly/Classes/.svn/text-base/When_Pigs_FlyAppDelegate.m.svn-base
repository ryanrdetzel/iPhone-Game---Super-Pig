//
//  When_Pigs_FlyAppDelegate.m
//  When Pigs Fly
//
//  Created by Ryan on 10/10/08.
//  Copyright Fifth Floor Media 2008. All rights reserved.
//

#import "When_Pigs_FlyAppDelegate.h"


@implementation When_Pigs_FlyAppDelegate

@synthesize window,start,mapview;
@synthesize scrollView, mainView, viewController,player;
@synthesize enemys,playerBullets,grass1,grass2,heart;
@synthesize points,scores,lightBalls,healthBar,thrust,fire,menuButton;
@synthesize explosion1,explosion2,titleBar,window1,countryLabel,cname,levelFinished,levelDied,pauseWindow;
@synthesize background,loadingWindow,options,highscores,enemyBullets;
@synthesize greenlandButton, usaButton,togoButton,brazilButton,canadaButton,israelButton,australiaButton;
@synthesize indiaButton,norwayButton,japanButton,ethiopiaButton,tanzaniaButton,russiaButton,englandButton;
@synthesize trainingWindow,trainingText,clouds,bonus,bonusTimer,thrustSwitch,soundSwitch;
@synthesize score_highscore,score_total,score_bonus,score_spheresCollected,score_aliensKilled;

#define kAccelFilt 0.1

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, 480,  320)];

	scrollView.bounces = NO;
	scrollView.showsHorizontalScrollIndicator = NO;
	scrollView.showsVerticalScrollIndicator = NO;
	
	scrollView.contentSize = CGSizeMake(19200,320);
	[scrollView setUserInteractionEnabled:NO];
		
	viewController = [[MYViewController alloc] init];
	
	[viewController setView:scrollView];
	//[viewController setView:mapview];
	
	//[scrollView addSubview:mapview];
	[window addSubview:viewController.view];
	
	newLevels = 0;
	[application setStatusBarHidden:YES];

	//highScoreList = [[NSMutableArray alloc] init];
	
	[self showMenu:self];
	
	CGAffineTransform rotate = CGAffineTransformMakeRotation(-1.57079633); ///90 degress
	
	titleBar.transform = rotate;
	[titleBar setCenter:CGPointMake(35,240)];
	[window addSubview:titleBar];
	
	window1.transform = rotate;
	[window1 setCenter:CGPointMake(200,240)];
	
	levelFinished.transform = rotate;
	[levelFinished setCenter:CGPointMake(160,240)];
	
	levelDied.transform = rotate;
	[levelDied setCenter:CGPointMake(160,240)];
	
	pauseWindow.transform = rotate;
	[pauseWindow setCenter:CGPointMake(160,240)];
	
	trainingWindow.transform = rotate;
	[trainingWindow setCenter:CGPointMake(160,240)];

	loadingWindow.transform = rotate;
	[loadingWindow setCenter:CGPointMake(160,240)];
	
	highscores.transform = rotate;
	[highscores setCenter:CGPointMake(200,240)];

	options.transform = rotate;
	[options setCenter:CGPointMake(190,240)];

	[self initFirst];
	[self initStuff];
	
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0 / 60)];
	
	//[UIView setAnimationsEnabled:NO];
	
	[application setStatusBarOrientation: UIInterfaceOrientationLandscapeLeft animated:NO];
	[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeLeft];	
	
	[NSThread detachNewThreadSelector:@selector(animate) toTarget:self withObject:nil];
    [window makeKeyAndVisible];
}

-(IBAction)showMenu:(id)sender{
	[self resetLevel];
	
	//Scroll back to zero
	[window1 removeFromSuperview];
	[options removeFromSuperview];
	[highscores removeFromSuperview];
	
	[levelFinished removeFromSuperview];
	
	[scrollView setUserInteractionEnabled:YES];
	[scrollView setContentSize:CGSizeMake(981,463)];
	[scrollView addSubview:mapview];
	[scrollView scrollRectToVisible:CGRectMake(160, 35, 480, 320) animated:NO];
	
	[window addSubview:titleBar];
	
	if (newLevels > 0){
		NSString *ss = @" has";
		if (newLevels > 1) ss = @"s have";
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"New Levels Unlocked" 
														message:[NSString stringWithFormat:@"%d new level%@ been unlocked for you to explore!",newLevels,ss] 
													   delegate:nil 
											  cancelButtonTitle:@"Okay" 
											  otherButtonTitles:nil];
		
		[alert show];
		[alert release];		
		
		newLevels = 0;
	}
}

-(IBAction)showTraining:(id)sender{
	cname = [sender currentTitle];
	[self load:self];
}

-(IBAction)hideOptions:(id)sender{
	[options removeFromSuperview];
}
-(IBAction)showOptions:(id)sender{
	[highscores removeFromSuperview];
	[window addSubview:options];
}

-(IBAction)hideHighScores:(id)sender{
	[highscores removeFromSuperview];
}
-(IBAction)showHighScores:(id)sender{
	//Generate list
	[options removeFromSuperview];
	
	[window addSubview:highscores];
	[window bringSubviewToFront:titleBar];
}

-(IBAction)hideWindow1:(id)sender{
	[window1 removeFromSuperview];
}
-(IBAction)showWindow1:(id)sender{
	cname = [sender currentTitle];
	NSString *realName = @"";
	
	if ([cname isEqualToString:@"usa"])	realName = @"United States"; 
	else if ([cname isEqualToString:@"england"])	realName = @"England"; 
	else if ([cname isEqualToString:@"brazil"])	realName = @"Brazil"; 
	else if ([cname isEqualToString:@"canada"])	realName = @"Canada"; 
	else if ([cname isEqualToString:@"ethiopia"])	realName = @"Ethiopia"; 
	else if ([cname isEqualToString:@"greenland"])	realName = @"Greenland"; 
	else if ([cname isEqualToString:@"india"])	realName = @"India"; 
	else if ([cname isEqualToString:@"israel"])	realName = @"Israel"; 
	else if ([cname isEqualToString:@"japan"])	realName = @"Japan"; 
	else if ([cname isEqualToString:@"norway"])	realName = @"Norway"; 
	else if ([cname isEqualToString:@"russia"])	realName = @"Russia"; 
	else if ([cname isEqualToString:@"tanzania"])	realName = @"Tanzania"; 
	else if ([cname isEqualToString:@"togo"])	realName = @"Togo"; 
	else if ([cname isEqualToString:@"australia"])	realName = @"Australia"; 
	
	[countryLabel setText:realName];
	[window addSubview:window1];	
}

-(IBAction)showPauseWindow:(id)sender{
	[self pause];
	[window addSubview:pauseWindow];
}

-(void)pause{
	gameRunning = NO;
}

-(IBAction)hidePauseWindow:(id)sender{
	[pauseWindow removeFromSuperview];
	[self unpause];
}

-(void)unpause{
	[start release];
	start = [NSDate date];
	[start retain];
	gameRunning = YES;
}

-(IBAction)restartLevel:(id)sender{
	[levelDied removeFromSuperview];
	[window addSubview:loadingWindow];
	
	[NSTimer scheduledTimerWithTimeInterval:(0.001) 
									 target:self 
								   selector:@selector(startLoad) 
								   userInfo:nil
									repeats:NO];
	//[self loadLevel:cname];
}

-(IBAction)load:(id)sender{
	//NSLog(@"Sender: %@",[sender currentTitle]);
	
	if ([cname isEqualToString:@"training"]){
		//
	}
	else{
		difficulty = 1;
		if ([[sender currentTitle] isEqualToString:@"Normal"]){
			difficulty = 2;
		}
		else if ([[sender currentTitle] isEqualToString:@"Hard"]){
			difficulty = 3;
		}
	}
	
	[titleBar removeFromSuperview];
	[self hideWindow1:self];
	
	[scrollView setContentSize:CGSizeMake(19200,320)];
	[viewController setView:scrollView];
	
	[window addSubview:loadingWindow];
	
	[NSTimer scheduledTimerWithTimeInterval:(0.001) 
									 target:self 
								   selector:@selector(startLoad) 
								   userInfo:nil
									repeats:NO];
	
}

-(void)startLoad{
	[self loadLevel:cname];
}

-(void)resetLevel{
	[mainView removeFromSuperview];
	[mainView release];
	
	[grass1 removeFromSuperview];
	[grass2 removeFromSuperview];
	[background removeFromSuperview];
	
	[player removeFromSuperview];
	[fire removeFromSuperview];
	[thrust removeFromSuperview];
	[menuButton removeFromSuperview];
	
	[points removeFromSuperview];
	[heart removeFromSuperview];
	[healthBar removeFromSuperview];
	
	[pauseWindow removeFromSuperview];
	[levelDied removeFromSuperview];
}

//Should only call once stuff
-(void)initStuff{
	playerBullets = [[NSMutableArray alloc] init];
	enemyBullets = [[NSMutableArray alloc] init];
	enemys = [[NSMutableArray alloc] init];
	clouds = [[NSMutableArray alloc] init];
	bonus = [[NSMutableArray alloc] init];
	
	CGAffineTransform rotate = CGAffineTransformMakeRotation(-1.57079633);

	
	grass1 = [[PFObject alloc] init:@"grass2.png" x:0 y:0 isStatic:YES type:GRASS];
	grass2 = [[PFObject alloc] init:@"grass2.png" x:480 y:0 isStatic:YES type:GRASS];
	background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)];
	
	player = [[Pig alloc] init];
	
	/* Add buttons */
	thrust = [UIButton buttonWithType: UIButtonTypeCustom];
	[thrust setBackgroundImage:[UIImage imageNamed:@"thrustUp.png"] forState:UIControlStateNormal];
	[thrust setBackgroundImage:[UIImage imageNamed:@"thrustDown.png"] forState:UIControlStateHighlighted];
	[thrust setFrame:CGRectMake(255, 420, 70, 67)];
	[thrust setAlpha:0.80];
	[thrust addTarget: self action: @selector(thrust:) forControlEvents: UIControlEventTouchDown];
	[thrust addTarget: self action: @selector(thrustStop:) forControlEvents: UIControlEventTouchUpInside]; 
	[thrust addTarget: self action: @selector(thrustStop:) forControlEvents: UIControlEventTouchUpOutside]; 
	[thrust retain];
	
	fire = [UIButton buttonWithType: UIButtonTypeCustom];
	[fire setBackgroundImage:[UIImage imageNamed:@"fireUp.png"] forState:UIControlStateNormal];
	[fire setBackgroundImage:[UIImage imageNamed:@"fireDown.png"] forState:UIControlStateHighlighted];
	[fire setFrame:CGRectMake(255, -5, 70, 67)];
	[fire setAlpha:0.80];
	[fire addTarget: self action: @selector(fire:) forControlEvents: UIControlEventTouchDown];
	[fire retain];

	menuButton = [UIButton buttonWithType: UIButtonTypeCustom];
	[menuButton setImage:[UIImage imageNamed:@"homeButton.png"] forState:UIControlStateNormal];
	//[menuButton setBackgroundImage:[UIImage imageNamed:@"fireDown.png"] forState:UIControlStateHighlighted];
	//[menuButton setBackgroundColor:[UIColor whiteColor]];
	[menuButton setFrame:CGRectMake(-5, 10, 40, 35)];
	[menuButton setAlpha:0.80];
	[menuButton addTarget: self action: @selector(showPauseWindow:) forControlEvents: UIControlEventTouchDown];
	[menuButton retain];
	menuButton.transform = rotate;
	
	/* Labels */
	points = [[UILabel alloc] init];
	[points setText:@"Points: 0"];
	[points setFrame:CGRectMake(-35, 150, 100, 30)];
	[points setTextAlignment:UITextAlignmentRight];
	[points setFont:[UIFont fontWithName:@"Marker Felt" size:18]];
	[points setTextColor:[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1]];
	[points setBackgroundColor:[UIColor clearColor]];
	
	points.transform = rotate;
	
	scores = [[NSMutableArray alloc] init];
	lightBalls = [[NSMutableArray alloc] init];

	heart = [[UIImageView alloc] initWithFrame:CGRectMake(2, 450, 25, 25)];
	[heart setImage:[UIImage imageNamed:@"heart.png"]];
	
	//heart = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"heart.png"]];
	//[heart setFrame:CGRectMake(295, 10, 20, 20)];
	heart.transform = rotate;
	
	healthBar = [[HealthBar alloc] initWithFrame:CGRectMake(-35, 390, 100, 15)];
	//healthBar.backgroundColor = [UIColor redColor];
	healthBar.transform = rotate;
	
	[self showExplosion:CGPointMake(100,100)];
	
	newLevels = 0;
	
	//Check to see which levels we should unlock
	
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"usa"])	[self unlockLevel:@"usa"];
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"brazil"])	[self unlockLevel:@"brazil"];
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"canada"])	[self unlockLevel:@"canada"];
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"england"])	[self unlockLevel:@"england"];
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"ethiopia"])	[self unlockLevel:@"ethiopia"];
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"greenland"])	[self unlockLevel:@"greenland"];
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"india"])	[self unlockLevel:@"india"];
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"israel"])	[self unlockLevel:@"israel"];
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"japan"])	[self unlockLevel:@"japan"];
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"norway"])	[self unlockLevel:@"norway"];
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"russia"])	[self unlockLevel:@"russia"];
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"tanzania"])	[self unlockLevel:@"tanzania"];
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"togo"])	[self unlockLevel:@"togo"];
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"australia"])	[self unlockLevel:@"australia"];

	//Options
	soundOn = YES;
	thrustSoundOn = YES;
	
	if (![[NSUserDefaults standardUserDefaults] boolForKey:@"soundOn"]){
			soundOn = [[NSUserDefaults standardUserDefaults] boolForKey:@"soundOn"];
			[soundSwitch setOn:NO];
	}
	if (![[NSUserDefaults standardUserDefaults] boolForKey:@"thrustSoundOn"]){
			thrustSoundOn = [[NSUserDefaults standardUserDefaults] boolForKey:@"thrustSoundOn"];
			[thrustSwitch setOn:NO];
	}
	
	//[self unlockLevel:@"usa"];
	//[self unlockLevel:@"greenland"];

	//NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	//[defaults removeObjectForKey:@"usa"];
	//[defaults removeObjectForKey:@"greenland"];
	
	AudioSessionInitialize (NULL,NULL,NULL,NULL); // just set these to NULL if you don't want a callback function
	UInt32 sessionCategory = kAudioSessionCategory_AmbientSound;
	AudioSessionSetProperty( kAudioSessionProperty_AudioCategory, sizeof( sessionCategory ), &sessionCategory );
	
	SoundEngine_Initialize(44100);
	// Assume the listener is in the center at the start. The sound will pan as the position of the rocket changes.
	//SoundEngine_SetListenerPosition(0.0, 0.0, 1.0);
	// Load each of the four sounds used in the game.
	//SoundEngine_LoadLoopingEffect([[[NSBundle mainBundle] pathForResource:@"mythrust" ofType:@"caf"] UTF8String], NULL, NULL, &_sounds[kSound_Thrust]);
	
	SoundEngine_LoadEffect([[[NSBundle mainBundle] pathForResource:@"thrust" ofType:@"wav"] UTF8String], &_sounds[kSound_Thrust]);
	SoundEngine_LoadEffect([[[NSBundle mainBundle] pathForResource:@"explosion" ofType:@"wav"] UTF8String], &_sounds[kSound_Explosion]);
	SoundEngine_LoadEffect([[[NSBundle mainBundle] pathForResource:@"hit4" ofType:@"wav"] UTF8String], &_sounds[kSound_Hit4]);
	SoundEngine_LoadEffect([[[NSBundle mainBundle] pathForResource:@"hit3" ofType:@"wav"] UTF8String], &_sounds[kSound_Hit3]);
	SoundEngine_LoadEffect([[[NSBundle mainBundle] pathForResource:@"hit2" ofType:@"wav"] UTF8String], &_sounds[kSound_Hit2]);
	SoundEngine_LoadEffect([[[NSBundle mainBundle] pathForResource:@"hit1" ofType:@"wav"] UTF8String], &_sounds[kSound_Hit1]);
	SoundEngine_LoadEffect([[[NSBundle mainBundle] pathForResource:@"ending1" ofType:@"wav"] UTF8String], &_sounds[kSound_Ending1]);
	SoundEngine_LoadEffect([[[NSBundle mainBundle] pathForResource:@"boss2" ofType:@"wav"] UTF8String], &_sounds[kSound_Boss2]);
	SoundEngine_LoadEffect([[[NSBundle mainBundle] pathForResource:@"boss1" ofType:@"wav"] UTF8String], &_sounds[kSound_Boss1]);
	SoundEngine_LoadEffect([[[NSBundle mainBundle] pathForResource:@"pig_dead" ofType:@"wav"] UTF8String], &_sounds[kSound_PigDead]);

	//afconvert -v -f "WAVE" -d "LEI16" 
	for (int x=0;x<20;x++){
		PFObject *rock1 = [[PFObject alloc] init:@"laser1.png" x:player.frame.origin.x+52 y: player.frame.origin.y+25 isStatic:NO type:ROCK];
		
		[rock1 setVelocity:CGPointMake(350,0)];
		[rock1 setEffectedByGravity:YES];
		[rock1 setStatus:DEAD];
		[enemyBullets addObject:rock1];
		[rock1 release];	
	}
	
	
	for (int x=0;x<30;x++){
		PFObject *rock1 = [[PFObject alloc] init:@"rock1.png" x:player.frame.origin.x+52 y: player.frame.origin.y+25 isStatic:NO type:ROCK];
		[rock1 setVelocity:CGPointMake(350,0)];
		[rock1 setEffectedByGravity:YES];
		[rock1 setStatus:DEAD];
		[playerBullets addObject:rock1];
		[rock1 release];	
	}
	
	for (int x=0;x<40;x++){
		PFObject *tess = [[PFObject alloc] init:@"0" x:400 y:200 isStatic:NO type:SCORE];
		[tess setStatus:DEAD];
		[tess setVelocity:CGPointMake(40,-70)];
		[scores addObject:tess];
		[tess release];
		//[scrollView addSubview:tess];
	}
	
	
	for (int x=0;x<50;x++){
		int num = (1 + random() % 5);
		PFObject *bb = [[PFObject alloc] init:[NSString stringWithFormat:@"lightBall%d.png",num] 
											x:0 
											y:0
									 isStatic:NO 
										 type:POWERBALL];
		
		float xvel = (18 + random() % 20);
		float yvel = (1 + random() % 30);
		
		if (yvel <= 10)	yvel *= -1;
		else			yvel -= 10;
		
		[bb setAlpha:0.70];
		[bb setStatus:DEAD];
		[bb setVelocity:CGPointMake(xvel,yvel)];
		[lightBalls addObject:bb];

		[bb release];
	}
}

-(void)loadLevel:(NSString *)name{
	NSLog(@"loadLevel // Begin");
	
	srand(time(NULL));

	[mapview removeFromSuperview];
	
	[fire setEnabled:YES]; //in case training disabled it
	training = NO;
	if ([cname isEqualToString:@"training"]){
		stage = 1;
		training = YES;
	}
	
	NSString *skyline = [NSString stringWithFormat:@"%@.png",name];
	NSString *backName = [NSString stringWithFormat:@"%@-back",name];
	UIImage *backImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:backName ofType:@"png"]];
	[background setImage:backImg];
	
	//[background setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@-back.png"]]];
	
	mainView = [[PFObject alloc] init:skyline x:0 y:0 isStatic:YES type:MISC]; 
	//[mainView setBackgroundColor:[UIColor colorWithRed:0.84 green:0.90 blue:0.93 alpha:1.0]];
	
	[scrollView addSubview:background];
	[scrollView addSubview:mainView];
	
	NSString *resource = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
	NSString *content = [NSString stringWithContentsOfFile:resource];
	SBJSON *json = [SBJSON new];
		
	NSDictionary *levelObj = [json objectWithString:content allowScalar:NO error:nil];
	
	[scrollView addSubview:grass1];
	[scrollView addSubview:grass2];
	
	[self addClouds];
	NSLog(@"loadLevel // Clouds loaded");
	[self addEnemys:[levelObj objectForKey:@"enemys"]];
	NSLog(@"loadLevel // Enemys loaded");
	[self addBonus:[levelObj objectForKey:@"bonus"]];
	
	[scrollView addSubview:player];
	
	[window addSubview:points];
	
	[window addSubview:fire];
	[window addSubview:thrust];
	[window addSubview:menuButton];
	
	[window addSubview:heart];
	[window addSubview:healthBar];

	[scrollView setUserInteractionEnabled:NO];
	
	[player setHealth:100];
	[healthBar setMax:100];
	[healthBar setValue:100];
	[healthBar setNeedsDisplay];

	[background setFrame:CGRectMake(0, 0, 480, 320)];
	//Reset grass
	[grass1 setFrame:CGRectMake(0, 0, 480, 320)];
	[grass2 setFrame:CGRectMake(480, 0, 480, 320)];
	
	//Reset player
	[player setFrame:CGRectMake(10, 50, 125, 80)];
	[player setVelocity:CGPointMake(0,0)];
	
	screenX = 0;
	[points setText:@"Points: 0"];

	[scrollView bringSubviewToFront:explosion1];
	[scrollView bringSubviewToFront:explosion2];

	canThrow = YES;
	NSLog(@"loadLevel // Game Running");
		
	totalPoints = 0;
	spheresCollected = 0;
	enemysKilled = 0;
	bonusCollected = 0;
	
	screenX = 0;
	slowMove = 0;
	accelX = 0;
	accelY = 0;
	RPS = 3;
	
	rockDamage = 1;
	doubleThrow = NO;
	doubleDamage = NO;
	bulletBounce = YES;
	bossSoundPlayed = NO;
	
	NSLog(@"loadLevel // Reset Time");
	[start release];
	start = [NSDate date];
	[start retain];
	NSLog(@"loadLevel // Hide Loading.");
	
	[loadingWindow removeFromSuperview];
	gameRunning = YES;
	screenMoving = YES;
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0 / 60)];
	
	for (int x=0;x<50;x++)  [[lightBalls objectAtIndex:x] setStatus:DEAD];
	for (int x=0;x<40;x++)	[[scores objectAtIndex:x] setStatus:DEAD];
	for (int x=0;x<30;x++)	[[playerBullets objectAtIndex:x] setStatus:DEAD];
	for (int x=0;x<20;x++)	[[enemyBullets objectAtIndex:x] setStatus:DEAD];
}

-(void)addClouds{
	/* add objects behind player */
	srand(time(NULL));
	//for (int x=0;x<20;x++){
		PFObject *cloud1 = [[PFObject alloc] init:@"cloud1.png" x:40  y:(1 + random() % 180) isStatic:YES type:CLOUD];
		PFObject *cloud2 = [[PFObject alloc] init:@"cloud2.png" x:170 y:(1 + random() % 180) isStatic:YES type:CLOUD];
		PFObject *cloud3 = [[PFObject alloc] init:@"cloud3.png" x:400 y:(1 + random() % 180) isStatic:YES type:CLOUD];
		
		[clouds addObject:cloud1];
		[clouds addObject:cloud2];
		[clouds addObject:cloud3];

		[scrollView addSubview:cloud1];
		[scrollView addSubview:cloud2];
		[scrollView addSubview:cloud3];
		
		[cloud1 release];
		[cloud2 release];
		[cloud3 release];
	//}
}

-(void)addDamage:(int)p location:(CGPoint)point{
	if (point.x > 0 || point.y > 0){
		for(int x=0;x<[scores count];x++){
			if ([[scores objectAtIndex:x] status] == DEAD){
				NSLog(@"Add damage %d",p);
				[[scores objectAtIndex:x] setText:[NSString stringWithFormat:@"-%d",p]];
				[[scores objectAtIndex:x] setStatus:ALIVE];
				[[scores objectAtIndex:x] setCenter:point];
				[[scores objectAtIndex:x] setNeedsDisplay];
				[[scores objectAtIndex:x] setVelocity:CGPointMake(40,+70)];
				[[scores objectAtIndex:x] setAlpha:1.0];
				[[scores objectAtIndex:x] setType:DAMAGE];

				[scrollView addSubview:[scores objectAtIndex:x]];
				
				break;
			}
		}
	}
	
	/*
	if (point.x > 0 || point.y > 0){
		//COME BACK
		PFObject *sc = [[PFObject alloc] init:[NSString stringWithFormat:@"health-%d.png",p] 
											x:point.x 
											y:point.y 
									 isStatic:NO 
										 type:0];
		[sc setVelocity:CGPointMake(40,-70)];
		
		[scores addObject:sc];
		[scrollView addSubview:sc];
	}*/
}

- (void)keyTimer:(NSTimer *)timer{
	bonusTimer = nil;
	[bonusTimer invalidate];
	[bonusTimer release];	
	
	[self removeBonus];
}

-(void)removeBonus{	
	NSLog(@"Remove Bonus");
	[player removeHat];
	RPS = 3;
	doubleThrow = NO;
	doubleDamage = NO;
	bulletBounce = YES;
}

-(void)applyBonus:(int)b obj:(PFObject *)obj{
	if (b >= 50){
		//Nothing special just points
		switch(b){
			case BONUS_FRIES: [self addPoints:25 location:CGPointMake([obj center].x,[obj center].y-15)]; break;
			//case BONUS_STRAWBERRY: [self addPoints:35 location:CGPointMake([obj center].x,[obj center].y-15)]; break;
			case BONUS_SHAKE: [self addPoints:50 location:CGPointMake([obj center].x,[obj center].y-15)]; break;
			case BONUS_HOTDOG: [self addPoints:50 location:CGPointMake([obj center].x,[obj center].y-15)]; break;
			case BONUS_HAMBURGER: [self addPoints:50 location:CGPointMake([obj center].x,[obj center].y-15)]; break;
			case BONUS_DONUT: [self addPoints:50 location:CGPointMake([obj center].x,[obj center].y-15)]; break;
			case BONUS_PIZZA: [self addPoints:50 location:CGPointMake([obj center].x,[obj center].y-15)]; break;
		}
	}
	else{
		int time = 15;
		[self removeBonus];
	
		if (b == JESTER_HAT){
			[player putHatOn:@"hat-jester"];
			[self addPoints:50 location:CGPointMake([obj center].x,[obj center].y-15)]; 
			time = 15;
			doubleThrow = YES;
		}
		else if (b == KING_HAT){
			[player putHatOn:@"hat-king"];
			[self addPoints:50 location:CGPointMake([obj center].x,[obj center].y-15)];
			time = 15;
			RPS = 7;
		}
		else if (b == PIRATE_HAT){
			[player putHatOn:@"hat-pirate"];
			[self addPoints:50 location:CGPointMake([obj center].x,[obj center].y-15)]; 
			time = 15;
			doubleDamage = YES;
			bulletBounce = NO;
		}
	
		if (bonusTimer){
			 [bonusTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:time]];
			NSLog(@"Add time");
		}
		else{
			bonusTimer = [NSTimer scheduledTimerWithTimeInterval:(time) 
										 target:self 
														selector:@selector(keyTimer:) 
									   userInfo:nil
										repeats:NO];
		}
	}
}

-(void)addPoints:(int)p location:(CGPoint)point{
	totalPoints += p;
	[points setText:[NSString stringWithFormat:@"Points: %d",totalPoints]];
	
	if (point.x > 0 || point.y > 0){
		for(int x=0;x<[scores count];x++){
			if ([[scores objectAtIndex:x] status] == DEAD){
				NSLog(@"Add score %d",p);
				[[scores objectAtIndex:x] setText:[NSString stringWithFormat:@"%d",p]];
				[[scores objectAtIndex:x] setStatus:ALIVE];
				[[scores objectAtIndex:x] setType:SCORE];
				[[scores objectAtIndex:x] setCenter:point];
				[[scores objectAtIndex:x] setNeedsDisplay];
				[[scores objectAtIndex:x] setVelocity:CGPointMake(40,-70)];
				[[scores objectAtIndex:x] setAlpha:1.0];
				
				[scrollView addSubview:[scores objectAtIndex:x]];
				
				break;
			}
		}
	}
}

-(void)addBonus:(NSMutableArray *)list{
	//	{ "ypos": 400, "xpos": 600, "velocity.x": 0,"velocity.y":0,  "type":0 }
	if (list == nil || [list count] == 0) return;
		
	for(int x=0;x<[list count];x++){
		int type = [[[list objectAtIndex:x] objectForKey:@"type"] intValue];
		float ypos = [[[list objectAtIndex:x] objectForKey:@"ypos"] floatValue];
		float xpos = [[[list objectAtIndex:x] objectForKey:@"xpos"] floatValue];
		
		NSString *imgName = @"";
		switch(type){
			case JESTER_HAT:	imgName = @"hat-jester.png";	break;
			case PIRATE_HAT:	imgName = @"hat-pirate.png";	break;
			case KING_HAT:		imgName = @"hat-king.png";		break;
			case BONUS_FRIES:	imgName = @"bonus-fries.png";	break;
			case BONUS_SHAKE:	imgName = @"bonus-shake.png";	break;
			//case BONUS_STRAWBERRY:	imgName = @"bonus-strawberry.png";	break;
			case BONUS_HOTDOG:	imgName = @"bonus-hotdog.png";	break;
			case BONUS_HAMBURGER:	imgName = @"bonus-hamburger.png";	break;
			case BONUS_PIZZA:	imgName = @"bonus-pizza.png";	break;
			case BONUS_DONUT:	imgName = @"bonus-donut.png";	break;

		}
		
		PFObject *item = [[PFObject alloc] init:imgName x:xpos y:ypos isStatic:YES type:type];
		
		[item setVelocity:CGPointMake(
									  [[[list objectAtIndex:x] objectForKey:@"velocity.x"] floatValue],
									  [[[list objectAtIndex:x] objectForKey:@"velocity.y"] floatValue]
									  )];
		
		[scrollView addSubview:item];
		[bonus addObject:item];
		[item release];
	}
		
}

-(void)addEnemys:(NSMutableArray *)list{
	
	srand(time(NULL));
	[enemys removeAllObjects];
	
	//Lets create some enemy shipts
	for(int x=0;x<[list count];x++){
		int t = [[[list objectAtIndex:x] objectForKey:@"level"] intValue];
		float ypos = [[[list objectAtIndex:x] objectForKey:@"ypos"] floatValue];
		float xpos = [[[list objectAtIndex:x] objectForKey:@"xpos"] floatValue];
		int energy = [[[list objectAtIndex:x] objectForKey:@"energy"] intValue];
		int path = [[[list objectAtIndex:x] objectForKey:@"path"] intValue];
		int agg = [[[list objectAtIndex:x] objectForKey:@"aggression"] intValue];

		if (difficulty == 2){
			path = 2;
			agg += 1;
		}
		else if (difficulty == 3){
			path = 2;
			agg = 9;
		}
		
		if (ypos < 0){
			ypos = (10 + random() % 240);
		}
		
		Enemy *ship = [[Enemy alloc] init:t x:xpos y:ypos isStatic:NO path:path difficulty:difficulty];
		[ship setVelocity:CGPointMake(
									  [[[list objectAtIndex:x] objectForKey:@"velocity.x"] floatValue],
									  [[[list objectAtIndex:x] objectForKey:@"velocity.y"] floatValue]
		 )];
		[ship setEnergy:energy];
		[ship setAggressionLevel:agg];
		
		[enemys addObject:ship];
		[scrollView addSubview:ship];
		[ship release];
	}
	[[enemys objectAtIndex:0] setStatus:ALIVE];
}

-(void)canThrow{
	canThrow = YES;
}

-(void) fire:(id)sender{
	if (!gameRunning) return;
		
	if (!canThrow){
		return;
	}
		
	if (training && stage == 11){
		rocksThrown++;
	}
	
	//Find a dead one and make it alive
	int x =0;
	int found = 0;
	int toFind = 1;
	if (doubleThrow) toFind = 2;
	
	while (found < toFind && x < [playerBullets count]){
		if ([[playerBullets objectAtIndex:x] status] == DEAD){
			[[playerBullets objectAtIndex:x] setFrame:CGRectMake(player.frame.origin.x+58, player.frame.origin.y+52, [[playerBullets objectAtIndex:x] size].width, [[playerBullets objectAtIndex:x] size].height)];
			[[playerBullets objectAtIndex:x] setStatus:ALIVE];
			[[playerBullets objectAtIndex:x] setVelocity:CGPointMake(350,0)];
			if (found == 1)	[[playerBullets objectAtIndex:x] setVelocity:CGPointMake(350,-55)];
			[scrollView addSubview:[playerBullets objectAtIndex:x]];
			found++;
		}
		x++;
	}
	
	//SoundEngine_StartEffect( _sounds[kSound_Fire]);

	canThrow = NO;
	[NSTimer scheduledTimerWithTimeInterval:(1/(float)RPS) 
									 target:self 
								   selector:@selector(canThrow) 
								   userInfo:nil
									repeats:NO];
}

-(void)enemyFire:(Enemy *)enemy{
	int toFind = 1;
	int found = 0;
	int x = 0;
	
	while (found < toFind && x < [enemyBullets count]){
		if ([[enemyBullets objectAtIndex:x] status] == DEAD){
			[[enemyBullets objectAtIndex:x] setFrame:CGRectMake(enemy.frame.origin.x+45, enemy.frame.origin.y+60, [[enemyBullets objectAtIndex:x] size].width, [[enemyBullets objectAtIndex:x] size].height)];
			[[enemyBullets objectAtIndex:x] setStatus:ALIVE];
			[[enemyBullets objectAtIndex:x] setEffectedByGravity:NO];
			[[enemyBullets objectAtIndex:x] setVelocity:CGPointMake(-250,0)];
			[scrollView addSubview:[enemyBullets objectAtIndex:x]];
			found++;
		}
		x++;
	}
}

-(void)showExplosion:(CGPoint)location{
	
	if (explosion1 == nil){
		NSLog(@"Init Explosion");
		explosion1 = [[UIImageView alloc] init];
		explosion2 = [[UIImageView alloc] init];

		NSMutableArray *images = [[NSMutableArray alloc] init];
	
		for (int x=1;x<120;x+=5){
			NSString *name = [NSString stringWithFormat:@"explosion00%d.png",x];
			if (x < 10){
				name = [NSString stringWithFormat:@"explosion000%d.png",x];
			}
			else if (x > 99){
				name = [NSString stringWithFormat:@"explosion0%d.png",x];
			}
		
			//NSLog(@"Name: %@",name);
			
			UIImage* img1 = [UIImage imageNamed:name];
			//UIImage* img1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]];

			[images addObject:img1];
			[img1 release];
		}
	
		[explosion1 setAnimationImages:images];
		[explosion2 setAnimationImages:images];
		
		//[images release];
		
		[explosion1 setAnimationRepeatCount:1];
		[explosion2 setAnimationRepeatCount:1];
		
		[scrollView addSubview:explosion1];
		[scrollView addSubview:explosion2];
	}
	else{
		if ([explosion1 isAnimating]){
			explosion2.frame = CGRectMake(location.x-115,location.y-125, 375, 255); //250,170
			[explosion2 startAnimating];
		}
		else{
			if (![explosion2 isAnimating]){
				explosion1.frame = CGRectMake(location.x-115,location.y-125, 375, 255);
				[explosion1 startAnimating];
			}
		}
		
		if (soundOn)	SoundEngine_StartEffect( _sounds[kSound_Explosion]);
	}
}

-(void) thrustStop:(id)sender{
	[player stopThrust];
	if (soundOn)	SoundEngine_StopEffect(_sounds[kSound_Thrust], false);
}

-(void) thrust:(id)sender{
	if (gameRunning){
		[player startThrust];
		if (soundOn && thrustSoundOn)	SoundEngine_StartEffect( _sounds[kSound_Thrust]);
	}
}

-(void)unlockLevel:(NSString *)name{
	if ([name isEqualToString:@"usa"])				[usaButton setEnabled:YES];
	else if ([name isEqualToString:@"greenland"])	[greenlandButton setEnabled:YES];
	else if ([name isEqualToString:@"england"])		[englandButton setEnabled:YES];
	else if ([name isEqualToString:@"brazil"])		[brazilButton setEnabled:YES]; 
	else if ([name isEqualToString:@"canada"])		[canadaButton setEnabled:YES];
	else if ([name isEqualToString:@"ethiopia"])	[ethiopiaButton setEnabled:YES]; 
	else if ([name isEqualToString:@"india"])		[indiaButton setEnabled:YES];
	else if ([name isEqualToString:@"israel"])		[israelButton setEnabled:YES];
	else if ([name isEqualToString:@"japan"])		[japanButton setEnabled:YES];
	else if ([name isEqualToString:@"norway"])		[norwayButton setEnabled:YES];
	else if ([name isEqualToString:@"russia"])		[russiaButton setEnabled:YES];
	else if ([name isEqualToString:@"tanzania"])	[tanzaniaButton setEnabled:YES]; 
	else if ([name isEqualToString:@"togo"])		[togoButton setEnabled:YES];
	else if ([name isEqualToString:@"australia"])	[australiaButton setEnabled:YES];
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:@"1" forKey:name];
}
-(void)stopBlinking{
	[player setBlinking:NO];
}

- (void) updateDisplay {
		
	if (gameRunning){
		elapsed = [start timeIntervalSinceNow] * -1;	
		[start release];
		start = [NSDate date];
		[start retain];
		
		/* TRAINING */
		if (training){
			if (stage == 1){
				//Nothing, it's pre-loaded
				[self pause];
				[window addSubview:trainingWindow];
			}
			else if (stage == 2){
				[self pause];
				trainingText.text = @"The first thing we need to learn is how to move Super Pig around.  To move Super Pig up you must press and hold the 'Thrust' button located in the bottom left of the screen. The longer you hold the thrust button the higher Super Pig will fly. To move Super Pig down release the thrust button and gravity will pull him down. \n\nTo complete this lesson fly Super Pig to the top of the screen then back down.";
			}
			else if (stage == 3){
				[fire setEnabled:NO];
				[self unpause];
				[trainingWindow removeFromSuperview];
				stage = 4;
				oneComplete = NO;
				
				//[player setFrame:CGRectMake(10, 50, 111, 55)];
				[player setFrame:CGRectMake(10, 50, 125, 80)];

				[player setVelocity:CGPointMake(0,0)];
			}
			else if (stage == 4){
				//Check to see if they've completed this stage
				if ([player frame].origin.y < 50){
					oneComplete = YES;
				}
				if ([player frame].origin.y > 220 && oneComplete){
					stage++;
				}
			}
			else if (stage == 5){
				[self pause];
				trainingText.text = @"Great! Super Pig can move left and right too. To move Super Pig to the right simply tilt your iPhone/iTouch to the right and to move Super Pig to the left tilt your iPhone/iTouch to the left. The more you tilt the faster Super Pig will fly.\n\nTo complete this lesson move Super Pig all the way to the right and then back to the left.";
				[window addSubview:trainingWindow];
			}
			else if (stage == 6){
				[fire setEnabled:NO];
				[self unpause];
				[trainingWindow removeFromSuperview];		
				oneComplete = NO;
				stage = 7;
				//[player setFrame:CGRectMake(10, 50, 111, 55)];
				[player setFrame:CGRectMake(10, 50, 125, 80)];
				[player setVelocity:CGPointMake(0,0)];
			}
			else if (stage == 7){
				#if TARGET_IPHONE_SIMULATOR == 1
				stage++;
				#endif
				//NSLog(@"Position: %f",[player frame].origin.x);
				if ([player frame].origin.x > screenX + 330){
					oneComplete = YES;
				}
				if ([player frame].origin.x < screenX + 50 && oneComplete){
					stage++;
				}
			}
			else if (stage == 8){
				[self pause];
				trainingText.text = @"Now that you can move Super Pig around it's time to learn how to use his weapon. Super Pig is equipped with a state of the art Pebble Thrower which you can use to crush the alien invaders.";
				[window addSubview:trainingWindow];
			}
			else if (stage == 9){
				[self pause];
				trainingText.text = @"You can fire Super Pig's Pebble Thrower by pressing the 'Fire' button located in the bottom right of the screen.  By default Super Pig can throw three rocks a second but this can change with bonus items found through out the levels. You will also notice that rocks are effected by gravity so you will have to learn how to aim correctly.\n\nThrow 15 rocks to complete this lesson.";
			}
			else if (stage == 10){
				[fire setEnabled:YES];
				[self unpause];
				[trainingWindow removeFromSuperview];		
				rocksThrown = 0;
				stage = 11;		
				//[player setFrame:CGRectMake(10, 50, 111, 55)];
				[player setFrame:CGRectMake(10, 50, 125, 80)];

				[player setVelocity:CGPointMake(0,0)];
			}
			else if (stage == 11){
				if (rocksThrown >= 15){
					stage = 12;
				}
			}
			else if (stage == 12){
				[self pause];
				trainingText.text = @"Awesome!  Now, let's try and hit some alien scum!\n\nDestroy the two alien ships to complete this level.";
				[window addSubview:trainingWindow];
			}
			else if (stage == 13){
				rocksThrown = 0; //enemys
				[self unpause];
				[trainingWindow removeFromSuperview];	
				
				Enemy *ship = [[Enemy alloc] init:1 x:screenX + 300 y:100 isStatic:NO path:UPDOWN1 difficulty:1];
				[ship setVelocity:CGPointMake(-2,-2)];
				[ship setEnergy:2];
				[enemys addObject:ship];
				[scrollView addSubview:ship];
				[ship release];
				
				ship = [[Enemy alloc] init:1 x:screenX + 320 y:220 isStatic:NO path:UPDOWN1 difficulty:1];
				[ship setVelocity:CGPointMake(-2,-2)];
				[ship setEnergy:2];
				[enemys addObject:ship];
				[scrollView addSubview:ship];
				
				[ship release];
				
				//[player setFrame:CGRectMake(10, 50, 111, 55)];
				[player setFrame:CGRectMake(10, 50, 125, 80)];

				[player setVelocity:CGPointMake(0,0)];
				stage = 14;
			}
			else if (stage == 14){
				if (rocksThrown >= 2){
					stage = 15;
				}
			}
			else if (stage == 15){
				[self pause];
				trainingText.text = @"Great job, you might have noticed when you destroyed an alien ship that some glowing balls were released. These balls are called 'Energy Spheres' and they are what give the aliens their power. Super Pig can collect these Energy Spheres to gain extra points but they are optional and they will fade away after a certain amount of time so you have to be quick if you plan on collecting them.";
				[window addSubview:trainingWindow];
			}
			else if (stage == 16){
				[self pause];
				trainingText.text = @"Each level will have a big bad boss at the end too. This alien ship must be destroyed to beat the level and they are usually much harder than normal alien ships so be careful. Once you've destoyed the boss he will drop a large Energy Sphere, collect this energy sphere to complete the level.\n\nDestroy this easy Boss and collect his energy sphere to complete this lesson.";
			}
			else if (stage == 17){
				oneComplete = NO;
				[self unpause];
				[trainingWindow removeFromSuperview];	
				
				Enemy *ship = [[Enemy alloc] init:10 x:screenX + 300 y:100 isStatic:NO path:UPDOWN1 difficulty:1];
				[ship setVelocity:CGPointMake(-2,-2)];
				[ship setEnergy:10];
				[ship setHealth:6];
				[enemys addObject:ship];
				[scrollView addSubview:ship];
				[ship release];
				
				stage = 18;
				
				//[player setFrame:CGRectMake(10, 50, 111, 55)];
				[player setFrame:CGRectMake(10, 50, 125, 80)];

				[player setVelocity:CGPointMake(0,0)];
			}
			else if (stage == 18){
				//check to see if we have the sphere
				#if TARGET_IPHONE_SIMULATOR == 1
				stage++;
				#endif
				if (oneComplete){
					stage++;
				}
			}
			else if (stage == 19){
				[self pause];
				trainingText.text = @"Well, that's all you need to know to play Super Pig and I hope you're ready because there are plently of aliens to destroy! Oh, one more thing. You will notice bonus items on every level, try to collect as many of these as you can...some offer bonus items that will help you destroy aliens and other will give you bonus points. Good luck!";
				[window addSubview:trainingWindow];
			}
			else if (stage == 20){
				[self pause];

				if (![[NSUserDefaults standardUserDefaults] stringForKey:@"usa"]){
					[self unlockLevel:@"usa"];
					newLevels++;
				}
				if (![[NSUserDefaults standardUserDefaults] stringForKey:@"greenland"]){
					[self unlockLevel:@"greenland"];
					newLevels++;
				}
				
				training = NO;
				[trainingWindow removeFromSuperview];
				[self showMenu:self];
				
				return;
			}
		}
		
		if (screenMoving){
			float speed = 2;
		
			screenX+=speed;
			slowMove+=speed/20;
			
			[background setCenter:CGPointMake(background.center.x+speed,background.center.y)];
		}
		
		[mainView setFrame:CGRectMake(screenX - slowMove, 0, [mainView frame].size.width, 320)];
		[scrollView scrollRectToVisible:CGRectMake(screenX, 0, 480, 320) animated:NO];
		
		//Move grass
		if ([grass1 frame].origin.x + 480 < screenX){
			[grass1 setFrame:CGRectMake([grass2 frame].origin.x + 480,0,480,320)];
		}
		else if ([grass2 frame].origin.x + 480 < screenX){
			[grass2 setFrame:CGRectMake([grass1 frame].origin.x + 480,0,480,320)];
		}
		
		for(int x=0;x<[enemys count];x++){
			//See if we should activate enemies			
			[[enemys objectAtIndex:x] update:elapsed screenX:screenX player:player];
	
			if ([[enemys objectAtIndex:x] shouldFire]){
				[[enemys objectAtIndex:x] setShouldFire:NO];
				[self enemyFire:[enemys objectAtIndex:x]];
			}
			
			BOOL noBalls = NO;
			if (!bossSoundPlayed && [[enemys objectAtIndex:x] boss]){
				if ([[enemys objectAtIndex:x] frame].origin.x <= screenX + 480 + 150){
					bossSoundPlayed = YES;
					if (soundOn){
						int num = (1 + random() % 10);
						if (num <= 5)	SoundEngine_StartEffect( _sounds[kSound_Boss1]);
						else			SoundEngine_StartEffect( _sounds[kSound_Boss2]);
					}
				}
			}
			
			if ([[enemys objectAtIndex:x] status] == PENDING) continue;
						
			//Check for player collision?
			if ([player checkCollisionWithObject:[enemys objectAtIndex:x]]){
				//Doesn't work for the boss
				//NSLog(@"Hit object %d -- Total: %d",x,[enemys count]);
				if ([[enemys objectAtIndex:x] energy] < 10){
					[[enemys objectAtIndex:x] setHealth:0];
				}
				else{
					[[enemys objectAtIndex:x] setVelocity:CGPointMake(70,[[enemys objectAtIndex:x] velocity].y)];
					[[enemys objectAtIndex:x] setCenter:CGPointMake([[enemys objectAtIndex:x] center].x + 100,[[enemys objectAtIndex:x] center].y)];
				}
				
				SoundEngine_Vibrate();
				[player takeDamage:25];
				[self addDamage:25 location:CGPointMake(player.center.x,player.center.y+40)];
				[healthBar setValue:[player health]];
				[healthBar setNeedsDisplay];
				noBalls = YES;
				
				[player setBlinking:YES];
				[NSTimer scheduledTimerWithTimeInterval:(4) 
												 target:self 
											   selector:@selector(stopBlinking) 
											   userInfo:nil
												repeats:NO];
			}
			
			int b_index = [[enemys objectAtIndex:x] checkCollision:playerBullets];
			if (b_index >= 0){
				int dmg = rockDamage;
				if (doubleDamage){
					dmg *= 2;
				}
				
				//int hitNum = (1 + random() % 4);
				if (soundOn)	SoundEngine_StartEffect( _sounds[kSound_Hit2]);

				[[enemys objectAtIndex:x] hit:dmg];
				
				if (bulletBounce){
					[[playerBullets objectAtIndex:b_index] setVelocity:CGPointMake(-2,30)];
				}
				else{
					[[playerBullets objectAtIndex:b_index] setCenter:CGPointMake(0,340)];
				}
				[[playerBullets objectAtIndex:b_index] setStatus:DEAD];
 
			}
			
			if ([[enemys objectAtIndex:x] health] <= 0){
				enemysKilled++;
				
				//TESTING HAT
				//[player putHatOn:@"hat-jester" time:5];
				//[self applyBonus:KING_HAT];
				
				int pvalue = [[enemys objectAtIndex:x] points];
				
				if (training && stage == 14) rocksThrown++;
				
				[self addPoints:pvalue location:CGPointMake([[enemys objectAtIndex:x] frame].origin.x+50,[[enemys objectAtIndex:x] frame].origin.y)];
				
				if (difficulty == 2){
					[self addPoints:50 location:CGPointMake([[enemys objectAtIndex:x] frame].origin.x+100,[[enemys objectAtIndex:x] frame].origin.y+20)];
				}
				else if (difficulty == 3){
					[self addPoints:50 location:CGPointMake([[enemys objectAtIndex:x] frame].origin.x+100,[[enemys objectAtIndex:x] frame].origin.y+20)];
					[self addPoints:50 location:CGPointMake([[enemys objectAtIndex:x] frame].origin.x,[[enemys objectAtIndex:x] frame].origin.y+20)];

				}
				
				if ([[enemys objectAtIndex:x] energy] == 10){ //BOSS
					NSLog(@"Enemy boss destoyed");
					
					float xpos = [[enemys objectAtIndex:x] frame].origin.x;
					if (xpos > screenX + 460) xpos = screenX + 460;
					
					PFObject *bb = [[PFObject alloc] init:@"sphere-blue.png" 
														x: xpos
														y:[[enemys objectAtIndex:x] frame].origin.y 
												 isStatic:NO 
													 type:SPHERE];	
					[bb setAlpha:0.70];
					[bb setEffectedByGravity:YES];
					[bb setStatus:ALIVE];
					
					[lightBalls addObject:bb];
					[scrollView addSubview:bb];
					[bb release];			
					
					//Stop moving
					screenMoving = NO;
					
					#if TARGET_IPHONE_SIMULATOR == 1
					[self levelComplete];
					#endif
				}
				else{	
					if (!noBalls){
						int ballsToCreate = [[enemys objectAtIndex:x] energy];
						int created = 0;
						int e = 0;
						
						while(created < ballsToCreate && e < [lightBalls count]){
							if ([[lightBalls objectAtIndex:e] status] == DEAD){
								
								[[lightBalls objectAtIndex:e] setStatus:ALIVE];
								[[lightBalls objectAtIndex:e] setAlpha:0.70];
								[[lightBalls objectAtIndex:e] setCenter:CGPointMake([[enemys objectAtIndex:x] frame].origin.x + (1 + random() % 15),[[enemys objectAtIndex:x] frame].origin.y + (1 + random() % 15))];
								[scrollView addSubview:[lightBalls objectAtIndex:e]];
								created++;
							}
							e++;
						}
					}
				}
				
				[self showExplosion:CGPointMake([[enemys objectAtIndex:x] frame].origin.x,[[enemys objectAtIndex:x] frame].origin.y)];

				NSLog(@"Remove enemy %d",x);
				
				[[enemys objectAtIndex:x] removeFromSuperview];
				[enemys removeObjectAtIndex:x];
			}
		}
		
		//Check if player is dead
		if ([player health] <= 0){
			[self showDeadWindow:self];
		}
		
		//Check to see if we're done
		if ([enemys count] <= 0){
			screenMoving = NO;
		}
		
		//Clouds
		for (int x=0;x<[clouds count];x++){
			if (([[clouds objectAtIndex:x] frame].origin.x + [[clouds objectAtIndex:x] frame].size.width) < screenX){
				[[clouds objectAtIndex:x] setCenter:CGPointMake(screenX + 480 + ([[clouds objectAtIndex:x] frame].size.width/2) + 2,(1 + random() % 180) )];
				[[clouds objectAtIndex:x] setAlpha:((float)(70 + random() % 30))/100];
			}
		}
		
		//Bonus Items
		for (int x=0;x<[bonus count];x++){
			
			//Check player collision
			if ([player checkCollisionWithObject:[bonus objectAtIndex:x]]){
				[self applyBonus:(int)[[bonus objectAtIndex:x] type] obj:[bonus objectAtIndex:x]];
				[[bonus objectAtIndex:x] removeFromSuperview];
				bonusCollected++;
				[bonus removeObjectAtIndex:x];
			}
			else if (([[bonus objectAtIndex:x] frame].origin.x + [[bonus objectAtIndex:x] frame].size.width) < screenX){
				[bonus removeObjectAtIndex:x];
			}
		}
		
		/* BULLETS */
		for(int x=0;x<[playerBullets count];x++){
			// continue;
			[[playerBullets objectAtIndex:x] update:elapsed screenX:screenX player:player];
			if ([[playerBullets objectAtIndex:x] status] != ALIVE) continue;
			if ([[playerBullets objectAtIndex:x] frame].origin.x > screenX + 480 || [[playerBullets objectAtIndex:x] frame].origin.y >= 320){
				[[playerBullets objectAtIndex:x] removeFromSuperview];
				//[playerBullets removeObjectAtIndex:x];
				[[playerBullets objectAtIndex:x] setStatus:DEAD];
			}
		}
		
		for(int x=0;x<[enemyBullets count];x++){
			// continue;
			[[enemyBullets objectAtIndex:x] update:elapsed screenX:screenX player:player];
			if ([[enemyBullets objectAtIndex:x] status] != ALIVE) continue;

			if ([player checkCollisionWithObject:[enemyBullets objectAtIndex:x]]){
				[player takeDamage:5];
				[self addDamage:5 location:CGPointMake(player.center.x,player.center.y+40)];
				[healthBar setValue:[player health]];
				[healthBar setNeedsDisplay];
				[[enemyBullets objectAtIndex:x] removeFromSuperview];
				[[enemyBullets objectAtIndex:x] setStatus:DEAD];
				SoundEngine_Vibrate();
				continue;
			}

			if ([[enemyBullets objectAtIndex:x] frame].origin.x < screenX || [[enemyBullets objectAtIndex:x] frame].origin.y >= 320){
				[[enemyBullets objectAtIndex:x] removeFromSuperview];
				[[enemyBullets objectAtIndex:x] setStatus:DEAD];
			}
		}
		
		for (int x=0;x<[scores count];x++){
			if ([[scores objectAtIndex:x] status] == DEAD) continue;
			
			[[scores objectAtIndex:x] setAlpha:[[scores objectAtIndex:x] alpha]-0.03];
			
			if ([[scores objectAtIndex:x] alpha] <= 0){
				[[scores objectAtIndex:x] removeFromSuperview];
				[[scores objectAtIndex:x] setStatus:DEAD];
				//[scores removeObjectAtIndex:x];
			}
			else{
				[[scores objectAtIndex:x] update:elapsed screenX:screenX player:player];
			}
		}
		
		/* LIGHT BALSL */
		for (int x=0;x<[lightBalls count];x++){
			if ([[lightBalls objectAtIndex:x] status] == DEAD) continue;
			
			if ((int)[[lightBalls objectAtIndex:x] type] == POWERBALL){
				[[lightBalls objectAtIndex:x] setAlpha:[[lightBalls objectAtIndex:x] alpha]-0.002];
			}
			
			if ([[lightBalls objectAtIndex:x] alpha] <= 0){
				//[lightBalls removeObjectAtIndex:x];
				[[lightBalls objectAtIndex:x] setStatus:DEAD];
				[[lightBalls objectAtIndex:x] removeFromSuperview];
			}
			else{
				[[lightBalls objectAtIndex:x] update:elapsed screenX:screenX player:player];
				
				if ([player checkCollisionWithObject:[lightBalls objectAtIndex:x]]){
					spheresCollected++;
					if ((int)[[lightBalls objectAtIndex:x] type] == POWERBALL){
						int pv = [[lightBalls objectAtIndex:x] alpha] * 100;
						pv = (pv / 10) * 10;
						if (pv < 10) pv = 10;
						if (pv > 50) pv = 50;
					
						[self addPoints:pv location:CGPointMake([[lightBalls objectAtIndex:x] center].x,[[lightBalls objectAtIndex:x] center].y)];
					}
					else if ((int)[[lightBalls objectAtIndex:x] type] == SPHERE){
						[self addPoints:125 location:CGPointMake([[lightBalls objectAtIndex:x] center].x,[[lightBalls objectAtIndex:x] center].y)];
						if (training && stage == 18){
							oneComplete = YES;
						}
						else{
							[self levelComplete];
						}
					}
					
					[[lightBalls objectAtIndex:x] removeFromSuperview];
					[[lightBalls objectAtIndex:x] setStatus:DEAD];
					//[lightBalls removeObjectAtIndex:x];
				}
			}
		}
		[player update:elapsed screenX:screenX];
	}
}

-(IBAction)hideDeadWindow:(id)sender{
	[levelDied removeFromSuperview];
}

-(IBAction)showDeadWindow:(id)sender{
	SoundEngine_StartEffect( _sounds[kSound_PigDead]);
	gameRunning = NO;
	[window addSubview:levelDied];
}

-(void)showFinalWindow{
	gameRunning = NO;
	[window addSubview:levelFinished];
		
	//newLevels = 1;
	
	if ([cname isEqualToString:@"usa"]){	
		if (![[NSUserDefaults standardUserDefaults] stringForKey:@"togo"]){
			[self unlockLevel:@"togo"];
			newLevels = 1;
		}
	}
	else if ([cname isEqualToString:@"greenland"]){
		if (![[NSUserDefaults standardUserDefaults] stringForKey:@"norway"]){
			[self unlockLevel:@"norway"];
			newLevels = 1;
		}	
	}
	else if ([cname isEqualToString:@"brazil"]){
		if (![[NSUserDefaults standardUserDefaults] stringForKey:@"canada"]){
			[self unlockLevel:@"canada"];
			newLevels = 1;
		}
	}
	else if ([cname isEqualToString:@"canada"]){
		if (![[NSUserDefaults standardUserDefaults] stringForKey:@"israel"]){
			[self unlockLevel:@"israel"];
			newLevels = 1;
		}
	}
	else if ([cname isEqualToString:@"ethiopia"]){
		if (![[NSUserDefaults standardUserDefaults] stringForKey:@"tanzania"]){
			[self unlockLevel:@"tanzania"];
			newLevels = 1;
		}
	}
	else if ([cname isEqualToString:@"israel"])	{
		if (![[NSUserDefaults standardUserDefaults] stringForKey:@"australia"]){
			[self unlockLevel:@"australia"];
			newLevels = 1;
		}
	}
	else if ([cname isEqualToString:@"japan"]){
		if (![[NSUserDefaults standardUserDefaults] stringForKey:@"ethiopia"]){
			[self unlockLevel:@"ethipoia"];
			newLevels = 1;
		}
	}
	else if ([cname isEqualToString:@"norway"])	{
		if (![[NSUserDefaults standardUserDefaults] stringForKey:@"japan"]){
			[self unlockLevel:@"japan"];
			newLevels = 1;
		}
	}
	else if ([cname isEqualToString:@"russia"])	{
		if (![[NSUserDefaults standardUserDefaults] stringForKey:@"england"]){
			[self unlockLevel:@"england"];
			newLevels = 1;
		}
	}
	else if ([cname isEqualToString:@"tanzania"]){
		if (![[NSUserDefaults standardUserDefaults] stringForKey:@"russia"]){
			[self unlockLevel:@"russia"];
			newLevels = 1;
		}
	}
	else if ([cname isEqualToString:@"togo"]){
		if (![[NSUserDefaults standardUserDefaults] stringForKey:@"brazil"]){
			[self unlockLevel:@"brazil"];
			newLevels = 1;
		}
	}
	else if ([cname isEqualToString:@"australia"]){
		if (![[NSUserDefaults standardUserDefaults] stringForKey:@"india"]){
			[self unlockLevel:@"india"];
			newLevels = 1;
		}
	}
	else if ([cname isEqualToString:@"england"]){
		//[self unlockLevel:@"togo"];
	}
	else if ([cname isEqualToString:@"india"]){
		//[self unlockLevel:@"togo"];
	}

	NSLog(@"Level Complete");
	
	/* update scores */
	int highScore = 0;
	if ([[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"%@-highscore",cname]]){
		highScore = [[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"%@-highscore",cname]];
	}
	
	if (totalPoints > highScore){
		highScore = totalPoints;
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		[defaults setInteger:highScore forKey:[NSString stringWithFormat:@"%@-highscore",cname]];
	}
	
	[score_total setText:[NSString stringWithFormat:@"%d",totalPoints]];
	[score_highscore setText:[NSString stringWithFormat:@"%d",highScore]];

	[score_aliensKilled setText:[NSString stringWithFormat:@"%d",enemysKilled]];
	[score_spheresCollected setText:[NSString stringWithFormat:@"%d",spheresCollected]];
	[score_bonus setText:[NSString stringWithFormat:@"%d",bonusCollected]];	
}

-(void)levelComplete{
	if (soundOn)	SoundEngine_StartEffect( _sounds[kSound_Ending1]);

	[NSTimer scheduledTimerWithTimeInterval:(2) 
									 target:self 
								   selector:@selector(showFinalWindow) 
								   userInfo:nil
									repeats:NO];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {	
	//NSLog(@"Accel: %f, %f, %f",acceleration.x,acceleration.y,acceleration.z);

	if (gameRunning){
		if (training && stage == 2) return;
		
		accelX = (acceleration.x * kAccelFilt) + (accelX * (1.0 - kAccelFilt));
		accelY = (acceleration.y * kAccelFilt) + (accelY * (1.0 - kAccelFilt));
		accelZ = (acceleration.z * kAccelFilt) + (accelZ * (1.0 - kAccelFilt));

		
		int val = 550;
		if (accelY > 0) val = 750;
		float velx = (accelY-0.05) * val;

		[player setVelocity:CGPointMake(velx,player.velocity.y)];
	}	
}

-(void)animate{
	NSAutoreleasePool* p = [[NSAutoreleasePool alloc] init];
	
	[NSThread setThreadPriority:1];
	
	while(1){
		[NSThread sleepForTimeInterval:0.033];
		//[NSThread sleepForTimeInterval:0.0166666667];

		[self performSelectorOnMainThread:@selector(updateDisplay) withObject:nil waitUntilDone:YES];
	}
	
	[p release];
}

-(void)initFirst{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		
	if ([defaults boolForKey:@"hasBeenInit"]) return;
	
	[defaults setBool:YES forKey:@"soundOn"];
	[defaults setBool:YES forKey:@"thrustSoundOn"];
	[defaults setBool:YES forKey:@"hasBeenInit"];
	[defaults synchronize];
	
	NSLog(@"Setup first");
}

-(IBAction)soundOptionChange:(UISwitch *)sender{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	if (sender.tag == 0){
		[defaults setBool:sender.on forKey:@"soundOn"];
		soundOn = sender.on;
	}
	else{
		[defaults setBool:sender.on forKey:@"thrustSoundOn"];
		thrustSoundOn = sender.on;
	}
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 14;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	//NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{	
	NSUInteger index = [indexPath indexAtPosition:1];
	NSString *myId = [NSString stringWithFormat:@"id%d",index];
	
	UILabel *name;
	UILabel *score;
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myId];

	if (cell == nil){
		//cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:myId] autorelease];
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 440, 20)  reuseIdentifier:myId] autorelease];
		[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
		
		name = [[[UILabel alloc] initWithFrame:CGRectMake(4,9, 300, 20)] autorelease];
		name.tag = 1;
		[name setBackgroundColor:[UIColor clearColor]];
		name.textColor = [UIColor whiteColor];
		
		score = [[[UILabel alloc] initWithFrame:CGRectMake(308,9, 120, 20)] autorelease];
		score.tag = 2;
		[score setBackgroundColor:[UIColor clearColor]];
		score.textColor = [UIColor whiteColor];
		[score setTextAlignment:UITextAlignmentRight];
		
		[cell.contentView addSubview:name];
		[cell.contentView addSubview:score];
	}
	else{
		name = (UILabel *)[cell.contentView viewWithTag:1];
		score = (UILabel *)[cell.contentView viewWithTag:2];
	}

	switch (index) {
		case 13:
			[name setText:@"United States"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"usa-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"usa-highscore"]]];
			else	[score setText:@"0"];
		break;
		case 1:
			[name setText:@"Brazil"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"brazil-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"brazil-highscore"]]];
			else	[score setText:@"0"];
			break;
		case 2:
			[name setText:@"Canada"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"canada-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"canada-highscore"]]];
			else	[score setText:@"0"];
			break;
		case 3:
			[name setText:@"England"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"england-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"england-highscore"]]];
			else	[score setText:@"0"];
			break;
		case 4:
			[name setText:@"Ethiopia"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"ethiopia-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"ethiopia-highscore"]]];
			else	[score setText:@"0"];
			break;
		case 5:
			[name setText:@"Greenland"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"greenland-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"greenland-highscore"]]];
			else	[score setText:@"0"];
			break;
		case 6:
			[name setText:@"India"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"india-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"india-highscore"]]];
			else	[score setText:@"0"];
			break;
		case 7:
			[name setText:@"Irsael"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"israel-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"israel-highscore"]]];
			else	[score setText:@"0"];
			break;
		case 8:
			[name setText:@"Japan"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"japan-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"japan-highscore"]]];
			else	[score setText:@"0"];
			break;
		case 9:
			[name setText:@"Norway"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"norway-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"norway-highscore"]]];
			else	[score setText:@"0"];
			break;
		case 10:
			[name setText:@"Russia"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"russia-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"russie-highscore"]]];
			else	[score setText:@"0"];
			break;
		case 11:
			[name setText:@"Tanzania"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"tanzania-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"tanzania-highscore"]]];
			else	[score setText:@"0"];
			break;
		case 12:
			[name setText:@"Togo"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"togo-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"togo-highscore"]]];
			else	[score setText:@"0"];
			break;
		case 0:
			[name setText:@"Australia"];
			if ([[NSUserDefaults standardUserDefaults] integerForKey:@"australia-highscore"])	[score setText:[NSString stringWithFormat:@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"australia-highscore"]]];
			else	[score setText:@"0"];
			break;
		default:
			[name setText:@"-"];
			[score setText:@"-"];
			break;
	}
	
	return cell;
}

-(void)clearDefaults{
	//NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	//if (sender.tag == 0){
	//	[defaults setBool:sender.on forKey:@"soundOn"];
}

- (void)didReceiveMemoryWarning {
	NSLog( @"didReceiveMemoryWarning..." );
}

- (void)applicationWillResignActive:(UIApplication *)application{
	[self showPauseWindow:self];
}

-(IBAction)trainingNext:(id)sender{
	//Next step
	stage++;
	gameRunning = YES;
}
			
- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
