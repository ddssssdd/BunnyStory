//
//  IUpdateLanguage.h
//  RabbitStory
//
//  Created by Fu Steven on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IUpdateLanguage <NSObject>

-(void)update;
-(void)pauseReading;
-(void)resumeReading;

@end
