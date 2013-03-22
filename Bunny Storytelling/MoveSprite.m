//
//  MoveSprite.m
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MoveSprite.h"
#define MOVEDISTANCE 10
#define ARROWDISTANCE 100
@implementation MoveSprite
-(id)init{
    if ((self=[super init])){
        
    }
    return self;
}
-(void)initDebugMenu
{
    
    CCMenuItemImage *item1 =[CCMenuItemImage itemWithNormalImage:@"TOP.png" selectedImage:@"TOP.png" target:self selector:@selector(top:)];   
    CCMenuItemImage *item2 =[CCMenuItemImage itemWithNormalImage:@"BOTTOM.png" selectedImage:@"BOTTOM.png" target:self selector:@selector(bottom:)];
    CCMenuItemImage *item3 =[CCMenuItemImage itemWithNormalImage:@"LEFT.png" selectedImage:@"LEFT.png" target:self selector:@selector(left:)];
    CCMenuItemImage *item4 =[CCMenuItemImage itemWithNormalImage:@"RIGHT.png" selectedImage:@"RIGHT.png" target:self selector:@selector(right:)];
    
    
    
    CCMenu *menu = [CCMenu menuWithItems:item1,item2,item3, item4,nil];
    [self addChild:menu];
    
    menu.position=CGPointZero;
    
    item1.position=ccp(self.contentSize.width*0.5,self.contentSize.height*0.5+ARROWDISTANCE);
    item2.position=ccp(self.contentSize.width*0.5,self.contentSize.height*0.5-ARROWDISTANCE);
    item3.position=ccp(self.contentSize.width*0.5-ARROWDISTANCE,self.contentSize.height*0.5);
    item4.position=ccp(self.contentSize.width*0.5+ARROWDISTANCE,self.contentSize.height*0.5);
}
-(void)top:(id)sender{

    self.position=ccp(self.position.x,self.position.y+MOVEDISTANCE);
    NSLog(@"x=%f,y=%f",self.position.x,self.position.y);
}
-(void)bottom:(id)sender{
    
    self.position=ccp(self.position.x,self.position.y-MOVEDISTANCE);
    NSLog(@"x=%f,y=%f",self.position.x,self.position.y);
}
-(void)left:(id)sender{
    
    self.position=ccp(self.position.x-MOVEDISTANCE,self.position.y);
    NSLog(@"x=%f,y=%f",self.position.x,self.position.y);
}
-(void)right:(id)sender{
    
    self.position=ccp(self.position.x+MOVEDISTANCE,self.position.y);
    NSLog(@"x=%f,y=%f",self.position.x,self.position.y);
}

@end
