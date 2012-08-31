//
//  Queue.h
//  ATM
//
//  Created by taliasegev on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Queue : NSObject{
    
    //iVars
    
    NSMutableArray *items;
    int maxSize;
    
}

-(id)initWithMaxSize:(int) size;
-(id)init;

-(void)addItem:(id)item;
-(NSArray *)getItems;
-(NSString *)description;


   

@end




