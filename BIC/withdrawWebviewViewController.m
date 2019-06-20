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
    
    NSString *filePath = [[ NSBundle mainBundle ] pathForResource: @"withdraw" ofType:@"html" ];
    NSString *strHTML = [ NSString stringWithContentsOfFile: filePath encoding: NSUTF8StringEncoding error: nil ];
    
    NSLog(@"show web %@", _dictShowWeb ); 
    
    // replace data from Dictionary to the webview
    if ( self.dictShowWeb ) {
        
        
        
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#address" withString: [ _dictShowWeb valueForKey: @"address"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#country" withString: [ _dictShowWeb valueForKey: @"country"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#phone" withString: [ _dictShowWeb valueForKey: @"phone"]];
        
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#date" withString: [ _dictShowWeb valueForKey: @"date"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#billNumber" withString: [ _dictShowWeb valueForKey: @"billNumber"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#timestamp" withString: [ _dictShowWeb valueForKey: @"timestamp"]];
        
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#futurepickup" withString: [ _dictShowWeb valueForKey: @"futurepickup"]];


   
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#hundred" withString: [ _dictShowWeb valueForKey: @"hundred"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#fifty" withString: [ _dictShowWeb valueForKey: @"fifty"]];
        
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#twenty" withString: [ _dictShowWeb valueForKey: @"twenty"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#ten" withString: [ _dictShowWeb valueForKey: @"ten"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#five" withString: [ _dictShowWeb valueForKey: @"five"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#hasipCent" withString: [ _dictShowWeb valueForKey: @"hasipCent"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#saoCent" withString: [ _dictShowWeb valueForKey: @"saoCent"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#zipCent" withString: [ _dictShowWeb valueForKey: @"zipCent"]];
        
        
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#total" withString: [ _dictShowWeb valueForKey: @"total"]];

    //    strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#futurepickup" withString: [ _dictShowWeb valueForKey: @"futurepickup"]];

        
    } else {
        NSLog( @" someting went wrong for webview ! ");
    }
    return strHTML ;
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
