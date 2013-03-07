//
//  MusicManager.h
//  MusicTrivia
//
//  Created by Steven Fu on 9/1/11.
//  Copyright 2011 synvata.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@interface MusicManager : NSObject
{
    NSString* _language;
    BOOL _isEffects;
  
    BOOL _isPaging;
    unsigned int _currentEffects;
}
+(MusicManager *)sharedManager;

-(BOOL)isBackgroundMusicPlaying;
-(void)pause;
-(void)resume;
-(BOOL)mute;
-(void)setMute:(BOOL)m;

-(BOOL)isEffects;
-(void)setEffects:(BOOL)s;



-(BOOL)isAutoPaging;
-(void)setAutoPaging:(BOOL)p;

-(NSString *)language;
-(void)setLanguage:(NSString *)lan;

-(void)stopEffects;
-(void)playBackground;
-(void)Play1;
-(void)Play2;
-(void)Play3;
-(void)Play4;
-(void)Play5;
-(void)Play6;
-(void)Play7;
-(void)Play8;
-(void)Play1_1;
-(void)Play1_2;
-(void)Play1_3;
-(void)Play1_4;
-(void)Play1_5;
-(void)Play1_6;
-(void)Play1_7;
-(void)Play1_8;
-(void)PlayEnd;
@end
