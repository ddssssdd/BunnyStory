//
//  Page5.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Page1_5.h"
#import "Page1_3.h"
#import "Page1_6.h"
#import "MusicManager.h"

@implementation Page1_5
+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    Page1_5 *page =[Page1_5 node];
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{

    [self addAnimation:@"005/%d.png" count:3 x:512 y:384];
    [self addAnimation:@"005/eye%d.png" count:2 x:485 y:415];
    _pageNo=5;
    _story_index =1;
    
}
-(void)nextPage
{
    if (_isBackgroundMusicPlaying)
        [[MusicManager sharedManager] resume];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_6 scene] backwards:NO]];
}

-(void)priorPage{
    if (_isBackgroundMusicPlaying)
        [[MusicManager sharedManager] resume];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_3 scene] backwards:YES]];
}
-(void)playSound
{
    _isBackgroundMusicPlaying = [[MusicManager sharedManager] isBackgroundMusicPlaying];
    [[MusicManager sharedManager] pause];
    [[MusicManager sharedManager] Play1_5];
}
-(void)addText
{}

@end
