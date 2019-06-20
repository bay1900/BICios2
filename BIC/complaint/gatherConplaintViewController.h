//
//  gatherConplaintViewController.h
//  BIC
//
//  Created by phongpadid on 5/27/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
NS_ASSUME_NONNULL_BEGIN

@interface gatherConplaintViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *orderIDTF;
@property (strong, nonatomic) IBOutlet UITextView *conplaintData;

- (IBAction)sendButton:(id)sender;

// firebase databse
// firebase database reference
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

NS_ASSUME_NONNULL_END
