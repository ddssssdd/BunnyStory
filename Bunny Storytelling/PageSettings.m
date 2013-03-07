//
//  PageSettings.m
//  RabbitStory
//
//  Created by Fu Steven on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PageSettings.h"
#import "MusicManager.h"
#define MAINMENU_TAG 1
#define BACKGROUND_TAG 2
#define BG2_TAG 3
@implementation PageSettings
@synthesize hostLayer;
-(id)init{
    if ((self =[super init])){
        [self initScreen];
    }
    return self;
}
-(void)initScreen
{
   
    if ([self getChildByTag:BACKGROUND_TAG])
        [self removeChildByTag:BACKGROUND_TAG cleanup:YES];
    if ([self getChildByTag:MAINMENU_TAG])
        [self removeChildByTag:MAINMENU_TAG cleanup:YES];
    if ([self getChildByTag:BG2_TAG])
        [self removeChildByTag:BG2_TAG cleanup:YES];
    CCSprite *bg2 =[CCSprite spriteWithFile:@"blackbg.png"];
    [self addChild:bg2 z:0 tag:BG2_TAG];
    
    CCSprite *bg = [CCSprite spriteWithFile:[self getFileName:@"pageSettings/setbg"]];    
    [self addChild:bg z:0 tag:BACKGROUND_TAG];

    /*CCMenuItemImage *menuOk = [CCMenuItemImage itemWithNormalImage:[self getFileName:@"pageSettings/okbtn"] selectedImage:nil block:^(id sender){
        [self removeFromParentAndCleanup:YES];
        if (self.hostLayer)
            [self.hostLayer resumeReading];
    }];
     */
    CCMenuItemImage *menuOk = [CCMenuItemImage itemWithNormalImage:[self getFileName:@"pageSettings/okbtn"]  selectedImage:nil disabledImage:nil target:self selector:@selector(closeSettings)];
    CCMenuItemImage *itemLanguage_En=[CCMenuItemImage itemWithNormalImage:@"pageSettings/btnLanguage_Ch.png" selectedImage:nil];
    CCMenuItemImage *itemLanguage_Ch=[CCMenuItemImage itemWithNormalImage:@"pageSettings/btnLanguage_En.png" selectedImage:nil];
    CCMenuItemToggle *menuLanguage;
    if ([[MusicManager sharedManager] language]==@"Ch"){
        menuLanguage=[CCMenuItemToggle itemWithTarget:self selector:@selector(setEn) items:itemLanguage_Ch,itemLanguage_En,nil];
    }else{
        menuLanguage=[CCMenuItemToggle itemWithTarget:self selector:@selector(setCh) items:itemLanguage_En,itemLanguage_Ch,nil];
    }
    /*
    if ([[MusicManager sharedManager] language]==@"Ch"){
        menuLanguage=[CCMenuItemToggle itemWithItems:@[itemLanguage_Ch,itemLanguage_En] block:^(id sender){
            [[MusicManager sharedManager] setLanguage:@"En"];
            [self initScreen];
            if (self.hostLayer){
                [self.hostLayer update];
            }
        }];
    }else{
        menuLanguage=[CCMenuItemToggle itemWithItems:@[itemLanguage_En,itemLanguage_Ch] block:^(id sender){
            [[MusicManager sharedManager] setLanguage:@"Ch"];
            [self initScreen];
            if (self.hostLayer){
                [self.hostLayer update];
            }
        }];
    }
     */
    
    CCMenuItemImage *itemMusicOn = [CCMenuItemImage itemWithNormalImage:[self getFileName:@"pageSettings/btnMusicOn"] selectedImage:nil];
    CCMenuItemImage *itemMusicOff = [CCMenuItemImage itemWithNormalImage:[self getFileName:@"pageSettings/btnMusicOff"] selectedImage:nil];
    CCMenuItemToggle *menuMusic;
    if ([[MusicManager sharedManager] isBackgroundMusicPlaying]){
        menuMusic =[CCMenuItemToggle itemWithItems:@[itemMusicOn,itemMusicOff] block:^(id sender){
            if ([(CCMenuItemToggle *)sender selectedIndex])
                [[MusicManager sharedManager] pause];
            else
                [[MusicManager sharedManager] resume];
        }];
    }else{
        menuMusic =[CCMenuItemToggle itemWithItems:@[itemMusicOff,itemMusicOn] block:^(id sender){
            if ([(CCMenuItemToggle *)sender selectedIndex])
                [[MusicManager sharedManager] resume];
            else
                [[MusicManager sharedManager] pause];
        }];
    }
    
    CCMenuItemImage *itemSoundOn = [CCMenuItemImage itemWithNormalImage:[self getFileName:@"pageSettings/btnMusicOn"] selectedImage:nil];
    CCMenuItemImage *itemSoundOff = [CCMenuItemImage itemWithNormalImage:[self getFileName:@"pageSettings/btnMusicOff"] selectedImage:nil];
    CCMenuItemToggle *menuSound;
    if ([[MusicManager sharedManager] isEffects]){
        menuSound =[CCMenuItemToggle itemWithItems:@[itemSoundOn,itemSoundOff] block:^(id sender){
            [[MusicManager sharedManager] setEffects:![(CCMenuItemToggle*)sender selectedIndex]];
        } ];
    }else{
        menuSound =[CCMenuItemToggle itemWithItems:@[itemSoundOff,itemSoundOn,] block:^(id sender){
            [[MusicManager sharedManager] setEffects:[(CCMenuItemToggle*)sender selectedIndex]];
        }];
    }

    
    CCMenuItemImage *itemPagingOn = [CCMenuItemImage itemWithNormalImage:[self getFileName:@"pageSettings/btnPagingOn"] selectedImage:nil];
    CCMenuItemImage *itemPagingOff = [CCMenuItemImage itemWithNormalImage:[self getFileName:@"pageSettings/btnPagingOff"] selectedImage:nil];
    CCMenuItemToggle *menuPaging;
    if ([[MusicManager sharedManager] isAutoPaging]){
        menuPaging =[CCMenuItemToggle itemWithItems:@[itemPagingOn,itemPagingOff,] block:^(id sender){
            [[MusicManager sharedManager] setAutoPaging:![(CCMenuItemToggle*)sender selectedIndex]];            
        }];
    }else{
        menuPaging =[CCMenuItemToggle itemWithItems:@[itemPagingOff,itemPagingOn,] block:^(id sender){
           [[MusicManager sharedManager] setAutoPaging:[(CCMenuItemToggle*)sender selectedIndex]];            
        }];
    }
    
    CCMenu *menu =[CCMenu menuWithItems:menuOk,menuLanguage,menuMusic,menuPaging,menuSound,nil];
//    CCMenu *menu =[CCMenu menuWithItems:menuMusic,nil];
    [self addChild:menu z:0 tag:MAINMENU_TAG];
    
    menu.position=CGPointZero;
    int xPos=50;
    int dis=55;
    menuOk.position=ccp(xPos+160,170);
    menuSound.position=ccp(xPos,70);
    menuMusic.position=ccp(xPos,70-1*dis);
    menuPaging.position=ccp(xPos,70-2*dis);
    menuLanguage.position=ccp(xPos,70-3*dis);
    
    

    
}
-(void)closeSettings{
    [self removeFromParentAndCleanup:YES];
    if (self.hostLayer)
        [self.hostLayer resumeReading];
}
-(void)setEn{
    [[MusicManager sharedManager] setLanguage:@"En"];
    
    if (self.hostLayer){
        [self.hostLayer update];
    }
    [self initScreen];
}
-(void)setCh{
    [[MusicManager sharedManager] setLanguage:@"Ch"];
    
    if (self.hostLayer){
        [self.hostLayer update];
    }
    [self initScreen];
    
}
-(NSString *)getFileName:(NSString *)filename
{
    
    NSString *result=[NSString stringWithFormat:@"%@_%@.png",filename,[[MusicManager sharedManager] language]];
    NSLog(@"%@",result);
    return result;
}
@end
