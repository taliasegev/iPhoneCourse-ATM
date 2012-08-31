//
//  ATMViewController.m
//  ATM
//
//  Created by taliasegev on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ATMViewController.h"
#import "Queue.h"
#import "QueueNumbers.h"
#import "TransactionViewController.h"

int const WITHDRAW = 0;
int const DEPOSIT = 1;


@interface ATMViewController ()

@end

@implementation ATMViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    Queue *queue = [[Queue alloc]init];
    [queue addItem:[[NSNumber alloc]initWithInt:1]];
    [queue addItem:[[NSNumber alloc]initWithInt:2]];
    [queue addItem:[[NSNumber alloc]initWithInt:3]];
    [queue addItem:[[NSNumber alloc]initWithInt:4]];
    [queue addItem:[[NSNumber alloc]initWithInt:5]];
    [queue addItem:[[NSNumber alloc]initWithInt:6]];
    [queue addItem:[[NSNumber alloc]initWithInt:7]];
    [queue addItem:[[NSNumber alloc]initWithInt:8]];
    [queue addItem:[[NSNumber alloc]initWithInt:9]];
    
    NSLog(@"%@", queue);
    
    QueueNumbers *queueNumbers = [[QueueNumbers alloc]init];
    [queueNumbers addNumber:1];
    [queueNumbers addNumber:3];
    [queueNumbers addNumber:6];
    [queueNumbers addNumber:9];
    [queueNumbers addNumber:12];
    [queueNumbers addNumber:15];
    [queueNumbers addNumber:18];
    [queueNumbers addNumber:21];
    [queueNumbers addNumber:24];
   


    NSLog(@"%@", queueNumbers);
     NSLog(@"min number is %d", [queueNumbers minNumber]);
     NSLog(@"max number is %d", [queueNumbers maxNumber]);
    
    account = [[Account alloc]initWithBalance:0];
    actionType = WITHDRAW;
    amount = 0;
    
        
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


-(IBAction)actionChange:(id)sender{
    
    UISegmentedControl *segmentedControl = (UISegmentedControl*)sender;
    actionType = [segmentedControl selectedSegmentIndex];
    [self showConfirmationLabel];
    NSLog(@"actionChange cuurent actionType = %d", actionType);
  

}


-(IBAction)showConfirmationLabel{
    if (amount != 0) {
         
    NSString *actionTypeStr;
    
    if (actionType == WITHDRAW) {
        actionTypeStr = @"drawing";
    }
    else
        actionTypeStr = @"deposit";    
    
    confirmationQuestionLabel.text = [[NSString alloc]initWithFormat:@"Confirm %@ %d$?",actionTypeStr,amount];
    }
    
}


-(IBAction)amountChange:(id)sender{
    UISlider *slider = (UISlider *)sender;
    int value = (int)[slider value];
    amount = value;
    amountLabel.text = [[NSString alloc] initWithFormat:@"%d$",amount];
    [self showConfirmationLabel];
    
}

-(IBAction)doTransaction:(id)sender{
    if (actionType == WITHDRAW) {
        [account withdrawal:amount];
    }
    else if (actionType == DEPOSIT){
        [account deposit:amount];
    }
//   Log: 
//    ○ the updated balance.
//    ○ the five last actions.
//    ○ the max deposit in the five last actions.
//    ○ the max withdrawal in the five last action.
    NSLog(@"balance: %d",[account balance]);
    NSLog(@"last actions: %@",account );
    NSLog(@"max deposit: %d",[account maxDeposit]);
    NSLog(@"max withdrawal: %d",[account maxWithdrawal]);
      
    TransactionViewController *viewController = [[TransactionViewController alloc]initWithNibName:@"TransactionViewController" bundle:nil];
    viewController.account = account;
    [self presentModalViewController:viewController animated:YES];
    

}


@end
