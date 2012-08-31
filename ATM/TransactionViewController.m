//
//  TransactionViewController.m
//  ATM
//
//  Created by taliasegev on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TransactionViewController.h"

@interface TransactionViewController ()

@end

@implementation TransactionViewController
@synthesize account;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [account deposit:20];
//    [account deposit:40];
//    [account withdrawal:10];
    
   // NSSTring *lastAction = account.
    NSArray *lastActions = [account getLastActions];
    NSString *lastActionStr;
    int lastActionNumber = [[lastActions lastObject] intValue];
     
    if (lastActionNumber > 0) {
        lastActionStr = [[NSString alloc]initWithFormat:@"You deposit %d$", abs(lastActionNumber)];
    }
    else {
        lastActionStr = [[NSString alloc]initWithFormat:@"You withdrew %d$", abs(lastActionNumber)];
    }
    
    
    balanceLabel.text = [[NSString alloc]initWithFormat:@"Your current balance is %d",account.balance];
    lastActionLabel.text = [[NSString alloc]initWithFormat:@"%@ %@",[account getNowHour],lastActionStr];
    lastActionsDescription.text = [account showDescription];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)dismissSelf:(id)sender{
    
    [self dismissModalViewControllerAnimated:YES];
    
}

@end
