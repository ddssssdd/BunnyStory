//
//  PageBase.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#define AREAWIDTH 150


#import "PageBase.h"
#import "MoveSprite.h"
#import "MusicManager.h"
#import "PageStart.h"
#import "PageSettings.h"

#define AutoPagingAfterSeconds 25
#define SETTINGS_TAG 901
#define TEXT_TAG 902

@implementation PageBase
-(id)init
{
    if ((self=[super init]))
    {
        [[MusicManager sharedManager] stopEffects];
        _pageNo=0;
        _story_index = -1;
        _hasBackHomeButton = NO;
        _isAutoPaging =[[MusicManager sharedManager] isAutoPaging];
        textPoint=CGPointMake(512, 80);
        
        backbuttonName1 = @"backbutton-1.png";
        backbuttonName2 = @"backbutton-2.png";
        [self initScreen];
        
        self.isTouchEnabled=YES;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(begin:) userInfo:nil repeats:NO];
        
        [self schedule:@selector(autoPage:) interval:AutoPagingAfterSeconds];
        
        //_pageTimer = [NSTimer scheduledTimerWithTimeInterval:AutoPagingAfterSeconds target:self selector:@selector(autoPage:) userInfo:nil repeats:NO];
        UISwipeGestureRecognizer *gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
        [gestureRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
        [[[CCDirector sharedDirector] view] addGestureRecognizer:gestureRecognizer];
        [gestureRecognizer release];
        
        gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(handleSwipe:)];
        [gestureRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
        [[[CCDirector sharedDirector] view] addGestureRecognizer:gestureRecognizer];
        [gestureRecognizer release];
        
        gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(handleSwipe:)];
        [gestureRecognizer setDirection:UISwipeGestureRecognizerDirectionUp];
        [[[CCDirector sharedDirector] view] addGestureRecognizer:gestureRecognizer];
        [gestureRecognizer release];
        
        gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(handleSwipe:)];
        [gestureRecognizer setDirection:UISwipeGestureRecognizerDirectionDown];
        [[[CCDirector sharedDirector] view] addGestureRecognizer:gestureRecognizer];
        
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        tap.numberOfTapsRequired = 2;
        [[[CCDirector sharedDirector] view] addGestureRecognizer:tap];
        
        [gestureRecognizer release];
        if (_hasBackHomeButton){
            CCMenuItemImage *itemStart = [CCMenuItemImage itemWithNormalImage:backbuttonName1 selectedImage:backbuttonName2 target:self selector:@selector(goHomePage)];
            CCMenu *mainMenu =[CCMenu menuWithItems:itemStart, nil];
            mainMenu.position =CGPointZero;
            [self addChild:mainMenu z:999 tag:9999];
            CGFloat h =[[CCDirector sharedDirector] winSize].height;
            itemStart.position=ccp(67 ,h-72);
        }
        
        
    }
    return self;
}
-(void)begin:(NSTimer *)timer
{
    
    [self addText];
    [self playSound];
     
    //[_timer invalidate];
}
-(void)handleTap:(UITapGestureRecognizer *)tap{
    NSLog(@"%@",tap);
}
-(void)handleSwipe:(UISwipeGestureRecognizer*)recognizer
{
    if (recognizer.direction==UISwipeGestureRecognizerDirectionLeft){
        [self goLeft];
        [self nextPage];
    }
    if (recognizer.direction==UISwipeGestureRecognizerDirectionRight){
        [self goRight];
        [self priorPage];
    }    
    if (recognizer.direction==UISwipeGestureRecognizerDirectionUp){
        NSLog(@"direct Up happened!");
        //[self priorPage];
    }    
    if (recognizer.direction==UISwipeGestureRecognizerDirectionDown){
        NSLog(@"direct down happened!");
        //[self nextPage];
    }    
    
}
-(void)dealloc
{
    
    //[_timer release];
    [super dealloc];
}
-(void)autoPage:(NSTimer *)delay
{
    if (_isAutoPaging){
        [self nextPage];
    }
   
}
-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    CGSize winSize =[[CCDirector sharedDirector] winSize];
    UITouch *touch=[touches anyObject];
    CGPoint location =[touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
    if ((location.x>winSize.width-AREAWIDTH) &&
        (location.y<AREAWIDTH))
    {
        //next page;
        [self nextPage];
        return;
    }
    if ((location.x<AREAWIDTH) && (location.y<AREAWIDTH))
    {
        [self priorPage];
        return;
    }
    if ((location.x<AREAWIDTH) && (location.y>winSize.height-AREAWIDTH))
    {
        [self goHomePage];
        return;
    }
    if ((location.x>winSize.width-AREAWIDTH)&&
        (location.y>winSize.height-AREAWIDTH))
    {
        [self popupSettings];
        return;
    }
    /*
    if ([self getChildByTag:SETTINGS_TAG]){
        [self removeChildByTag:SETTINGS_TAG cleanup:YES];
    }
     */
    
    /*
    NSSet *allTouches = [event allTouches];
    if ([allTouches count]==1){
        UITouch *touch =[[allTouches allObjects]objectAtIndex:0];
        if ([touch tapCount]==2){
            [[MusicManager sharedManager] stopEffects];
            [self playSound];
            [self addText];
        }
                  
    }
     */
}
-(void)initScreen
{
    
}

-(void)nextPage
{

}

-(void)priorPage{

}

-(void)popupSettings
{
    CCNode *node = [self getChildByTag:SETTINGS_TAG];
    if (node==NULL){
        [self pauseReading];
        PageSettings* ps=[PageSettings node];
        [self addChild:ps z:10 tag:SETTINGS_TAG];
        ps.position=ccp(512,384);
        ps.hostLayer=self;
    }
}
-(void)goHomePage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionMoveInL transitionWithDuration:1 scene:[PageStart scene]]];
}
-(void)addAnimation:(NSString *)name count:(int)count x:(CGFloat)x y:(CGFloat)y{
    [self addAnimation:name count:count x:x y:y animationTime:1.0];
}
-(void)addAnimation:(NSString *)name count:(int)count x:(CGFloat)x y:(CGFloat)y animationTime:(CGFloat)animationTime{
    
    [self addAnimation:name count:count x:x y:y animationTime:animationTime randomStop:NO];
    
}
-(void)addAnimation:(NSString *)name count:(int)count x:(CGFloat)x y:(CGFloat)y  animationTime:(CGFloat)animationTime  randomStop:(BOOL)randomStop
{
    CCAnimation *animation=[CCAnimation animation];
    for (int i=1; i<=count; i++) {
        [animation addSpriteFrameWithFilename:[NSString stringWithFormat:name,i]];
        //[animation addFrameWithFilename:[NSString stringWithFormat:name,i]];
    }
    //CCAnimate *animate=[CCAnimate actionWithDuration:animationTime animation:animation restoreOriginalFrame:YES];
    animation.delayPerUnit= animationTime;
    animation.restoreOriginalFrame = YES;
    CCAnimate *animate = [CCAnimate actionWithAnimation:animation];
    
    //MoveSprite *sprite=[MoveSprite spriteWithFile:[NSString stringWithFormat:name,1]];
    CCSprite *sprite =[CCSprite spriteWithFile:[NSString stringWithFormat:name,count]];
    [self addChild:sprite z:0];
    sprite.position=ccp(x,y);
    float randomDelay = 1.0;
    if (randomStop){
        randomDelay = CCRANDOM_0_1()*7;
    }
    CCSequence *sequ = [CCSequence actions:[CCDelayTime actionWithDuration:randomDelay],animate, nil];
    [sprite runAction:[CCRepeatForever actionWithAction:sequ]];
    //[sprite initDebugMenu];
  
}
-(void)playSound
{}
-(NSString *)getFileName:(NSString *)filename
{

    NSString *result=[NSString stringWithFormat:@"%@_%@.png",filename,[[MusicManager sharedManager] language]];
    NSLog(@"%@",result);
    return result;
}
-(NSString *)getFileName:(NSString *)filename ext:(NSString *)ext
{
    
    NSString *result=[NSString stringWithFormat:@"%@_%@.%@",filename,[[MusicManager sharedManager] language],ext];
    NSLog(@"%@",result);
    return result;
}
-(void)addText
{
    if (_pageNo<1)
        return;
    if ([self getChildByTag:TEXT_TAG])
        [self removeChildByTag:TEXT_TAG cleanup:YES];
    NSString *textName;
    if (_story_index==1){
        textName=[NSString stringWithFormat:@"text%d_%@.png",_pageNo,[[MusicManager sharedManager] language]];
    }else{
        textName=[NSString stringWithFormat:@"text/%d-font-%@.png",_pageNo,[[MusicManager sharedManager] language]];
    }
    
    CCSprite *text=[CCSprite spriteWithFile:textName];
    [self addChild:text z:1 tag:TEXT_TAG];
    text.position=textPoint;
    
}
-(void)update
{
    //[self playSound];
    [self addText];
}
-(void)pauseReading
{
    [self unschedule:@selector(autoPage:)];
    [self pauseSchedulerAndActions];
    //[[MusicManager sharedManager] pause];
}
-(void)resumeReading
{
    //[_pageTimer invalidate];
   
    //_pageTimer = [NSTimer scheduledTimerWithTimeInterval:AutoPagingAfterSeconds target:self selector:@selector(autoPage:) userInfo:nil repeats:NO];
    _isAutoPaging =[[MusicManager sharedManager] isAutoPaging];
    if (_isAutoPaging){
        [self schedule:@selector(autoPage:) interval:AutoPagingAfterSeconds];
    }
    [self resumeSchedulerAndActions];
    //[[MusicManager sharedManager] resume];
    //[[MusicManager sharedManager] stopEffects];
    if ([[MusicManager sharedManager] isEffects])
        [[MusicManager sharedManager] stopEffects];
        [self playSound];
}
-(void)goLeft
{
    
}
-(void)goRight{
    
}
@end
