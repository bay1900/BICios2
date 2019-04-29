//
//  mainViewController.m
//  BIC
//
//  Created by phongpadid on 4/18/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "mainViewController.h"
#import "registerViewController.h"
#import "accelerateViewController.h"
@interface mainViewController ()

@end

@implementation mainViewController

@synthesize sidePanel, menuBtn, transV;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // hide the navigation bar that inherit from landing page !
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
    

    
    // use the Gesture recognizer for hidding the sidebar !
    UITapGestureRecognizer *tapper = [[ UITapGestureRecognizer alloc ] initWithTarget: self action: @selector(hideSidePanel:)];
    
    tapper.numberOfTapsRequired = 1 ;
    [transV addGestureRecognizer: tapper ];
    
    
    registerViewController *r = [[ registerViewController alloc ] init ];
    [ r printIT ];
    

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}

-(void)hideSidePanel: (UIGestureRecognizer *) gesture {
    
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
        
        
            
            [ transV setHidden: YES ];
            
            [ UIView transitionWithView: sidePanel  duration: 0.2 options: UIViewAnimationOptionCurveEaseIn animations:^{
                
                CGRect frame = self->sidePanel.frame;
                frame.origin.x = -self->sidePanel.frame.size.width ;
                self->sidePanel.frame = frame;
                
            } completion: nil ];
            
            
        }
    
}

- (IBAction)buttonPressed:(id)sender {
    
    if ( sender == menuBtn ) {
        
        [ transV setHidden: NO ];
        
        [ UIView transitionWithView: sidePanel  duration: 0.2 options: UIViewAnimationOptionCurveEaseIn animations:^{
            
            CGRect frame = self->sidePanel.frame;
            frame.origin.x = 0 ;
            self->sidePanel.frame = frame;
            
        } completion: nil ];
            
        
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

- (IBAction)menuBtnn:(UIButton *)sender {
    
    if ( sender == menuBtn ) {
        
        [ transV setHidden: NO ];
        
        [ UIView transitionWithView: sidePanel  duration: 0.2 options: UIViewAnimationOptionCurveEaseIn animations:^{
            
            CGRect frame = self->sidePanel.frame;
            frame.origin.x = 0 ;
            self->sidePanel.frame = frame;
            
        } completion: nil ];
        
        
    }
}

- (IBAction)accelerateButton:(id)sender {
    
    // trigger segue if register success
   // UIStoryboard *mainStoryboard = [ UIStoryboard storyboardWithName:@"Sidebar" bundle: nil ];
  //  UIViewController *vc = [ mainStoryboard instantiateViewControllerWithIdentifier: @"mainToAccelerate"];
   // [ self presentViewController: vc animated: YES completion: nil ];
    
  
    
}

- (IBAction)logoutButton:(id)sender {
    
        // Log out firebase session
        NSError *signOutError;
        BOOL status = [[FIRAuth auth] signOut:&signOutError];
        if (!status) {
            NSLog(@"Error signing out: %@", signOutError);
            return;
        }else{
            NSLog(@"Successfully Signout");
        }
    
    // after log out redirect to landing page 
    // perform segue
    // trigger segue if register success
    UIStoryboard *mainStoryboard = [ UIStoryboard storyboardWithName:@"Main" bundle: nil ];
    UIViewController *vc = [ mainStoryboard instantiateViewControllerWithIdentifier: @"landingPage"];
    [ self presentViewController: vc animated: YES completion: nil ];
    
}
@end
