//
//  Design1.m
//  Bunny Storytelling
//
//  Created by Fu Steven on 3/10/13.
//
//

#import "Design1.h"
#import "Design2.h"
#import "PageStart.h"

@implementation Design1

+(CCScene *)scene{
    CCScene *scene = [CCScene node];
    Design1 *d1 = [Design1 node];
    [scene addChild:d1];
    return  scene;
}
-(void)initScreen{
    CCSprite *bg =[CCSprite spriteWithFile:@"DESIGN00.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;
}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Design2 scene] backwards:NO]];
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[PageStart scene] backwards:NO]];
}
@end
