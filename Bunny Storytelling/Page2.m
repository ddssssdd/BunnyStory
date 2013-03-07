//
//  Page2.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page2.h"
#import "Page1.h"
#import "Page3.h"
#import "MusicManager.h"
@implementation Page2
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page2 *page =[Page2 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"scene-2/2-bg.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;    
    [self addAnimation:@"scene-2/2-bird-0%d.png" count:2 x:170 y:402 animationTime:1];
    [self addAnimation:@"scene-2/2-moth-0%d.png" count:2 x:80 y:53 animationTime:1];
    [self addAnimation:@"scene-2/2-tiger-0%d.png" count:2 x:487 y:367 animationTime:1];

    _pageNo=2;
    textPoint = CGPointMake(352, 676);
}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page3 scene] backwards:NO]];
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1 scene] backwards:YES]];
}
-(void)playSound
{
    [[MusicManager sharedManager] Play2];
}

@end
