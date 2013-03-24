//
//  Page3.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page3.h"
#import "Page2.h"
#import "Page4.h"
#import "MusicManager.h"
@implementation Page3
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page3 *page =[Page3 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"scene-3/3-bg.jpg"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;    
    [self addAnimation:@"scene-3/3-bird-0%d.png" count:2 x:484 y:522 animationTime:1];
    [self addAnimation:@"scene-3/3-tiger-0%d.png" count:3 x:310 y:266 animationTime:0.5];
    [self addAnimation:@"scene-3/3-flower-0%d.png" count:3 x:950 y:90 animationTime:1];
    _pageNo=3;
        textPoint = CGPointMake(735, 94);
}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page4 scene] backwards:NO]];
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page2 scene] backwards:YES]];
}

-(void)playSound
{
    [[MusicManager sharedManager] Play3];
}

@end
