//
//  QueueNumbers.m
//  ATM
//
//  Created by taliasegev on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QueueNumbers.h"

@implementation QueueNumbers



-(void)addNumber:(int)number{
    NSNumber *nsNumberObj = [[NSNumber alloc]initWithInt:number];
    [self addItem:nsNumberObj];
    
}

-(int)minNumber{
    NSNumber *min = [items valueForKeyPath:@"@min.self"];   
    return [min intValue];
}

-(int)maxNumber{
    NSNumber *max = [items valueForKeyPath:@"@max.self"];
    return [max intValue];
}


-(NSString *)showDescription{
    NSMutableString *description = [[NSMutableString alloc]init];
    
    for(int i=0;i<[items count];i++){
        int actionNumber = [[items objectAtIndex:i] intValue];
        if (actionNumber > 0) {
            [description appendString:@"deposit"];
             }else {
                 [description appendString:@"withdrawal"];
             }                 
        
        [description appendString:[[NSString alloc]initWithFormat:@" %d$\n",abs(actionNumber)]];
    }
    return description;
}
                                                                           
                                                                         


@end
