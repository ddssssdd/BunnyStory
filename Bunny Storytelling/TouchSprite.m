//
//  TouchSprite.m
//  Bunny Storytelling
//
//  Created by Fu Steven on 3/14/13.
//
//

#import "TouchSprite.h"

@implementation TouchSprite
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    if (![self containsTouchLocation:touch]){
        return NO;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TouchSprite" object:self ];
    return YES;
}
/*
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    
}
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    
}

- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
    
}
 */
-(void)onEnter{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}
-(void)onExit{
    [[[CCDirector sharedDirector] touchDispatcher]  removeDelegate:self];
    [super onExit];
    
}
-(CGRect)rect{
    CGSize s= [self.texture contentSize];
    return CGRectMake(-s.width/2, -s.height/2, s.width, s.height);
}

-(BOOL)containsTouchLocation:(UITouch *)touch{
    return CGRectContainsPoint([self rect], [self convertTouchToNodeSpaceAR:touch]);
}
@end
