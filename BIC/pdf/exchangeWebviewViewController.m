//
//  exchangeWebviewViewController.m
//  BIC
//
//  Created by phongpadid on 4/23/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "exchangeWebviewViewController.h"

@interface exchangeWebviewViewController ()

@end

@implementation exchangeWebviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

              // set it as webview when this page is loaded
              [self.webView.scrollView setScrollEnabled: false ];
              [self.webView loadHTMLString: [self getHTMLString ] baseURL: [ NSURL URLWithString: @""]];
    
    
              // create button on the right top
                UIBarButtonItem *btnSavePDF = [[ UIBarButtonItem alloc ] initWithTitle: @"Save as PDF" style: UIBarButtonItemStylePlain target: self action: @selector(savePDF:)];
               // self.navigationItem.rightBarButtonItem = btnSavePDF;
               [ self.navigationItem setRightBarButtonItem: btnSavePDF ]; 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSString *) getHTMLString {
    
    
        NSString *filePath = [[ NSBundle mainBundle ] pathForResource: @"exchange" ofType:@"html" ];
        NSString *strHTML = [ NSString stringWithContentsOfFile: filePath encoding: NSUTF8StringEncoding error: nil ];
    
        // replace data from Dictionary to the webview
            if ( self.dictData ) {
            
                strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#name" withString: [ _dictData valueForKey: @"nameKey"]];
                strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#age" withString: [ _dictData valueForKey: @"ageKey"]];
                
            }
            else {
                
                NSLog( @" someting went wrong ! ");
            }
    
    
            NSLog (@"nsdic in the webviewpage ! = %@", self.dictData);
            return strHTML ;

 }

- ( void ) savePDF:(id)sender {
    
    
    
}

@end
