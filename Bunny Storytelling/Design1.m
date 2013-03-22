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
#define TAG_BACKGROUND 1
#define TAG_DIAN 2

+(CCScene *)scene{
    CCScene *scene = [CCScene node];
    Design1 *d1 = [Design1 node];
    [scene addChild:d1];
    return  scene;
}

-(void)initScreen{
    _hasBackHomeButton=YES;
    _index =1;
    _inMoving = NO;
    CCSprite *bg =[CCSprite spriteWithFile:@"DESIGN00.png"];
    [self addChild:bg z:0 tag:TAG_BACKGROUND];
    bg.anchorPoint=CGPointZero;
    CCSprite *d1 =[CCSprite spriteWithFile:@"dian00.png"];
    [self addChild:d1 z:1];
    d1.position=ccp(512-50,80);
    CCSprite *d2 =[CCSprite spriteWithFile:@"dian00.png"];
    [self addChild:d2 z:1];
    d2.position=ccp(512+50,80);
    CCSprite *d3 =[CCSprite spriteWithFile:@"dian01.png"];
    [self addChild:d3 z:1 tag:TAG_DIAN];
    d3.position=ccp(512-50,80);

    
}
-(void)addBackWithDot{
    CCSprite *bg;
    if (_index==1){
        bg = [CCSprite spriteWithFile:@"DESIGN00.png"];
    }else{
        bg = [CCSprite spriteWithFile:@"DESIGN01.png"];
    }
    bg.anchorPoint = CGPointZero;
    [self addChild:bg z:0 tag:TAG_BACKGROUND+100];
    CGFloat y = -1024.0f;
    if (_index==2){
        y = 1024.0f;
    }
    bg.position=ccp(y,0);
    CCMoveTo *move =[CCMoveTo actionWithDuration:0.5 position:ccp(0,0)];
    CCCallBlock *callback =[CCCallBlock actionWithBlock:^{
        CCNode *node = [self getChildByTag:TAG_BACKGROUND+100];
        if (node){
            node.tag = TAG_BACKGROUND;
        }
        CCNode *dot = [self getChildByTag:TAG_DIAN];
        if (dot){
            CGPoint point;
            if (_index==1){
                point = ccp(512-50,80);
            }else{
                point = ccp(512+50,80);
            }
            dot.position=point;
        }
        
        _inMoving = NO;
    }];
    [bg runAction:[CCSequence actionOne:move two:callback]];
    
    
}
-(void)updateDisplay{
    CCNode *bg =[self getChildByTag:TAG_BACKGROUND];
    if (bg){
        _inMoving = YES;
        CGFloat y = -1024.0f;
        if (_index==1){
            y = 1024.0f;
        }
        CCMoveTo *move =[CCMoveTo actionWithDuration:0.5 position:ccp(y,0)];
        CCCallBlock *callback =[CCCallBlock actionWithBlock:^{
            [self removeChildByTag:TAG_BACKGROUND cleanup:YES];
            
            _inMoving = NO;
        }];
        [bg runAction:[CCSequence actionOne:move two:callback]];
        [self addBackWithDot];
    }
}

-(void)nextPage
{
    //[[CCDirector sharedDirector] replaceScene:[CCTransitionMoveInR transitionWithDuration:1 scene:[Design2 scene]]];
    if (_index==1){
        _index=2;
        [self updateDisplay];
    }
}

-(void)priorPage{
    //[[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[PageStart scene] backwards:NO]];
    if (_index==2){
        _index=1;
        [self updateDisplay];
    }
}
@end
