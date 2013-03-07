//
//  Page1.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page1_1.h"
#import "Page1_2.h"
#import "MusicManager.h"
@implementation Page1_1
+(CCScene *)scene
{
    
    CCScene *scene = [CCScene node];
    Page1_1 *page =[Page1_1 node];
    [scene addChild:page];
    return scene;
}

-(void)initScreen
{
    CCSprite *bg =[CCSprite spriteWithFile:@"001/001.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;    
    [self addAnimation:@"001/bird%d.png" count:2 x:185 y:560];
    [self addAnimation:@"001/rabbit%d.png" count:2 x:745 y:310];
    [self addAnimation:@"001/worm%d.png" count:4 x:320 y:280];
    [self addAnimation:@"001/sign%d.png" count:3 x:500 y:250];
    [self addAnimation:@"001/grass%d.png" count:4 x:870 y:105];
    [self addAnimation:@"001/grass01%d.png" count:4 x:195 y:85];
    _story_index =1;
    _pageNo=1;
}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_2 scene] backwards:NO]];
}

-(void)priorPage{
    
}
-(void)playSound
{
    [[MusicManager sharedManager] Play1_1];
}
@end
