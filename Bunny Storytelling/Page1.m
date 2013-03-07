//
//  Page1.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page1.h"
#import "Page2.h"
#import "MusicManager.h"
@implementation Page1
+(CCScene *)scene
{
    
    CCScene *scene = [CCScene node];
    Page1 *page =[Page1 node];
    [scene addChild:page];
    return scene;
}

-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"scene-1/1-bg.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;    
    [self addAnimation:@"scene-1/1-grass-0%d.png" count:3 x:984 y:204 animationTime:1.5];
    [self addAnimation:@"scene-1/1-insect-%02d.png" count:11 x:300 y:308 animationTime:6];
    [self addAnimation:@"scene-1/1-sleep-0%d.png" count:3 x:534 y:604 animationTime:2];
    [self addAnimation:@"scene-1/1-tiger-0%d.png" count:2 x:670 y:150 animationTime:1];

    
    _pageNo=1;
    textPoint = CGPointMake(382, 671);
}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page2 scene] backwards:NO]];
}

-(void)priorPage{
    
}
-(void)playSound
{
    [[MusicManager sharedManager] Play1];
}
@end
