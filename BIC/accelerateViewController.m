//
//  accelerateViewController.m
//  BIC
//
//  Created by phongpadid on 4/23/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "accelerateViewController.h"
#import "exchangeViewController.h"

@interface accelerateViewController ()

@end

@implementation accelerateViewController

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




- (IBAction)exchangeButton:(id)sender {
    
    // trigger segue if register success
   UIStoryboard *mainStoryboard = [ UIStoryboard storyboardWithName:@"Main" bundle: nil ];
   UIViewController *vc = [ mainStoryboard instantiateViewControllerWithIdentifier: @"exchange"];
   [ self presentViewController: vc animated: YES completion: nil ];
    
   // [self performSegueWithIdentifier: @"mainToExchange" sender:self];
    
}


@end
