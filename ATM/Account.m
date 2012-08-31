//
//  Account.m
//  ATM
//
//  Created by noa brodezky on 07/08/12.
//
//

#import "Account.h"

@implementation Account



-(id)initWithBalance:(int) initBalance{
    
    
    self = [super init];
    
    if (self) {
        balance = initBalance;
        actions = [[QueueNumbers alloc]initWithMaxSize:5];
        lastTransactionDate = [NSDate date];

    }
    return self;
    
}


-(int)balance{
    return balance;
}

-(NSString *)getNowHour{

    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit| NSMinuteCalendarUnit fromDate:lastTransactionDate];
    int hour = [components hour];
    int minute = [components minute];
    return [[NSString alloc]initWithFormat:@"%d:%d",hour,minute];
    
}


-(void)deposit:(int) cash{
    balance +=cash;
    [actions addNumber:cash];
    lastTransactionDate = [NSDate date];
    
}

-(void)withdrawal:(int) cash{
    balance -= cash;
    [actions addNumber:(cash * -1)];
    lastTransactionDate = [NSDate date];

}


-(int)maxWithdrawal{
    int min = [actions minNumber];
    if (min < 0) {
        return -min;
    }
    return 0;
}
-(int)maxDeposit{
    if ([actions maxNumber] > 0) {
        return [actions maxNumber];
    }
    return 0;
}

-(NSString *)description{
    return [[NSString alloc]initWithFormat:@"actions: %@",actions];    
}

-(NSString *)showDescription{
    return [actions showDescription];    
}

-(NSArray *)getLastActions{
    return [actions getItems];
    
}


@end
