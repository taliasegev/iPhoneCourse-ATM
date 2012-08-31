//
//  ATMViewController.h
//  ATM
//
//  Created by taliasegev on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"

@interface ATMViewController : UIViewController{
    
    Account *account;
    
    int actionType, amount;
    
    IBOutlet UILabel *amountLabel;
    IBOutlet UILabel *confirmationQuestionLabel;
}

-(IBAction)actionChange:(id)sender;
-(IBAction)amountChange:(id)sender;
-(IBAction)doTransaction:(id)sender;




@end
