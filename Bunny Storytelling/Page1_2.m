//
//  Page2.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page1_2.h"
#import "Page1_1.h"
#import "Page1_3.h"
#import "MusicManager.h"
@implementation Page1_2
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page1_2 *page =[Page1_2 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"002/bg.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;    
    [self addAnimation:@"002/flower%d.png" count:4 x:160 y:130];
    [self addAnimation:@"002/flower1%d.png" count:4 x:140 y:65];
    [self addAnimation:@"002/help%d.png" count:3 x:555 y:545];
    [self addAnimation:@"002/ybird%d.png" count:4 x:465 y:520];
    _pageNo=2;
    _story_index =1;
}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_3 scene] backwards:NO]];
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_1 scene] backwards:YES]];
}
-(void)playSound
{
    [[MusicManager sharedManager] Play1_2];
}

@end
