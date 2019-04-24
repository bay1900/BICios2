//
//  exchangeViewController.m
//  BIC
//
//  Created by phongpadid on 4/23/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "exchangeViewController.h"
#import "exchangeWebviewViewController.h"

@interface exchangeViewController ()

@end

@implementation exchangeViewController


@synthesize nameTF, ageTF;


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

- (IBAction)openHTML:(id)sender {

  
    
           // trigger segue if register success
            UIStoryboard *mainStoryboard = [ UIStoryboard storyboardWithName:@"Main" bundle: nil ];
            exchangeWebviewViewController *vc = [ mainStoryboard instantiateViewControllerWithIdentifier: @"exchangePDF"];
    
    
    
            NSMutableDictionary *dict = [[ NSMutableDictionary alloc ] init ];
    
            [ dict setObject: self.nameTF.text forKey:@"nameKey"];
            [ dict setObject: self.ageTF.text forKey:@"ageKey"];
    
            // pass data `
            vc.dictData = dict;
    
            NSLog (@"nsdic = %@", dict);
    
            // perform animate 
            [ self presentViewController: vc animated: YES completion: nil ];
}


@end
