//
//  Page6.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page1_6.h"
#import "Page1_5.h"
#import "Page1_7.h"
#import "MusicManager.h"

@implementation Page1_6
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page1_6 *page =[Page1_6 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{
    
    CCSprite *bg =[CCSprite spriteWithFile:@"006/bg.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;    
    [self addAnimation:@"006/cy%d.png" count:3 x:875 y:50];
    [self addAnimation:@"006/ybird%d.png" count:4 x:340 y:525];
    [self addAnimation:@"006/hi%d.png" count:4 x:445 y:560];
    [self addAnimation:@"006/hulua%d.png" count:3 x:460 y:390];
    [self addAnimation:@"006/hulub%d.png" count:3 x:730 y:490];
    [self addAnimation:@"006/mouse%d.png" count:2 x:505 y:85];
    _pageNo=6;
    _story_index =1;

}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_7 scene] backwards:NO]];
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_5 scene] backwards:YES]];
}

-(void)playSound
{
    [[MusicManager sharedManager] Play1_6];
}


@end
