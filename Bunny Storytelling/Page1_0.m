//
//  Page0.m
//  RabbitStory
//
//  Created by Fu Steven on 1/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Page1_0.h"
#import "MusicManager.h"
#import "Page1_Help.h"

#define BACKGROUND_TAG 1
#define MAINMENU_TAG 2

@implementation Page1_0
+(CCScene *)scene
{
    
    CCScene *scene = [CCScene node];
    Page1_0 *page =[Page1_0 node];
    [scene addChild:page];
    return scene;
}

-(void)initScreen
{
    _isAutoPaging =NO;
    if ([self getChildByTag:BACKGROUND_TAG])
        [self removeChildByTag:BACKGROUND_TAG cleanup:YES];
    if ([self getChildByTag:MAINMENU_TAG])
        [self removeChildByTag:MAINMENU_TAG cleanup:YES];
    CCSprite *bg =[CCSprite spriteWithFile:[self getFileName:@"page0/homepage"]];
    [self addChild:bg z:0 tag:BACKGROUND_TAG];
    bg.anchorPoint=CGPointZero; 
    [self initMenu];
}
-(void)nextPage
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:[Page1_Help scene] backwards:NO]];
}

-(void)priorPage{
    
}
-(void)goHomePage
{

}
-(void)setEnglish:(id)sender
{
    [[MusicManager sharedManager] setLanguage:@"En"];
    [self initScreen];
}
-(void)setChinese:(id)sender
{
    [[MusicManager sharedManager] setLanguage:@"Ch"];
    [self initScreen];
}

-(void)initMenu
{
    
    CCMenuItemImage *itemStart = [CCMenuItemImage itemWithNormalImage:[self getFileName:@"page0/start_out"] selectedImage:[self getFileName:@"page0/start_over"] target:self selector:@selector(start:)];
    CCMenuItemImage *itemLanguageEn = [CCMenuItemImage itemWithNormalImage:@"page0/language1_out_Ch.png" selectedImage:@"page0/language1_over_Ch.png"];
    
  
    CCMenuItemImage *itemLanguageCh = [CCMenuItemImage itemWithNormalImage:@"page0/language2_out_En.png" selectedImage:@"page0/language2_over_En.png"];
    
    CCMenuItemToggle *menuLanguage;
    if ([[MusicManager sharedManager] language]==@"Ch"){
        menuLanguage =[CCMenuItemToggle itemWithTarget:self selector:@selector(setEnglish:) items:itemLanguageCh,itemLanguageEn, nil];
        /*
        menuLanguage= [CCMenuItemToggle itemWithBlock:^(id sender){
            [[MusicManager sharedManager] setLanguage:@"En"];
            [self initScreen];
        } items:itemLanguageCh,itemLanguageEn, nil];
         */
    }else{
        menuLanguage =[CCMenuItemToggle itemWithTarget:self selector:@selector(setChinese:) items:itemLanguageEn,itemLanguageCh,nil];
        /*
        menuLanguage= [CCMenuItemToggle itemWithBlock:^(id sender){
            [[MusicManager sharedManager] setLanguage:@"Ch"];
            [self initScreen];
        } items:itemLanguageEn,itemLanguageCh, nil];
         */
    }
    
    
    //reading settings
    CCMenuItemImage *itemReadAuto =[CCMenuItemImage itemWithNormalImage:[self getFileName:@"page0/sound1_out"] selectedImage:[self getFileName:@"page0/sound1_over"]];
    CCMenuItemImage *itemReadManual =[CCMenuItemImage itemWithNormalImage:[self getFileName:@"page0/sound2_out"] selectedImage:[self getFileName:@"page0/sound2_over"]];
    
    
    CCMenuItemToggle *menuRead;
    if ([[MusicManager sharedManager] isAutoPaging]){
        menuRead =[CCMenuItemToggle itemWithItems:@[itemReadManual,itemReadAuto] block:^(id sender){
            [[MusicManager sharedManager] setAutoPaging:![(CCMenuItemToggle *)sender selectedIndex]];
        } ];
    }
    else{
        menuRead =[CCMenuItemToggle itemWithItems:@[itemReadAuto,itemReadManual] block:^(id sender){
            [[MusicManager sharedManager] setAutoPaging:[(CCMenuItemToggle *)sender selectedIndex]];
        }];
    }
    // music settings
    
    CCMenuItemImage *itemMusicOn =[CCMenuItemImage itemWithNormalImage:[self getFileName:@"page0/music1_out"] selectedImage:[self getFileName:@"page0/music1_over"]];
    CCMenuItemImage *itemMusicOff =[CCMenuItemImage itemWithNormalImage:[self getFileName:@"page0/music2_out"] selectedImage:[self getFileName:@"page0/music2_over"]];
    
    
    CCMenuItemToggle *menuMusic;
    if ([[MusicManager sharedManager] isBackgroundMusicPlaying]){
        menuMusic =[CCMenuItemToggle itemWithItems:@[itemMusicOn,itemMusicOff] block:^(id sender){
            if ([(CCMenuItemToggle *)sender selectedIndex])
                [[MusicManager sharedManager] pause];
            else
                [[MusicManager sharedManager] resume];
        }];
    }
    else{
        menuMusic =[CCMenuItemToggle itemWithItems:@[itemMusicOff,itemMusicOn] block:^(id sender){
            if ([(CCMenuItemToggle *)sender selectedIndex])
                [[MusicManager sharedManager] resume];
            else
                [[MusicManager sharedManager] pause];
        } ];
    }
    
    //sound settings
    CCMenuItemImage *itemSoundOn =[CCMenuItemImage itemWithNormalImage:[self getFileName:@"page0/read2_out"] selectedImage:[self getFileName:@"page0/read2_over"]];
    CCMenuItemImage *itemSoundOff =[CCMenuItemImage itemWithNormalImage:[self getFileName:@"page0/read1_out"] selectedImage:[self getFileName:@"page0/read1_over"]];
    
    
    CCMenuItemToggle *menuSound;
    if ([[MusicManager sharedManager] isEffects]){
        menuSound =[CCMenuItemToggle itemWithItems:@[itemSoundOn,itemSoundOff] block:^(id sender){
            [[MusicManager sharedManager] setEffects:![(CCMenuItemToggle *)sender selectedIndex]];
        }];
    }
    else{
        menuSound =[CCMenuItemToggle itemWithItems:@[itemSoundOff,itemSoundOn] block:^(id sender){
            [[MusicManager sharedManager] setEffects:[(CCMenuItemToggle *)sender selectedIndex]];
        }];
    }
    

    
    
    
    
    CCMenu *mainMenu =[CCMenu menuWithItems:itemStart,menuRead,menuLanguage,menuMusic,menuSound, nil];
    mainMenu.position =CGPointZero;
    [self addChild:mainMenu z:0 tag:MAINMENU_TAG];
    int yPos = 100;
    menuRead.position=ccp(524,yPos);
    menuLanguage.position = ccp(624,yPos);
    menuSound.position=ccp(724,yPos);
    menuMusic.position=ccp(824,yPos);
    itemStart.position=ccp(954,yPos);
    
}
-(void)start:(id)sender
{
    [self nextPage];
}
-(void)popupSettings
{}
@end
