//
//  Page7.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page7.h"
#import "Page8.h"
#import "Page6.h"
#import "MusicManager.h"

@implementation Page7
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page7 *page =[Page7 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"scene-7/7-bg.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;   
    [self addAnimation:@"scene-7/7-wolf-0%d.png" count:2 x:854 y:580 animationTime:3];
    [self addAnimation:@"scene-7/7-rabbit-0%d.png" count:2 x:288 y:503 animationTime:1];
    [self addAnimation:@"scene-7/7-tiger-0%d.png" count:2 x:714 y:356 animationTime:1];
   

    _pageNo=7;
        textPoint = CGPointMake(675, 93);

}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page8 scene] backwards:NO]];
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page6 scene] backwards:YES]];
}
-(void)playSound
{
    [[MusicManager sharedManager] Play7];
}


@end
