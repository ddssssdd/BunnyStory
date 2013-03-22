//
//  Page5.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page5.h"
#import "Page3.h"
#import "Page6.h"
#import "MusicManager.h"


@implementation Page5
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page5 *page =[Page5 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"scene-5/5-bg.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;    
    [self addAnimation:@"scene-5/5-fish-0%d.png" count:3 x:156 y:100 animationTime:2];    
    [self addAnimation:@"scene-5/5-tiger-0%d.png" count:2 x:587 y:253 animationTime:1];
    [self addAnimation:@"scene-5/5-rabbit-0%d.png" count:2 x:361 y:551 animationTime:1];
    CCSprite *s1 =[CCSprite spriteWithFile:@"scene-5/5-bg_00.png"];
    [self addChild:s1];
    s1.position=ccp(880,116);
    
    
    _pageNo=5;
    textPoint = CGPointMake(802, 639);
    
}
-(void)nextPage
{
    if (_isBackgroundMusicPlaying)
        [[MusicManager sharedManager] resume];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page6 scene] backwards:NO]];
}

-(void)priorPage{
    if (_isBackgroundMusicPlaying)
        [[MusicManager sharedManager] resume];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page3 scene] backwards:YES]];
}
-(void)playSound
{
    [[MusicManager sharedManager] Play5];
}


@end
