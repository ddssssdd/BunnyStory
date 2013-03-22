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
    _hasBackHomeButton=YES;
    CCSprite *bg =[CCSprite spriteWithFile:@"DESIGN01.png"];
    [self addChild:bg];
    bg.anchorPoint=CGPointZero;
    CCSprite *d1 =[CCSprite spriteWithFile:@"dian00.png"];
    [self addChild:d1];
    d1.position=ccp(512-50,80);
    CCSprite *d2 =[CCSprite spriteWithFile:@"dian00.png"];
    [self addChild:d2];
    d2.position=ccp(512+50,80);
    CCSprite *d3 =[CCSprite spriteWithFile:@"dian01.png"];
    [self addChild:d3];
    d3.position=ccp(512+50,80);

}


-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionMoveInL transitionWithDuration:1 scene:[Design1
                                                                                                    scene] ]];
}
@end
