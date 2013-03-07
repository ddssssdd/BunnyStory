//
//  PageHelp.m
//  RabbitStory
//
//  Created by Fu Steven on 1/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PageHelp.h"
#import "MusicManager.h"
#import "Page0.h"
#import "Page1.h"
@implementation PageHelp
+(CCScene *)scene
{
    //[[MusicManager sharedManager] playBackground];
    CCScene *scene = [CCScene node];
    PageHelp *page =[PageHelp node];
    [scene addChild:page];
    return scene;
}

-(void)initScreen
{
    CCSprite *bg0 =[CCSprite spriteWithFile:[self getFileName:@"page0/homepage"]];
    [self addChild:bg0];
    bg0.anchorPoint=CGPointZero; 
    /*
    CCSprite *bg2 =[CCSprite spriteWithFile:@"blackbg.png"];
    [self addChild:bg2];
    bg2.anchorPoint = CGPointZero;
     */
    CCSprite *bg =[CCSprite spriteWithFile:[self getFileName:@"pageHelp/help"]];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;    
}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1 scene] backwards:NO]];
}

-(void)priorPage{
     [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page0 scene] backwards:YES]];
}
-(void)popupSettings
{}
@end
