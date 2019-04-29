//
//  loginViewController.m
//  BIC
//
//  Created by phongpadid on 4/4/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "loginViewController.h"
@import Firebase; //  firebase class connection


@interface loginViewController ()

@end

@implementation loginViewController

@synthesize loginValidateText, loginPasswordTF, loginEmailTF;

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
    BOOL correctEmail =  [ self validEmail: loginEmailTF.text ];
    
    // validate password
    // BOOL correctPassword = [ self validPassword: _loginPassword.text ];
    
    
    
    // if user not currently log in and email textfield is in correct format
    
    
    [[FIRAuth auth] signInWithEmail: @"gg@gg.com"
                               password: @"1111111111"
                             completion:^(FIRAuthDataResult * _Nullable authResult,
                                          NSError * _Nullable error) {
                                 
                                                             // check the the log in success .. go to the next page
                                                             if ( [ FIRAuth auth ].currentUser.uid ) {
                                                                
                                                                     // perform segue
                                                                      //trigger segue if register success
                                                                      UIStoryboard *mainStoryboard = [ UIStoryboard storyboardWithName:@"Sidebar" bundle: nil ];
                                                                      UIViewController *vc = [ mainStoryboard instantiateViewControllerWithIdentifier: @"sidebarNC"];
                                                                      [ self presentViewController: vc animated: YES completion: nil ];
                                                                 
                                                                 
                                                                      NSLog( @"Logging in ... !");
                                                                      NSLog( @"Currently signed ingfgfgfgfgfgffg");
                                                                 
                                                             }else {
                                                                      self->loginValidateText.text = @"Unsuccessfull sign in";
                                                                      NSLog( @"Not signed in yet !fvxcvcxvxcvxccxv" );
                                                             }
                                 
    }];
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
