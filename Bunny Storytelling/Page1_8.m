//
//  Page8.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page1_8.h"
#import "Page1_7.h"
#import "MusicManager.h"
#import "PageEnd.h"
@implementation Page1_8
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page1_8 *page =[Page1_8 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"008/bg.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero; 
    [self addAnimation:@"008/sun4.png" count:1 x:512 y:375];

    CCSprite *land =[CCSprite spriteWithFile:@"008/land.png"];
    [self addChild:land];
    land.anchorPoint=CGPointZero; 

    [self addAnimation:@"008/flower%d.png" count:4 x:160 y:130];
    [self addAnimation:@"008/flowersmall%d.png" count:4 x:140 y:65];
    [self addAnimation:@"008/qingting%d.png" count:3 x:205 y:665];
    [self addAnimation:@"008/zoom%d.png" count:2 x:874 y:280];
    _pageNo=8;
    _story_index =1;
    
}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[PageEnd scene:1] backwards:NO]];
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_7 scene] backwards:YES]];
}
-(void)playSound
{
    [[MusicManager sharedManager] Play1_8];
}


@end
