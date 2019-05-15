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
    
    // call log in method
    [ self login ];
    
    // authenticated user
    BOOL user = [ FIRAuth auth ].currentUser ;
    
    // log in user respond
    if ( user ) {
        NSLog( @"it is a user !");
    }
    else {
         self->loginValidateText.text = @"Unsuccessfull sign in";
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

-(void)login {
                 // listen the authStateChangeListener
                 [ self viewWillAppear: true ];
 
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


-(void)viewWillAppear:(BOOL)animated
{
    
    // listen for authentication state ``added listener``
    self.ref = [[FIRAuth auth]
                   addAuthStateDidChangeListener:^(FIRAuth *_Nonnull auth, FIRUser *_Nullable user) {
                       

                       
                       // validate email format
                       BOOL correctEmail =  [ self validEmail: self->loginEmailTF.text ];
                       
                       // sign in
                       [[FIRAuth auth] signInWithEmail: self->loginEmailTF.text
                                              password: self->loginPasswordTF.text
                                            completion:^(FIRAuthDataResult * _Nullable authResult,
                                                         NSError * _Nullable error) {
                                                
                                                
                                                                        // check the the log in success .. go to the next page
                                                                        if ( user && correctEmail ) {
                                                                            
                                                                            // perform segue
                                                                            //trigger segue if register success
                                                                            UIStoryboard *mainStoryboard = [ UIStoryboard storyboardWithName:@"Sidebar" bundle: nil ];
                                                                            UIViewController *vc = [ mainStoryboard instantiateViewControllerWithIdentifier: @"sidebarNC"];
                                                                            [ self presentViewController: vc animated: YES completion: nil ];
                                                                            
                                                                            NSLog (@"%@", [ FIRAuth auth ].currentUser.uid );
                                                                            NSLog( @"Logging in ... !");
                                                                            NSLog( @"Currently signed in ``Login page``");
                                                                            
                                                                        }else if ( !user  || !correctEmail ) {
                                                                           // self->loginValidateText.text = @"Unsuccessfull sign in";
                                                                           // NSLog( @"Unsuccessfull sign in" );
                                                                        }else {
                                                                            NSLog( @"Unsuccessfull sign in" );
                                                                        }
                                                
                                                                    }];
                   }];
}

- (void)viewWillDisappear:(BOOL)animated {

   [[FIRAuth auth] removeAuthStateDidChangeListener: _ref];
    
}



@end

