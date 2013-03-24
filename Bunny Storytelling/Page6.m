//
//  Page6.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page6.h"
#import "Page5.h"
#import "Page7.h"
#import "MusicManager.h"

@implementation Page6
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page6 *page =[Page6 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{
    
    CCSprite *bg =[CCSprite spriteWithFile:@"scene-6/6-bg.jpg"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;    
    [self addAnimation:@"scene-6/6-dragonfly-%02d.png" count:11 x:512 y:550 animationTime:6];
    [self addAnimation:@"scene-6/6-fish-0%d.png" count:2 x:140 y:120 animationTime:0.5];
    [self addAnimation:@"scene-6/6-water-0%d.png" count:4 x:512 y:200 animationTime:1];
    _pageNo=6;
    textPoint = CGPointMake(280, 669);

}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page7 scene] backwards:NO]];
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page5 scene] backwards:YES]];
}

-(void)playSound
{
    [[MusicManager sharedManager] Play6];
}


@end
