//
//  PageStart.m
//  Bunny Storytelling
//
//  Created by Fu Steven on 3/10/13.
//
//

#import "PageStart.h"
#import "Page0.h"
#import "Page1_0.h"
#import "Design1.h"
#import "WallPaper.h"
#import "MusicManager.h"

#define MAINMENU_TAG 1
@implementation PageStart

+(CCScene *)scene{
    [[MusicManager sharedManager] playBackground];
    CCScene *scene = [CCScene node];
    PageStart *page =[PageStart node];
    [scene addChild:page];
    return scene;
}

-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"title/bj01.jpg"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;
    
    [self initMenu];
    _hasBackHomeButton = NO;
    [self addAnimation:@"title-ani/book1_%d.png" count:3 x:315 y:385 animationTime:0.1 randomStop:YES];
    [self addAnimation:@"title-ani/book2_%d.png" count:3 x:705 y:385 animationTime:0.1 randomStop:YES];
    [self addAnimation:@"title-ani/1-insect-%02d.png" count:11 x:900 y:120 animationTime:1];
    [self addAnimation:@"title-ani/qingting%d.png" count:4 x:150 y:150 animationTime:0.5];
   
   
}
-(void)initMenu
{
    
    CCMenuItemImage *itemStart1 = [CCMenuItemImage itemWithNormalImage:@"title/tuzi00.png" selectedImage:@"title/tuzi01.png" target:self selector:@selector(start1:)];

    CCMenuItemImage *itemStart2 = [CCMenuItemImage itemWithNormalImage:@"title/tuzi02.png" selectedImage:@"title/tuzi03.png" target:self selector:@selector(start2:)];

    CCMenuItemImage *itemIntro1 = [CCMenuItemImage itemWithNormalImage:@"title/design00.png" selectedImage:@"title/design01.png" target:self selector:@selector(start3:)];

    CCMenuItemImage *itemIntro2 = [CCMenuItemImage itemWithNormalImage:@"title/wall00.png" selectedImage:@"title/wall01.png" target:self selector:@selector(start4:)];

    
    CCMenu *mainMenu =[CCMenu menuWithItems:itemStart1,itemStart2,itemIntro1,itemIntro2, nil];
    mainMenu.position =CGPointZero;
    [self addChild:mainMenu z:0 tag:MAINMENU_TAG];
    
    itemStart1.position=ccp(315 ,385);
    itemStart2.position = ccp(705,385);
    itemIntro1.position=ccp(435,125);
    itemIntro2.position=ccp(615,125);
    
    
}
-(void)start1:(id)sender{
    
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Page1_0 scene] withColor:ccWHITE]];
}
-(void)start2:(id)sender{
    
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Page0 scene] withColor:ccWHITE]];
}
-(void)start3:(id)sender{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Design1 scene] withColor:ccWHITE]];
}
-(void)start4:(id)sender{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[WallPaper scene] withColor:ccWHITE]];
}
-(void)nextPage
{
    //[[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_2 scene] backwards:NO]];
}

-(void)priorPage{
    
}
-(void)playSound
{
    //[[MusicManager sharedManager] Play1_1];
}

@end
