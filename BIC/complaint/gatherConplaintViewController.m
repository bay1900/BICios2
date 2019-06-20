//
//  gatherConplaintViewController.m
//  BIC
//
//  Created by phongpadid on 5/27/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "gatherConplaintViewController.h"


@interface gatherConplaintViewController ()

@end

@implementation gatherConplaintViewController

@synthesize  orderIDTF, conplaintData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.orderIDTF.delegate = self;
    
  }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [orderIDTF resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)txtView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
   
     if ( [text isEqualToString: @"\n"])
     {
         [ conplaintData resignFirstResponder];
         return  NO;
     }
    
    return  YES; 
}

- (IBAction)sendButton:(id)sender {
    
    // timestamp since 1970
    NSUInteger currentTime = [[ NSDate date ] timeIntervalSince1970 ];
    NSString *complaintTimestamp = [ NSString stringWithFormat: @"%ld", currentTime ];
    
    NSString *stringOrderID = orderIDTF.text;
    NSString *stringTextView = conplaintData.text;
    
    NSString *userAuth = [FIRAuth auth].currentUser.uid;
    
    self.ref = [[[FIRDatabase database] reference] child: @"complaint"];
    
    NSDictionary *complaint = [[ NSDictionary alloc ] init ];
    complaint = @{
                  @"complaintTimestamp" :  complaintTimestamp,
                  @"userID" : userAuth,
                  @"complaintORderID" : stringOrderID,
                  @"complaintInfo" : stringTextView
                  
                  };
    [[self->_ref child:complaintTimestamp ]  setValue: complaint];
    
    NSLog( @" COMPLAINT SENT ! ");
}
@end
