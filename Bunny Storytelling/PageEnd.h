//
//  PageEnd.h
//  RabbitStory
//
//  Created by Fu Steven on 1/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PageBase.h"

@interface PageEnd : PageBase{
    BOOL isInMore;
}
@property (nonatomic) int index;
+(CCScene *)scene:(int)index;

@end
