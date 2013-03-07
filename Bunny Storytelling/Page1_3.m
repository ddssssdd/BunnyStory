//
//  Page3.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page1_3.h"
#import "Page1_2.h"
#import "Page1_4.h"
#import "MusicManager.h"
@implementation Page1_3
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page1_3 *page =[Page1_3 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"003/bg.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;    
    [self addAnimation:@"003/cangying%d.png" count:3 x:965 y:130];
    [self addAnimation:@"003/eye%d.png" count:4 x:455 y:405];
    [self addAnimation:@"003/eye1%d.png" count:2 x:678 y:235];
    _pageNo=3;
    _story_index =1;
}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_4 scene] backwards:NO]];
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_2 scene] backwards:YES]];
}

-(void)playSound
{
    [[MusicManager sharedManager] Play1_3];
}

@end
