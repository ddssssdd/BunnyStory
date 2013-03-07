//
//  Page4.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page1_4.h"
#import "Page1_3.h"
#import "Page1_5.h"
#import "MusicManager.h"
@implementation Page1_4
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page1_4 *page =[Page1_4 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"004/bg.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;    
    [self addAnimation:@"004/eye%d.png" count:4 x:385 y:430];
    [self addAnimation:@"004/eye1%d.png" count:4 x:465 y:455];
    [self addAnimation:@"004/music%d.png" count:4 x:588 y:580];
    [self addAnimation:@"004/tree%d.png" count:3 x:970 y:500];
    _pageNo=4;
    _story_index =1;
}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_5 scene] backwards:NO]];
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_3 scene] backwards:YES]];
}
-(void)playSound
{
    [[MusicManager sharedManager] Play1_4];
}


@end
