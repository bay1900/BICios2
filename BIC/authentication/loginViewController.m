//
//  loginViewController.m
//  BIC
//
//  Created by phongpadid on 4/4/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

@synthesize loginValidateText;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
            // check if user hasn't log out redirect them somewhere
            // they have already signed in // token still alive
            if ( [ FIRAuth auth ].currentUser ) {
                NSLog( @"Currently signed in");
                
            }else {
                NSLog( @"Not signed in yet !" );
            }
    
    
    
            // Log out firebase session
            NSError *signOutError;
            BOOL status = [[FIRAuth auth] signOut:&signOutError];
            if (!status) {
                NSLog(@"Error signing out: %@", signOutError);
                return;
            }else{
                NSLog(@"Successfully Signout");
            }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButton:(id)sender {
 

    BOOL user = [FIRAuth auth].currentUser.uid;
    
    
    // validate email
    BOOL correctEmail =  [ self validEmail: _loginEmail.text ];
    
    // validate password
   // BOOL correctPassword = [ self validPassword: _loginPassword.text ];

    
    
              // if user not currently log in and email textfield is in correct format
               if ( !user && correctEmail  ) {
                
                            [[FIRAuth auth] signInWithEmail:  _loginEmail.text
                                                   password:  _loginPassword.text
                                                 completion:^(FIRAuthDataResult * _Nullable authResult,
                                                              NSError * _Nullable error) {
                                                     // ...
                                                 }];

                            // perform segue
                            // trigger segue if register success
                            UIStoryboard *mainStoryboard = [ UIStoryboard storyboardWithName:@"Sidebar" bundle: nil ];
                            UIViewController *vc = [ mainStoryboard instantiateViewControllerWithIdentifier: @"sidebarPage"];
                            [ self presentViewController: vc animated: YES completion: nil ];
                
                             NSLog( @"Logging in ... !");
        
                }
                else {
                            loginValidateText.text = @"Unsuccessful login please check your email and password .. ! ";
                            NSLog( @"Unsuccessful login please check your email and password .. ! ");
               }
}



- (BOOL) validEmail:(NSString*) emailString {
    
            if([emailString length]==0){
                return NO;
            }
    
            NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
            NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
            NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    
            NSLog(@"%lu", (unsigned long)regExMatches);
    
            if (regExMatches == 0) {
                NSLog ( @"Email is not in correct format");
                return NO;
            } else {
                NSLog ( @"Email is in format ");
                return YES;
            }
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog( @"applicationDidEnterBackground");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog( @"applicationDidBecomeActive");

}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog( @"applicationWillTerminate");

}


@end
