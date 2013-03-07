//
//  PageSettings.h
//  RabbitStory
//
//  Created by Fu Steven on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "IUpdateLanguage.h"

@interface PageSettings : CCLayer {
    
}
@property (retain,nonatomic) id<IUpdateLanguage> hostLayer;
-(void)initScreen;
-(NSString *)getFileName:(NSString *)filename;
@end
