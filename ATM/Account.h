//
//  Account.h
//  ATM
//
//  Created by noa brodezky on 07/08/12.
//
//

#import <Foundation/Foundation.h>
#import "QueueNumbers.h"


@interface Account : NSObject{
    
    //iVars
    
    int balance;
    NSDate *lastTransactionDate;
    QueueNumbers *actions;
}

-(id)initWithBalance:(int) initBalance;
-(int)balance;
-(void)deposit:(int) cash;
-(void)withdrawal:(int) cash;
-(int)maxWithdrawal;
-(int)maxDeposit;
-(NSArray *)getLastActions;
-(NSString *)showDescription;
-(NSString *)getNowHour;






@end
