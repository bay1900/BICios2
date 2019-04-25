//
//  loginViewController.h
//  BIC
//
//  Created by phongpadid on 4/4/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "registerViewController.h"

@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface loginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *loginEmail;
@property (weak, nonatomic) IBOutlet UITextField *loginPassword;

// log in validate rebel 
@property (weak, nonatomic) IBOutlet UILabel *loginValidateText;

- (IBAction)loginButton:(id)sender;


// this method imported from registerVC
- ( BOOL ) validEmail:(NSString*) emailString;
- ( BOOL ) validPassword: (NSString *) passwordString;
@end

NS_ASSUME_NONNULL_END
