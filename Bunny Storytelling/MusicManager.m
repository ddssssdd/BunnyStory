//
//  MusicManager.m
//  MusicTrivia
//
//  Created by Steven Fu on 9/1/11.
//  Copyright 2011 synvata.com. All rights reserved.
//

#import "MusicManager.h"
#import "SimpleAudioEngine.h"

@implementation MusicManager
static MusicManager *instance=nil;


+(MusicManager *)sharedManager{
    if (instance==nil){
        instance=[[MusicManager alloc] init];
    }
    return instance;
}
- (id)init
{
    self = [super init];
    if (self) {
        _language=@"En";     
       
        _isEffects=YES;
        _isPaging =NO;
    }
    
    return self;
}
-(void)pause
{
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    [engine pauseBackgroundMusic];
    
}
-(void)resume
{
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    [engine resumeBackgroundMusic];
    
}
-(BOOL)isBackgroundMusicPlaying
{
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    return [engine isBackgroundMusicPlaying];
    
}
-(BOOL)mute
{
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    return [engine mute];
    
}
-(BOOL)isEffects
{
    return _isEffects;
}
-(void)setEffects:(BOOL)s
{
    _isEffects=s;
    if ((!_isEffects) && (_currentEffects))
    {
        SimpleAudioEngine *engine =[SimpleAudioEngine sharedEngine];
        [engine stopEffect:_currentEffects];
        _currentEffects =0;
    }
        
}
-(void)stopEffects
{
    SimpleAudioEngine *engine =[SimpleAudioEngine sharedEngine];
    [engine stopEffect:_currentEffects];
    _currentEffects =0;
}


-(void)setMute:(BOOL)m
{
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    [engine setMute:m];
}

-(NSString *)language
{
    return _language;
}
-(void)setLanguage:(NSString *)lan
{
    _language= lan;
}
-(BOOL)isAutoPaging
{
    return _isPaging;
}
-(void)setAutoPaging:(BOOL)p
{
    _isPaging =p;
}

-(void)playBackground;
{
    
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    //[engine playBackgroundMusic:@"rabbitbgm.caf" loop:YES];
    [engine playBackgroundMusic:@"Kuqi.mp3" loop:YES];

}
-(void)Play1{
    if (!_isEffects)
        return;
    
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    //[engine stopBackgroundMusic];
    _currentEffects =[engine playEffect:[NSString stringWithFormat:@"Page 1-%@.mp3",_language] ];
    
}
-(void)Play2{
    if (!_isEffects)
        return;
    
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:[NSString stringWithFormat:@"Page 2-%@.mp3",_language] ];
    
}
-(void)Play3
{
    if (!_isEffects)
        return;
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:[NSString stringWithFormat:@"Page 3-%@.mp3",_language] ];
}
-(void)Play4
{
    if (!_isEffects)
        return;
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:[NSString stringWithFormat:@"Page 4-%@.mp3",_language] ];
}
-(void)Play5
{
    if (!_isEffects)
        return;
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:[NSString stringWithFormat:@"Page 5-%@.mp3",_language] ];
}
-(void)Play6
{
    if (!_isEffects)
        return;
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:[NSString stringWithFormat:@"Page 6-%@.mp3",_language] ];
}
-(void)Play7
{
    if (!_isEffects)
        return;
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:[NSString stringWithFormat:@"Page 7-%@.mp3",_language] ];
}
-(void)Play8
{
    if (!_isEffects)
        return;
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:[NSString stringWithFormat:@"Page 8-%@.mp3",_language] ];
}
-(void)PlayEnd
{}

-(void)Play1_1{
    if (!_isEffects)
        return;
    
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    //[engine stopBackgroundMusic];
    _currentEffects =[engine playEffect:[NSString stringWithFormat:@"Page 1_%@.caf",_language] ];
    
}
-(void)Play1_2{
    if (!_isEffects)
        return;
    
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:[NSString stringWithFormat:@"Page 2_%@.caf",_language] ];
    
}
-(void)Play1_3
{
    if (!_isEffects)
        return;
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:[NSString stringWithFormat:@"Page 3_%@.caf",_language] ];
}
-(void)Play1_4
{
    if (!_isEffects)
        return;
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:[NSString stringWithFormat:@"Page 4_%@.caf",_language] ];
}
-(void)Play1_5
{
    if (!_isEffects)
        return;
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:@"page5.mp3"];
}
-(void)Play1_6
{
    if (!_isEffects)
        return;
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:[NSString stringWithFormat:@"Page 6_%@.caf",_language] ];
}
-(void)Play1_7
{
    if (!_isEffects)
        return;
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:[NSString stringWithFormat:@"Page 7_%@.caf",_language] ];
}
-(void)Play1_8
{
    if (!_isEffects)
        return;
    SimpleAudioEngine *engine=[SimpleAudioEngine sharedEngine] ;
    _currentEffects = [engine playEffect:[NSString stringWithFormat:@"Page 8_%@.caf",_language] ];
}

@end
