//
//  PageHelp.m
//  RabbitStory
//
//  Created by Fu Steven on 1/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Page1_Help.h"
#import "MusicManager.h"
#import "Page1_0.h"
#import "Page1_1.h"
@implementation Page1_Help
+(CCScene *)scene
{
    //[[MusicManager sharedManager] playBackground];
    CCScene *scene = [CCScene node];
    Page1_Help *page =[Page1_Help node];
    [scene addChild:page];
    return scene;
}

-(void)initScreen
{
    CCSprite *bg0 =[CCSprite spriteWithFile:[self getFileName:@"pageHelp/homepage"]];
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
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_1 scene] backwards:NO]];
}

-(void)priorPage{
     [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_0 scene] backwards:YES]];
}
-(void)popupSettings
{}
@end
