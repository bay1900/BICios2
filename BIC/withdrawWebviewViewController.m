//
//  withdrawWebviewViewController.m
//  BIC
//
//  Created by phongpadid on 6/13/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "withdrawWebviewViewController.h"

@interface withdrawWebviewViewController ()

@end

@implementation withdrawWebviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //    // set it as webview when this page is loaded
    [_webViewWithdraw.scrollView setScrollEnabled: false ];
    //[webView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_webViewWithdraw loadHTMLString: [self getHTMLString ] baseURL: [ NSURL URLWithString: @""]];
}



-(NSString *) getHTMLString {
    
    
    NSString *filePath = [[ NSBundle mainBundle ] pathForResource: @"statement" ofType:@"html" ];
    NSString *strHTML = [ NSString stringWithContentsOfFile: filePath encoding: NSUTF8StringEncoding error: nil ];
    
    // replace data from Dictionary to the webview
    if ( self.dictShowWeb ) {
        
        
       
        
        //  strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#timestamp" withString: [ _dictShowWeb valueForKey: @"timestamp"]];
        
        
    }
    else {
        
        NSLog( @" someting went wrong ! ");
    }
    
    
  //  NSLog (@"nsdic in the webviewpage ! = %@", self.dictData);
    return strHTML ;
    //
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
