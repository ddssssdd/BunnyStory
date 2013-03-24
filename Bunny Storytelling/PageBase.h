//
//  PageBase.h
//  RabbitStory
//
//  Created by Fu Steven on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "IUpdateLanguage.h"

@interface PageBase : CCLayer <IUpdateLanguage>{
    int _pageNo;
    int _story_index;
    BOOL _isAutoPaging;
    BOOL _hasBackHomeButton;
    NSTimer* _timer;
    //NSTimer* _pageTimer;
    CGPoint textPoint;
    NSString *backbuttonName1;
    NSString *backbuttonName2;
}
-(void)initScreen;

-(void)nextPage;

-(void)priorPage;

-(void)popupSettings;

-(void)goHomePage;
-(void)addAnimation:(NSString *)name count:(int)count x:(CGFloat)x y:(CGFloat)y animationTime:(CGFloat)animationTime randomStop:(BOOL)randomStop;

-(void)addAnimation:(NSString *)name count:(int)count x:(CGFloat)x y:(CGFloat)y animationTime:(CGFloat)animationTime;
-(void)addAnimation:(NSString *)name count:(int)count x:(CGFloat)x y:(CGFloat)y;
-(void)playSound;
-(NSString *)getFileName:(NSString *)filename;
-(NSString *)getFileName:(NSString *)filename ext:(NSString *)ext;
-(void)addText;
-(void)update;
-(void)pauseReading;

-(void)goLeft;
-(void)goRight;

-(void)handleTap:(UITapGestureRecognizer *)tap;
@end
