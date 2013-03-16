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
    _isShowIndex = YES;
    _index =0;
    [self initView];
   
    
    CCMenuItemImage *itemStart = [CCMenuItemImage itemWithNormalImage:@"WALLPAPER/WALLPAPER_save00.png" selectedImage:@"WALLPAPER/WALLPAPER_save01.png" target:self selector:@selector(save)];
    CCMenu *mainMenu =[CCMenu menuWithItems:itemStart, nil];
    mainMenu.position =CGPointZero;
    [self addChild:mainMenu z:999];
    CGFloat h =[[CCDirector sharedDirector] winSize].height;
    itemStart.position=ccp(62 ,h-184);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(touchHappen:) name:@"TouchSprite" object:nil];
    
}
-(void)touchHappen:(NSNotification *)notification{
    //NSLog(@"%@",[notification object]);
    TouchSprite *item = (TouchSprite *)[notification object];
    NSLog(@"%@",item);
    _index =item.tag-TAG_MENU;
    [self initView];
}
-(void)goLeft{
    _index++;
    if (_index>=14){
        _index =0;
    }
    [self initView];
}

-(void)goRight{
    _index--;
    if (_index<=-1){
        _index=13;
    }
    [self initView];
}
-(void)save{
    NSLog(@"saving...");
    
    UIImage *image = [UIImage imageNamed:[self getbk]];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
}
-(void)initView{
    CCSprite *bg =(CCSprite *)[self getChildByTag:TAG_BACKGROUND];
    if (bg){
        [bg removeFromParentAndCleanup:YES];
    }
    bg =[CCSprite spriteWithFile:[self getbk]];
    [self addChild:bg z:0 tag:TAG_BACKGROUND];
    bg.anchorPoint=CGPointZero;
    
    for(int i=0;i<14;i++){
        NSString *name;
        if (i==_index){
            name = [NSString stringWithFormat:@"WALLPAPER/w%02d.png",i*2];
        }else{
            name = [NSString stringWithFormat:@"WALLPAPER/w%02d.png",i*2+1];
        }
        int x=50+i*69;
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
}
-(NSString *)getbk{
    return [NSString stringWithFormat:@"WALLPAPER/WALLPAPER%02d.png",_index];
}
-(void)handleTap:(UITapGestureRecognizer *)tap{
    _isShowIndex = !_isShowIndex;
    [self initView];
}
@end
