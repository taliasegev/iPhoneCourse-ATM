//
//  Queue.m
//  ATM
//
//  Created by taliasegev on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Queue.h"

@implementation Queue

int const MAX_SIZE = 5;
-(id)initWithMaxSize:(int) size{
   
    self = [super init];
    
    if (self) {
       items = [[NSMutableArray alloc]initWithCapacity:size];
        maxSize = size;
    }
    return self;
}


-(id)init{
    return [self initWithMaxSize:MAX_SIZE];
    
}


-(void)addItem:(id)item{
    [items addObject:item];

    if ([items count] > maxSize) {
        [items removeObjectAtIndex:0];
    }
    
}

-(NSArray *)getItems{
    
    return [[NSArray alloc] initWithArray:items copyItems:YES];
    
    
}
-(NSString *)description{
   
    return [[NSString alloc] initWithFormat:@"items: %@", items];
    
}



@end
