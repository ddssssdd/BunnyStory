//
//  PageEnd.m
//  RabbitStory
//
//  Created by Fu Steven on 1/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PageEnd.h"
#import "MusicManager.h"
#import "Page8.h"
#import "Page0.h"
#import "Page1_0.h"
#import "Page1.h"
#import "PageStart.h"

#define BG_TAG 11
#define MENU_TAG 12
@implementation PageEnd
+(CCScene *)scene:(int)index
{
    CCScene *scene =[CCScene node];
    PageEnd *page = [PageEnd node];
    page.index = index;
    [scene addChild:page];
    return scene;
}
-(void)initScreen
{

    isInMore =NO;

    CCSprite *bg2 =[CCSprite spriteWithFile:[self getFileName:@"page0/homepage"]];
    [self addChild:bg2];
    bg2.anchorPoint=CGPointZero; 
    
    
    CCSprite *bg =[CCSprite spriteWithFile:[self getFileName:@"pageEnd/endbg"]];
    [self addChild:bg z:0 tag:BG_TAG];
    bg.position=ccp(512,388); 

    CCMenuItemImage *menuAgain=[CCMenuItemImage itemWithNormalImage:[self getFileName:@"pageEnd/againbtn_out"] selectedImage:[self getFileName:@"pageEnd/againbtn_over"] target:self selector:@selector(againBtn:)];
    
    
    CCMenuItemImage *menuGoHome=[CCMenuItemImage itemWithNormalImage:[self getFileName:@"pageEnd/backbtn_out"] selectedImage:[self getFileName:@"pageEnd/backbtn_over"]  block:^(id sender){
       [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[PageStart scene] backwards:YES]];
    }];
    CCMenuItemImage *menuMore=[CCMenuItemImage itemWithNormalImage:[self getFileName:@"pageEnd/morebtn_out"] selectedImage:[self getFileName:@"pageEnd/morebtn_over"] target:self selector:@selector(moreBtn:)];
    
    
    CCMenuItemImage *menuContact=[CCMenuItemImage itemWithNormalImage:[self getFileName:@"pageEnd/contactbtn_out"] selectedImage:[self getFileName:@"pageEnd/contactbtn_over"] block:^(id sender){
        NSString *url =[@"mailto:support@exploreusmore.com?subject=  &body=  " stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }];
    CCMenu* menu =[CCMenu menuWithItems:menuAgain,menuGoHome,menuMore,menuContact, nil];
    [self addChild:menu z:2 tag:MENU_TAG];
    menu.position=CGPointZero;
    int yPos=250;
    menuAgain.position=ccp(435,yPos);
    menuGoHome.position=ccp(585,yPos);
    menuMore.position=ccp(735,yPos);
    menuContact.position=ccp(285,yPos);
                                
    
}
-(void)againBtn:(id)sender{
    
    if (self.index==1){
        [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_0 scene] backwards:YES]];
    }else{
        [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1 scene] backwards:YES]];
    }

}
-(void)moreBtn:(id)sender{
    isInMore = YES;
    [self removeChildByTag:BG_TAG cleanup:YES];
    [self removeChildByTag:MENU_TAG cleanup:YES];
    CCSprite *bgMore =[CCSprite spriteWithFile:[self getFileName:@"pageEnd/morebg"]];
    [self addChild:bgMore z:11 tag:BG_TAG];
    bgMore.position=ccp(512,388);
    CCMenuItemImage *menuGoHome2=[CCMenuItemImage itemWithNormalImage:[self getFileName:@"pageEnd/backbtn_out"] selectedImage:[self getFileName:@"pageEnd/backbtn_over"]  block:^(id sender){
        [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page0 scene] backwards:YES]];
    }];
    CCMenu* menu2 =[CCMenu menuWithItems:menuGoHome2, nil];
    [self addChild:menu2 z:11 tag:MENU_TAG];
    menu2.position=CGPointZero;
    int yPos=250;
    menuGoHome2.position=ccp(735,yPos);
}
-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    UITouch *touch=[touches anyObject];
    CGPoint location =[touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];


    if ((location.x>290)&&
        (location.x<516) &&
        (location.y>230) &&
        (location.y<300))
    {
        NSString *url =[@"http://www.exploreusmore.com/games/"  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
    
    if (isInMore){
        
        if ((location.x>300)&&
            (location.x<400) &&
            (location.y>390) &&
            (location.y<480))
        {
            NSString *url =[@"http://itunes.apple.com/us/app/kuqi-guitar-hero/id496487611?ls=1&mt=8"  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        }
    }
}
-(void)nextPage
{
}

-(void)priorPage{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page8 scene] backwards:YES]];
}
-(void)playSound
{
    [[MusicManager sharedManager] PlayEnd];
}
-(void)popupSettings
{}

@end
