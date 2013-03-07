//
//  Page7.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page1_7.h"
#import "Page1_8.h"
#import "Page1_6.h"
#import "MusicManager.h"

@implementation Page1_7
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page1_7 *page =[Page1_7 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"007/bg.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;   
    [self addAnimation:@"007/eye%d.png" count:2 x:630 y:325];
    [self addAnimation:@"007/eye1%d.png" count:2 x:450 y:280];
    [self addAnimation:@"007/mouse%d.png" count:2 x:500 y:240];
    [self addAnimation:@"007/qingting%d.png" count:4 x:205 y:665];
    _pageNo=7;
    _story_index =1;

}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_8 scene] backwards:NO]];
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_6 scene] backwards:YES]];
}
-(void)playSound
{
    [[MusicManager sharedManager] Play1_7];
}


@end
