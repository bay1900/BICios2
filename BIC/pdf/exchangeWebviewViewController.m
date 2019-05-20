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
@synthesize  testTextWeb, testForWeb;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    testTextWeb.text = testForWeb ;
//    NSLog( @"the testText :::::::::::::::: %@", testForWeb );
//    
//    
//    // set it as webview when this page is loaded
//    [_webview.scrollView setScrollEnabled: false ];
//    //[webView setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [_webview loadHTMLString: [self getHTMLString ] baseURL: [ NSURL URLWithString: @""]];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//
//-(NSString *) getHTMLString {
//
//
//    NSString *filePath = [[ NSBundle mainBundle ] pathForResource: @"exchange" ofType:@"html" ];
//    NSString *strHTML = [ NSString stringWithContentsOfFile: filePath encoding: NSUTF8StringEncoding error: nil ];
//
//    // replace data from Dictionary to the webview
//    if ( self.dictData ) {
//
//        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#name" withString: [ _dictData valueForKey: @"nameKey"]];
//        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#age" withString: [ _dictData valueForKey: @"ageKey"]];
//
//    }
//    else {
//
//        NSLog( @" someting went wrong ! ");
//    }
//
//
//    NSLog (@"nsdic in the webviewpage ! = %@", self.dictData);
//    return strHTML ;
//
//}

- ( void ) savePDF:(id)sender {
    
    
    
}

@end
