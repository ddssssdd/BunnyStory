//
//  Page8.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page8.h"
#import "Page7.h"
#import "MusicManager.h"
#import "PageEnd.h"
@implementation Page8
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page8 *page =[Page8 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"scene-8/8-bg.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero; 
    [self addAnimation:@"scene-8/8-fire-0%d.png" count:3 x:498 y:328 animationTime:2];
    [self addAnimation:@"scene-8/8-rabbit-0%d.png" count:2 x:272 y:316 animationTime:1];
    [self addAnimation:@"scene-8/8-tiger-0%d.png" count:2 x:794 y:301 animationTime:1];
    _pageNo=8;
    textPoint = CGPointMake(415, 693);
}
-(void)nextPage
{
     [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[PageEnd scene] backwards:NO]];
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page7 scene] backwards:YES]];
}
-(void)playSound
{
    [[MusicManager sharedManager] Play8];
}


@end
