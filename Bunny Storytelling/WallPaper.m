//
//  WallPaper.m
//  Bunny Storytelling
//
//  Created by Fu Steven on 3/14/13.
//
//

#import "WallPaper.h"
#import "TouchSprite.h"


#define TAG_BACKGROUND 1
#define TAG_MENU 2
#define TAG_MAINMENU 999
#define TAG_LABEL 998
@interface WallPaper(){
    int _index;
    BOOL _isShowIndex;
}
@end

@implementation WallPaper
+(CCScene *)scene{
    CCScene *scene = [CCScene node];
    WallPaper *d1 = [WallPaper node];
    [scene addChild:d1];
    return  scene;
}
-(void)initScreen{
    _hasBackHomeButton=YES;
    _isShowIndex = YES;
    _index =0;
    dir =0;
    [self initView];
   
    
    CCMenuItemImage *itemStart = [CCMenuItemImage itemWithNormalImage:@"WALLPAPER/WALLPAPER_save00.png" selectedImage:@"WALLPAPER/WALLPAPER_save01.png" target:self selector:@selector(save)];
    CCMenu *mainMenu =[CCMenu menuWithItems:itemStart, nil];
    mainMenu.position =CGPointZero;
    [self addChild:mainMenu z:999 tag:TAG_MAINMENU];
    CGFloat h =[[CCDirector sharedDirector] winSize].height;
    itemStart.position=ccp(67 ,h-184);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(touchHappen:) name:@"TouchSprite" object:nil];
    
    
}
-(void)touchHappen:(NSNotification *)notification{
    //NSLog(@"%@",[notification object]);
    TouchSprite *item = (TouchSprite *)[notification object];
    NSLog(@"%@",item);
    _index =item.tag-TAG_MENU;
    dir =0;
    [self initView];
}
-(void)goLeft{
    if (_isShowIndex){
        return;
    }
    dir =-1;
    _index++;
    if (_index>=14){
        _index =0;
    }
    [self initView];
}

-(void)goRight{
    if (_isShowIndex){
        return;
    }
    dir=1;
    _index--;
    if (_index<=-1){
        _index=13;
    }
    [self initView];
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSLog(@"%@",error);
    if (!error){
        CGSize s = [[CCDirector sharedDirector] winSize];
        
        CCLabelTTF* label = [CCLabelTTF labelWithString:@"Saved successfully." fontName:@"Arial" fontSize:32];
        [self addChild: label z:1 tag:TAG_LABEL];
        [label setPosition: ccp(s.width/2, s.height/2)];
        CCJumpTo *jump = [CCJumpTo actionWithDuration:2 position:ccp(0,0) height:s.height/2 jumps:1];
        CCCallBlock *callback = [CCCallBlock actionWithBlock:^{
            [self removeChildByTag:TAG_LABEL cleanup:YES];
        }];
        [label runAction:[CCSequence actions:jump,callback, nil]];
    }
}
-(void)save{
    NSLog(@"saving...");
    
    UIImage *image = [UIImage imageNamed:[self getbk]];
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}
-(void)changeBg{
    CCSprite *bg =(CCSprite *)[self getChildByTag:TAG_BACKGROUND];
    if (bg){
        
        [bg removeFromParentAndCleanup:YES];
    }
    

}
-(void)restore_bg_tag{
    CCSprite *bg =(CCSprite *)[self getChildByTag:TAG_BACKGROUND+100];
    if (bg){
        bg.tag =TAG_BACKGROUND;
    }
}
-(void)initView{
    
    
    CCSprite *bg =(CCSprite *)[self getChildByTag:TAG_BACKGROUND];
    if (bg){
        if (dir==0){
            [bg removeFromParentAndCleanup:YES];
        }else{
            CCMoveTo *action =[CCMoveTo actionWithDuration:0.5 position:ccp(1024*dir,0)];
            
            CCCallFunc *remove=[CCCallFunc actionWithTarget:self  selector:@selector(changeBg)];
            CCSequence *sequ =[CCSequence actions:action,remove, nil];
            [bg runAction:sequ];

        }
               
    }
    if (dir==0){
        CCSprite *bg2 =[CCSprite spriteWithFile:[self getbk]];
        [self addChild:bg2 z:0 tag:TAG_BACKGROUND];
        bg2.anchorPoint=CGPointZero;
    }else{
        CCSprite *bg2 =[CCSprite spriteWithFile:[self getbk]];
        [self addChild:bg2 z:0 tag:TAG_BACKGROUND+100];
        bg2.anchorPoint=CGPointZero;
        bg2.position=ccp(-1024*dir,0);
        CCMoveTo *action1 =[CCMoveTo actionWithDuration:0.5 position:ccp(0,0)];
        CCCallFunc *restore_tg=[CCCallFunc actionWithTarget:self  selector:@selector(restore_bg_tag)];
        [bg2 runAction:[CCSequence actions:action1,restore_tg,nil]];
    }
   
    
    
   
    
    for(int i=0;i<14;i++){
        NSString *name;
        if (i==_index){
            name = [NSString stringWithFormat:@"WALLPAPER/w%02d.png",i*2];
        }else{
            name = [NSString stringWithFormat:@"WALLPAPER/w%02d.png",i*2+1];
        }
        int x=63+i*69;
        int y=66;
        TouchSprite *item = (TouchSprite *)[self getChildByTag:TAG_MENU+i];
        if (item){
            [item removeFromParentAndCleanup:YES];
        }
        if (_isShowIndex){
            item = [TouchSprite spriteWithFile:name];
            [self addChild:item z:0 tag:TAG_MENU+i];
            item.position=ccp(x,y);
        }
        
        
    }
    [[self getChildByTag:TAG_MAINMENU] setVisible:_isShowIndex];
    [[self getChildByTag:9999] setVisible:_isShowIndex];
}
-(NSString *)getbk{
    return [NSString stringWithFormat:@"WALLPAPER/WALLPAPER%02d.png",_index];
}
-(void)handleTap:(UITapGestureRecognizer *)tap{
    _isShowIndex = !_isShowIndex;
    dir =0;
    [self initView];
}
@end
