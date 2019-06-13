//
//  statementWebviewViewController.m
//  BIC
//
//  Created by phongpadid on 6/11/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "statementWebviewViewController.h"
#import "statementWebviewViewController.h"

@interface statementWebviewViewController ()

@end

@implementation statementWebviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    // set it as webview when this page is loaded
    [_webViewStatement.scrollView setScrollEnabled: false ];
    //[webView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_webViewStatement loadHTMLString: [self getHTMLString ] baseURL: [ NSURL URLWithString: @""]];
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}




-(NSString *) getHTMLString {
    
    
    NSString *filePath = [[ NSBundle mainBundle ] pathForResource: @"statement" ofType:@"html" ];
    NSString *strHTML = [ NSString stringWithContentsOfFile: filePath encoding: NSUTF8StringEncoding error: nil ];
    
    // replace data from Dictionary to the webview
    if ( self.dictShowWeb ) {


        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#address" withString: [ _dictShowWeb valueForKey: @"address"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#country" withString: [ _dictShowWeb valueForKey: @"country"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#phone" withString: [ _dictShowWeb valueForKey: @"phone"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#date" withString: [ _dictShowWeb valueForKey: @"date"]];
        
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#billNumber" withString: [ _dictShowWeb valueForKey: @"billNumber"]];
          strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#timestamp" withString: [ _dictShowWeb valueForKey: @"timestamp"]];
        
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#statementBegin" withString: [ _dictShowWeb valueForKey: @"startStatement"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#statementEnd" withString: [ _dictShowWeb valueForKey: @"endStatement"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#futurepickup" withString: [ _dictShowWeb valueForKey: @"futurepickup"]];
        
      //  strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#timestamp" withString: [ _dictShowWeb valueForKey: @"timestamp"]];


    }
    else {

        NSLog( @" someting went wrong ! ");
    }


    NSLog (@"nsdic in the webviewpage ! = %@", self.dictData);
   return strHTML ;
//    
}

- ( void ) savePDF:(id)sender {
    
    
    
}


@end
