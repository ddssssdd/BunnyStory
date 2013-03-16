//
//  Design2.m
//  Bunny Storytelling
//
//  Created by Fu Steven on 3/10/13.
//
//

#import "Design2.h"
#import "Design1.h"

@implementation Design2
+(CCScene *)scene{
    CCScene *scene = [CCScene node];
    Design2 *d1 = [Design2 node];
    [scene addChild:d1];
    return  scene;
}
-(void)initScreen{
    CCSprite *bg =[CCSprite spriteWithFile:@"DESIGN01.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;
}


-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Design1
                                                                                                    scene] backwards:NO]];
}
@end
