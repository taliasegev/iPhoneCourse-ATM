//
//  TransactionViewController.h
//  ATM
//
//  Created by taliasegev on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"

@interface TransactionViewController : UIViewController{
    
    Account *account;
    
    IBOutlet UILabel *balanceLabel;
    IBOutlet UILabel *lastActionLabel;
    IBOutlet UITextView *lastActionsDescription;
    
        
}

@property (nonatomic, strong) Account* account;

-(IBAction)dismissSelf:(id)sender;




@end
