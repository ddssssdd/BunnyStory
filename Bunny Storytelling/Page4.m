//
//  Page4.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page4.h"
#import "Page3.h"
#import "Page5.h"
#import "MusicManager.h"

@implementation Page4
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page4 *page =[Page4 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"scene-4/4-bg.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;    
    [self addAnimation:@"scene-4/4-rabbit-0%d.png" count:2 x:440 y:416 animationTime:1];    
    [self addAnimation:@"scene-4/4-tiger-0%d.png" count:2 x:723 y:255 animationTime:1];
    [self addAnimation:@"scene-4/4-tear-0%d.png" count:3 x:615 y:261 animationTime:1];
    CCSprite *s1 =[CCSprite spriteWithFile:@"scene-4/4-bg_00.png"];
    [self addChild:s1];
    s1.position=ccp(290,286);
 

    _pageNo=4;
    textPoint = CGPointMake(241, 669);
}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page5 scene] backwards:NO]];
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page3 scene] backwards:YES]];
}
-(void)playSound
{
    [[MusicManager sharedManager] Play4];
}


@end
