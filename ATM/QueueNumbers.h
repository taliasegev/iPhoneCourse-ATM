//
//  QueueNumbers.h
//  ATM
//
//  Created by taliasegev on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Queue.h"

@interface QueueNumbers : Queue{
    
    Queue *timeStamp;
    
}
    

-(id)initWithMaxSize:(int) size;
-(id)init;

-(void)addNumber:(int)number;
-(int)minNumber;
-(int)maxNumber;
-(NSString *)showDescription;



@end
